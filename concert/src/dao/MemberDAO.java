package dao;

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

		try {
			String sql = "select emailchecked from members where id = ? ";
			getPreparedStatement(sql);

			pstmt.setString(1, id);

			rs = pstmt.executeQuery();
			if (rs.next()) {
				// 사용자가 이메일 인증 성공일 경우 1값 반환
				return rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		close();
		// 사용자가 이메일 인증 실패일 경우 0값 반환
		return 0;
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
			String sql = "SELECT NO,ID,NICKNAME,FIRST_NAME, LAST_NAME,TO_CHAR(BIRTHDATE, 'YYYY-MM-DD') AS BIRTHDATE,SEX,ADDRESS,PHONE,EMAIL FROM MEMBERS WHERE ID=?";
			getPreparedStatement(sql);

			pstmt.setString(1, id);

			rs = pstmt.executeQuery();
			if (rs.next()) { // 입력 정보 맞음
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
			} else { // 입력 정보 틀림

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
		close();

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
	public ArrayList<MemberVO> getSearchId() {
		ArrayList<MemberVO> list = new ArrayList<MemberVO>();
		String sql = "select id, nickname, first_name, last_name, phone, email ";
		sql += " from members ";

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

		return result;
	}
}
