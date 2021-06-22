package dao;

public class RecommendDAO extends DAO{

	
	public int recommend(String userId, int no, String userIp) {
		String sql = "INSERT INTO RECOMMEND VALUES(?,?,?)";
		getPreparedStatement(sql);
		try {
			pstmt.setString(1, userId);
			pstmt.setInt(2,no);
			pstmt.setString(3,userIp);
			
			return pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return -1;
	}
}
