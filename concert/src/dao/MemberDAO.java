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
	public String find_id(String name, String nickname, String email) {
		String result = null;

		try {
			String sql = "SELECT ID FROM MEMBERS WHERE NAME=? AND EMAIL=LOWER(?)";
			getPreparedStatement(sql);

			pstmt.setString(1, name);
			pstmt.setString(2, email);

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
	public String find_password(String id, String name, String date, String phone) {
		String result = null;

		try {
			String sql = "SELECT PW FROM MEMBERS WHERE ID=? AND NAME=? AND TO_CHAR(BIRTHDATE, 'YYYY-MM-DD')=? AND PHONE=?";
			getPreparedStatement(sql);

			pstmt.setString(1, id);
			pstmt.setString(2, name);
			pstmt.setString(3, date);
			pstmt.setString(4, phone);

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
	public MemberVO get_profile(String id) {
		MemberVO member = null;

		try {
			String sql = "SELECT NO,ID,NICKNAME,NAME,TO_CHAR(BIRTHDATE, 'YYYY-MM-DD') AS BIRTHDATE,SEX,ADDRESS,PHONE,EMAIL FROM MEMBERS WHERE ID=?";
			getPreparedStatement(sql);

			pstmt.setString(1, id);

			rs = pstmt.executeQuery();
			if (rs.next()) { // 입력 정보 맞음
				member = new MemberVO();
				member.setNo(rs.getInt(1));
				member.setId(rs.getString(2));
				member.setNickname(rs.getString(3));
				member.setName(rs.getString(4));
				member.setBirth_date(rs.getString(5));
				member.setSex(rs.getString(6));
				member.setAddress(rs.getString(7));
				member.setPhone(rs.getString(8));
				member.setEmail(rs.getString(9));
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
}
