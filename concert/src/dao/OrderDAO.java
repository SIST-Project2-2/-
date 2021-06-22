package dao;

import vo.OrderVO;

//반환형이 int인 경우 성공하면 1, 성공 못하면 0, SQL 에러나면 -1, 자바에서 에러나면 -2
public class OrderDAO extends DAO {

	// 다음 예매 번호 생성하기
	public int getNextOrderNo() {
		int result = -2;
		try {
			String sql = "SELECT ORDERS_NO_SEQ.NEXTVAL FROM DUAL";
			getPreparedStatement(sql);

			rs = pstmt.executeQuery();
			if (rs.next()) {
				result = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	// 예매 정보 추가하기
	public int insertOrder(OrderVO vo) {
		int result = -2;
		try {
			String sql = "INSERT INTO ORDERS VALUES(?, ?, ?)";
			getPreparedStatement(sql);

			pstmt.setInt(1, vo.getNo());
			pstmt.setString(2, vo.getId());
			pstmt.setInt(3, vo.getConcert_no());

			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		close();
		return result;
	}
}
