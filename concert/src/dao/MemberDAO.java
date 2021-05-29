package dao;

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
	public String find_id(String name, String nickname,String email) {
		String result = null;

		try {
			String sql = "SELECT ID FROM MEMBERS WHERE NAME=? AND EMAIL=LOWER(?)";
			getPreparedStatement(sql);

			pstmt.setString(1, name);
			pstmt.setString(2, email);

			System.out.println(email);
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

}
