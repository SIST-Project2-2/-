package dao;

import java.lang.reflect.Field;
import java.util.ArrayList;

import util.Security;
import vo.MemberVO;

public class MemberDAO extends DAO {

	// 아이디 중복 체크
	public int idCheck(String id) {
		int result = 0;
		String sql = "SELECT COUNT(*) FROM MEMBERS WHERE ID = ? ";
		getPreparedStatement(sql);

		try {

			pstmt.setString(1, id);

			rs = pstmt.executeQuery();
			while (rs.next()) {
				result = rs.getInt(1);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		close();
		return result;
	}

	// 닉네임 중복 체크
	public int nickCheck(String nick) {
		int result = 0;
		String sql = "SELECT COUNT(*) FROM MEMBERS WHERE NICKNAME = ? ";
		getPreparedStatement(sql);

		try {

			pstmt.setString(1, nick);

			rs = pstmt.executeQuery();
			while (rs.next()) {
				result = rs.getInt(1);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		close();
		return result;
	}

	// 로그인
	public int login(String id, String pw) {
		int result = -2;
		try {
			String sql = "SELECT PW, SALT FROM MEMBERS WHERE id=?";
			getPreparedStatement(sql);

			pstmt.setString(1, id);

			rs = pstmt.executeQuery();
			if (rs.next()) {
				String salt = rs.getString(2);
				if (rs.getString(1).equals(Security.pwHashing(pw, salt))) {
					result = 1; // 로그인 성공
				} else {
					result = 0; // 비밀번호 틀림
				}
			} else {
				result = -1; // 아이디 없음
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		// 권한을 추가로 받아와야해서 close를 실행하지 않음
		return result; // 오류
	}

	// 아이디 찾기
	public String find_id(MemberVO member) {
		String result = null;

		try {
			String sql = "SELECT ID FROM MEMBERS WHERE LOWER(FIRST_NAME) = LOWER(?) AND LOWER(LAST_NAME) = LOWER(?) AND LOWER(EMAIL) = LOWER(?)";
			getPreparedStatement(sql);

			pstmt.setString(1, member.getFirst_name());
			pstmt.setString(2, member.getLast_name());
			pstmt.setString(3, member.getEmail());
			rs = pstmt.executeQuery();
			if (rs.next()) {
				result = rs.getString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		close();
		return result;
	}

	// SALT 가져오기
	public String getSalt(MemberVO member) {
		String result = null;
		try {
			String sql = "SELECT SALT FROM MEMBERS WHERE ID = ?";
			getPreparedStatement(sql);

			pstmt.setString(1, member.getId());

			rs = pstmt.executeQuery();
			if (rs.next()) {
				result = rs.getString(1);
				System.out.println("getSalt(): 성공");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	// 비밀번호가 일치하는지 확인
	public boolean checkPassword(MemberVO member) {
		boolean result = false;
		String salt = getSalt(member);
		String hashedPw = Security.pwHashing(member.getPw(), salt);
		member.setPw(hashedPw);
		try {
			String sql = "SELECT COUNT(*) FROM MEMBERS WHERE ID = ? AND PW = ?";
			getPreparedStatement(sql);

			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getPw());

			rs = pstmt.executeQuery();
			if (rs.next()) {
				if (rs.getInt(1) == 1) {
					result = true;
				}
				System.out.println("checkPassword(): " + result);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	// 비밀번호 변경
	public int changePassword(MemberVO member, String newPw) {
		int result = -2;
		if (checkPassword(member)) { // 기존에 입력한 패스워드가 맞는지 확인. 맞으면 SALT 재생성하고 비밀번호 변경
			try {
				String salt = Security.getSalt(); // 랜덤 SALT 생성
				String hashedPw = Security.pwHashing(newPw, salt); // 비밀번호 암호화
				String sql = "UPDATE MEMBERS SET PW = ?, SALT = ? WHERE ID = ? AND PW = ?";
				getPreparedStatement(sql);

				pstmt.setString(1, hashedPw);
				pstmt.setString(2, salt);
				pstmt.setString(3, member.getId());
				pstmt.setString(4, member.getPw());

				result = pstmt.executeUpdate();
				System.out.println("changePassword(): " + result);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		close();
		return result;

	}

	// 특정 유저의 비밀번호 초기화. 비밀번호와 SALT 생성 후 비밀번호 반환
	public String resetPassword(MemberVO member) {
		String result = null;
		String pw = Security.getRandomString(); // 랜덤 비밀번호 생성
		String salt = Security.getSalt(); // 랜덤 SALT 생성
		String hashedPw = Security.pwHashing(pw, salt); // 비밀번호 암호화
		try {
			String sql = "UPDATE MEMBERS SET PW = ?, SALT = ? WHERE ID = ? AND LOWER(FIRST_NAME) = LOWER(?) AND LOWER(LAST_NAME) = LOWER(?) AND TO_CHAR(BIRTHDATE, 'YYYY-MM-DD') = ? AND PHONE = ?";
			getPreparedStatement(sql);

			pstmt.setString(1, hashedPw);
			pstmt.setString(2, salt);
			pstmt.setString(3, member.getId());
			pstmt.setString(4, member.getFirst_name());
			pstmt.setString(5, member.getLast_name());
			pstmt.setString(6, member.getBirth_date());
			pstmt.setString(7, member.getPhone());

			int val = pstmt.executeUpdate();
			if (val == 1) { // 비밀번호가 정상적으로 업로드되면 비밀번호 반환
				result = pw;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		close();
		return result;
	}

	// 비밀번호 찾기
	public String find_password(MemberVO member) {
		String result = null;

		try {
			String sql = "SELECT PW FROM MEMBERS WHERE ID=? AND FIRST_NAME=? AND LAST_NAME=? AND TO_CHAR(BIRTHDATE, 'YYYY-MM-DD')=? AND PHONE=?";
			getPreparedStatement(sql);

			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getFirst_name());
			pstmt.setString(3, member.getLast_name());
			pstmt.setString(4, member.getBirth_date());
			pstmt.setString(5, member.getPhone());

			rs = pstmt.executeQuery();
			if (rs.next()) { // 입력 정보 맞음
				result = rs.getString(1);
			} else { // 입력 정보 틀림

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	// 회원가입
	public int join(MemberVO member) {
		int result = -2;
		try {
			String sql = "INSERT INTO MEMBERS(NO, ID, PW, NICKNAME, FIRST_NAME, LAST_NAME, BIRTHDATE, SEX, ADDRESS, PHONE, EMAIL, EMAILHASH, SALT) VALUES(MEMBERS_NO_SEQ.NEXTVAL, ?, ?, ?, ?, ?, TO_DATE(?, 'YYYY-MM-DD'), ?, ?, ?, ?, ?, ?)";
			getPreparedStatement(sql);

			member.setSalt(Security.getSalt());

			pstmt.setString(1, member.getId());
			pstmt.setString(2, Security.pwHashing(member.getPw(), member.getSalt()));
			pstmt.setString(3, member.getNickname());
			pstmt.setString(4, member.getFirst_name());
			pstmt.setString(5, member.getLast_name());
			pstmt.setString(6, member.getBirth_date());
			pstmt.setString(7, member.getSex());
			pstmt.setString(8, member.getAddress());
			pstmt.setString(9, member.getPhone());
			pstmt.setString(10, member.getEmail());
			pstmt.setString(11, member.getEmailHash());
			pstmt.setString(12, member.getSalt());

			result = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		close();
		return result;
	}

	// 사용자가 이메일 인증이 되었는지 확인해 주는 함수
	public int emailCheck(String id) {

		int result = -2;

		try {
			String sql = "select emailchecked from members where id=? ";
			getPreparedStatement(sql);

			pstmt.setString(1, id);

			rs = pstmt.executeQuery();
			if (rs.next()) {
				// 사용자가 이메일 인증 성공일 경우 1값 반환
				result = rs.getInt(1);
			} else {
				result = 0;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		// 사용자가 이메일 인증 실패일 경우 0값 반환
		return result;
	}

	// 사용자의 이메일 인증이 완료되었을 경우 정보 update(이메일 인증 수행)
	public int updateEmailCheck(String id) {

		try {
			String sql = "update members set emailchecked = 1 where id = ?";
			getPreparedStatement(sql);

			pstmt.setString(1, id);

			pstmt.executeUpdate();
			return 1;

		} catch (Exception e) {
			e.printStackTrace();
		}
		close();
		// 사용자가 이메일 인증 실패일 경우 0값 반환
		return 0;
	}

	// 사용자의 id 값에 따라 저장된 email 불러오기
	public String memberEmail(String id) {

		try {
			String sql = "select email from members where id = ? ";
			getPreparedStatement(sql);

			pstmt.setString(1, id);

			rs = pstmt.executeQuery();
			if (rs.next()) {

				return rs.getString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		close();
		return null;
	}

	// 프로필 정보 가져오기
	public MemberVO get_profile(String id) {
		MemberVO member = null;

		try {
			String sql = "SELECT NO, ID, NICKNAME, FIRST_NAME, LAST_NAME, BIRTHDATE, SEX, ADDRESS, PHONE, EMAIL, CDATE ";
			sql += " FROM (SELECT NO,ID,NICKNAME,FIRST_NAME, LAST_NAME,TO_CHAR(BIRTHDATE, 'YYYY-MM-DD') AS BIRTHDATE,SEX,ADDRESS,PHONE,EMAIL ";
			sql += " FROM MEMBERS  ";
			sql += " WHERE ID = ?) A ";
			sql += " LEFT OUTER JOIN ";
			sql += " (SELECT ID, TO_CHAR(MAX(CDATE), 'YYYY-MM-DD') CDATE ";
			sql += " FROM ORDERS O JOIN CONCERTS C ON O.CONCERTS_NO = C.NO ";
			sql += " WHERE O.ID = ? ";
			sql += " GROUP BY O.ID) B ";
			sql += " USING(ID)";
			getPreparedStatement(sql);

			pstmt.setString(1, id);
			pstmt.setString(2, id);

			rs = pstmt.executeQuery();
			System.out.println(1);
			if (rs.next()) { // 입력 정보 맞음
				System.out.println(2);
				member = new MemberVO();
				member.setNo(rs.getInt(1));
				member.setId(rs.getString(2));
				member.setNickname(rs.getString(3));
				member.setFirst_name(rs.getString(4));
				member.setLast_name(rs.getString(5));
				member.setBirth_date(rs.getString(6));
				member.setSex(rs.getString(7));
				member.setAddress(rs.getString(8));
				member.setPhone(rs.getString(9));
				member.setEmail(rs.getString(10));
				member.setIssueDate(rs.getString(11));
			} else { // 입력 정보 틀림
				System.out.println(3);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return member;
	}

	// 프로필 수정하기
	public int edit_profile(MemberVO member) {
		int result = -2;
		try {
			String sql = "UPDATE MEMBERS SET NICKNAME=?, ADDRESS=?, BIRTHDATE=TO_DATE(?, 'YYYY-MM-DD'), PHONE=? WHERE ID=?";
			getPreparedStatement(sql);

			pstmt.setString(1, member.getNickname());
			pstmt.setString(2, member.getAddress());
			pstmt.setString(3, member.getBirth_date());
			pstmt.setString(4, member.getPhone());
			pstmt.setString(5, member.getId());

			int val = pstmt.executeUpdate();
			if (val == 1) { // 입력 정보 맞음
				result = 1;
			} else { // 입력 정보 틀림
				result = 0;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		close();
		return result;
	}

	// 아이디 중복 확인
	public int check_nickname(MemberVO member) {
		int result = -2; // 기본값: 데이터베이스 연결 실패
		try {
			String sql = "SELECT COUNT(NICKNAME) FROM MEMBERS WHERE LOWER(NICKNAME)=LOWER(?)";
			getPreparedStatement(sql);

			pstmt.setString(1, member.getNickname());

			rs = pstmt.executeQuery();

			if (rs.next()) {
				result = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	// 회원탈퇴 신청
	public int request_withdrawal(MemberVO member) {
		int result = -2;
		try {
			String sql = "UPDATE MEMBERS SET WITHDRAWAL=1 WHERE ID=?";
			getPreparedStatement(sql);

			pstmt.setString(1, member.getId());

			int val = pstmt.executeUpdate();
			if (val == 1) { // 입력 정보 맞음
				result = 1;
			} else { // 입력 정보 틀림
				result = 0;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public int requestWithdrawal(String id) {
		MemberVO member = new MemberVO();
		member.setId(id);
		return request_withdrawal(member);
	}

	// 회원탈퇴 요청을 했는지 확인
	public boolean hasWithdrawn(String id) {
		boolean result = false;
		try {
			String sql = "SELECT WITHDRAWAL FROM MEMBERS WHERE ID = ?";
			getPreparedStatement(sql);

			pstmt.setString(1, id);

			rs = pstmt.executeQuery();

			int val = -2;

			if (rs.next()) {
				val = rs.getInt(1);
			}

			if (val == 1) {
				result = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	// 회원탈퇴 취소
	public int cancelWithdrawal(String id) {
		int result = -2;
		try {
			String sql = "UPDATE MEMBERS SET WITHDRAWAL = 0 WHERE ID = ?";
			getPreparedStatement(sql);

			pstmt.setString(1, id);

			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		close();
		return result;
	}

	// 지원 작성
	// 회원 전체 리스트
	public ArrayList<MemberVO> getList() {
		ArrayList<MemberVO> list = new ArrayList<MemberVO>();
		String sql = "select id, nickname, first_name, last_name, phone, email " + " from members ";

		getPreparedStatement(sql);

		try {
			rs = pstmt.executeQuery();
			while (rs.next()) {
				MemberVO vo = new MemberVO();
				vo.setId(rs.getString(1));
				vo.setNickname(rs.getString(2));
				vo.setFirst_name(rs.getString(3));
				vo.setLast_name(rs.getString(4));
				vo.setPhone(rs.getString(5));
				vo.setEmail(rs.getString(6));

				list.add(vo);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		close();
		return list;
	}

	public ArrayList<MemberVO> getList(int start, int end) {
		ArrayList<MemberVO> list = new ArrayList<MemberVO>();
		String sql = "select id, nickname, first_name, last_name, phone, email, withdrawal " + " from (select rownum rno, id, nickname, first_name, last_name, phone, email, withdrawal " + " from (select id, nickname, first_name, last_name, phone, email, withdrawal from members " + " order by withdrawal desc)) " + " where rno between ? and ?";

		getPreparedStatement(sql);

		try {
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);

			rs = pstmt.executeQuery();
			while (rs.next()) {
				MemberVO vo = new MemberVO();
				vo.setId(rs.getString(1));
				vo.setNickname(rs.getString(2));
				vo.setFirst_name(rs.getString(3));
				vo.setLast_name(rs.getString(4));
				vo.setPhone(rs.getString(5));
				vo.setEmail(rs.getString(6));
				vo.setWithdrawal(rs.getString(7));

				list.add(vo);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	/* 전체 카운트 가져오기 */
	// execTotalCount()
	public int execTotalCount() {
		int count = 0;
		String sql = " select count(*) from members";
		getPreparedStatement(sql);

		try {
			rs = pstmt.executeQuery();
			if (rs.next())
				count = rs.getInt(1);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return count;
	}

	// 회원 검색-id
	/**
	 * public ArrayList<MemberVO> getSearchId() { ArrayList<MemberVO> list = new ArrayList<MemberVO>(); String sql = "select id, nickname, first_name, last_name, phone, email "; sql += " from members ";
	 * 
	 * getPreparedStatement(sql);
	 * 
	 * try { rs = pstmt.executeQuery(); while (rs.next()) { MemberVO vo = new MemberVO(); vo.setId(rs.getString(1)); vo.setNickname(rs.getString(2)); vo.setFirst_name(rs.getString(3)); vo.setLast_name(rs.getString(4)); vo.setPhone(rs.getString(5)); vo.setEmail(rs.getString(6));
	 * 
	 * list.add(vo); }
	 * 
	 * } catch (Exception e) { e.printStackTrace(); } close(); return list; }
	 */

	// 회원 삭제
	public boolean getDeleteResult(String id) {
		boolean result = false;
		MemberVO vo = new MemberVO();
		String sql = "delete from members where id=? and withdrawal = 1";

		getPreparedStatement(sql);

		try {
			pstmt.setString(1, id);

			int value = pstmt.executeUpdate();
			if (value != 0) {
				result = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		close();
		return result;
	}

	// 멤버 검색 결과 중 특정 페이지 조회
	public ArrayList<MemberVO> get_member_search_list(int rpage, int page_size, MemberVO search_target) {
		ArrayList<MemberVO> list = new ArrayList<MemberVO>();

		try {
			String sql = getSql(rpage, page_size, search_target);
			getPreparedStatement(sql);

			pstmt.setInt(1, page_size);
			pstmt.setInt(2, rpage);
			pstmt.setInt(3, page_size);
			pstmt.setInt(4, rpage);

			rs = pstmt.executeQuery();
			while (rs.next()) {
				MemberVO vo = new MemberVO();
				vo.setId(rs.getString(3));
				vo.setNickname(rs.getString(5));
				vo.setFirst_name(rs.getString(6));
				vo.setLast_name(rs.getString(7));
				vo.setPhone(rs.getString(11));
				vo.setWithdrawal(rs.getString(13));
				vo.setEmail(rs.getString(14));

				list.add(vo);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	// 조건에 해당하는 sql 구문 생성 메소드
	public String getSql(int rpage, int page_size, MemberVO search_target) {
		String sql = null;
		String sql_where = "";// 검색 조건 설정하는 where 구문
		boolean sql_whereHasCreated = false;

		try {
			if (search_target != null) { // 검색 조건이 존재하면 실행, 존재하지 않으면 null
				Field[] fields = search_target.getClass().getDeclaredFields();
				for (Field field : fields) {
					field.setAccessible(true); // private 설정된 필드도 접근 가능하도록 설정
					if (field.get(search_target) != null) { // 해당 필드가 null이 아니면 실행
						if ((field.getName().equals("no") || field.getName().equals("emailChecked")) && (int) field.get(search_target) == -1) { // no 필드는 int 타입이므로 없으면 null이 아닌 -1을 저장
							continue;
						}
						if (sql_where.equals("")) { // 해당 필드에 값이 존재하고 where 구문이 존재하지 않으면 where 생성
							sql_where += " where ";
						}
						if (sql_whereHasCreated) { // where 구문에 조건을 추가하는게 첫번째가 아니면 or 추가
							sql_where += " or ";
						}
						// 해당 필드가 존재하면 where 구문에 "속성명 like('%속성값%')" 을 추가함
						sql_where += "LOWER(" + field.getName() + ") LIKE(LOWER('%" + field.get(search_target) + "%')) ";
						sql_whereHasCreated = true;

					}
				}

			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		sql = "select * from (select rownum as rno, no, id, pw, nickname, first_name, last_name, birthdate, sex, address, phone, authority, withdrawal, email, emailHash, emailChecked, salt from (select * from members " + sql_where + " order by withdrawal desc, no desc) c)";
		if (rpage != 0) {
			sql += " where rno > ? * (? - 1) and rno <= ? * ?";
		}
		System.out.println("생성된 sql 구문: " + sql);
		return sql;
	}

	// 해당 유저의 권한(일반유저, 관리자, 테스터 등) 확인
	public int getAuthority(String id) {
		int result = 0;

		try {
			String sql = " select authority from members where id = ? ";

			getPreparedStatement(sql);

			pstmt.setString(1, id);

			rs = pstmt.executeQuery();
			if (rs.next()) {
				String type = rs.getString(1);
				if (type.equals("USER")) {
					result = 0;
				} else if (type.equals("admin")) {
					result = 1;
				} else if (type.equals("tester")) {
					result = 2;
				} else {
					result = -1; // 확인되지 않은 권한
				}
			} else { // 회원 정보가 없음
				result = -1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		close();
		return result;
	}
}
