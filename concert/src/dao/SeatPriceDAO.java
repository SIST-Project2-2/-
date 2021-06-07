package dao;

public class SeatPriceDAO extends DAO {

	// 반환형이 int인 경우 성공하면 1, 성공 못하면 0, SQL 에러나면 -1, 자바에서 에러나면 -2

	// 좌석 등급 별 가격을 등록
	protected int setPrice(int concert_no, int price_a, int price_b, int price_c, int price_d) {
		int result = -2;
		try {
			String sql = "INSERT INTO SEAT_PRICE ";
			sql += "		SELECT " + concert_no + ", 'A', ? FROM DUAL UNION ALL ";
			sql += "		SELECT " + concert_no + ", 'B', ? FROM DUAL UNION ALL ";
			sql += "		SELECT " + concert_no + ", 'C', ? FROM DUAL UNION ALL ";
			sql += "		SELECT " + concert_no + ", 'D', ? FROM DUAL";
			getPreparedStatement(sql);

			pstmt.setInt(1, price_a);
			pstmt.setInt(2, price_b);
			pstmt.setInt(3, price_c);
			pstmt.setInt(4, price_d);

			result = pstmt.executeUpdate(); // 4개 행을 입력하므로 값이 4가 되어야 정상 입력.
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}
