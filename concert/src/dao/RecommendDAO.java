package dao;

public class RecommendDAO extends DAO{

	
	public int recommend(int no, String userId, String userIp) {

		String sql = "INSERT INTO CHECKCOMMENT VALUES (?, ?, ?)";
		getPreparedStatement(sql);
		try {
			pstmt.setInt(1, no);
			pstmt.setString(2, userId);
			pstmt.setString(3, userIp);
			return pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return -1; 
	}
	
	public int report(int no, String userId, String userIp) {
		
		String sql = "INSERT INTO CHECKREPORT VALUES (?, ?, ?)";
		getPreparedStatement(sql);
		try {
			pstmt.setInt(1, no);
			pstmt.setString(2, userId);
			pstmt.setString(3, userIp);
			return pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return -1; 
	}
	
}
