package dao;

import vo.MemberVO;

public class MemberDAO extends DAO {
	// Field

	// Constructor
	public MemberDAO() {
		super();
	}

	// Method
	// 로그인
	public int login(String id, String pw) {
		int result = -2;
		try {
			String sql = "SELECT PW FROM MEMBERS WHERE id=?";
			getPreparedStatement(sql);

			pstmt.setString(1, id);

			rs = pstmt.executeQuery();
			if (rs.next()) {
				if (rs.getString(1).equals(pw)) {
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
			String sql = "SELECT ID FROM MEMBERS WHERE FIRST_NAME=? AND LAST_NAME=? AND EMAIL=LOWER(?)";
			getPreparedStatement(sql);

			pstmt.setString(1, member.getFirst_name());
			pstmt.setString(2, member.getLast_name());
			pstmt.setString(3, member.getEmail());
			System.out.println(member.getFirst_name() + ", " + member.getLast_name() + ", " + member.getEmail());
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

	// 프로필 정보 가져오기

	// 회원가입
	public int join(String id, String pw, String nickname, String first_name, String last_name, String birth_date, String sex, String address, String phone, String email) {

		try {
			String sql = "INSERT INTO MEMBERS VALUES(MEMBERS_NO_SEQ.NEXTVAL, ?, ?, ?, ?, ?, ?, ?, ?, ?, 'tester', 0, ?)";
			getPreparedStatement(sql);

			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			pstmt.setString(3, nickname);
			pstmt.setString(4, first_name);
			pstmt.setString(5, last_name);
			pstmt.setString(6, birth_date);
			pstmt.setString(7, sex);
			pstmt.setString(8, address);
			pstmt.setString(9, phone);
			pstmt.setString(10, email);

			return pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return -1;
	}

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
		return result;
	}

	// 아이디 중복 확인
	public int check_nickname(MemberVO member) {
		int result = -2; // 기본값: 데이터베이스 연결 실패
		try {
			String sql = "SELECT COUNT(NICKNAME) FROM MEMBERS WHERE LOWER(NICKNAME)=LOWER(?)";
			getPreparedStatement(sql);

			pstmt.setString(1, member.getId());

			int val = pstmt.executeUpdate();
			if (val == 1) { // 닉네임 있음
				result = 1;
			} else { // 닉네임 없음
				result = 0;
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
}
