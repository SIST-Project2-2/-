package dao;

public class MemberDAO extends DAO {
	// Field

	// Constructor
	public MemberDAO() {
		super();
	}

	// Method
	public int login(String id, String pw) {
		try {
			String sql = "SELECT PW FROM MEMBERS WHERE id=?";
			getPreparedStatement(sql);

			pstmt.setString(1, id);

			rs = pstmt.executeQuery();
			if (rs.next()) {
				if (rs.getString(1).equals(pw)) {
					return 1; // 로그인 성공
				} else {
					return 0; // 비밀번호 틀림
				}
			} else {
				return -1; // 아이디 없음
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2; // 오류
	}

}
