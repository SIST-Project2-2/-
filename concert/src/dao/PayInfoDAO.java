package dao;

import java.util.ArrayList;

import vo.PayInfoVO;

public class PayInfoDAO extends DAO {
	
	// 해당 주문 번호의 결제 정보를 반환하는 함수
	public PayInfoVO getPayInfo(int no) { // no: 주문 번호
		PayInfoVO payInfo = new PayInfoVO();
		
		try {
			String sql = " select o.no, m.first_name, m.last_name, m.phone, to_char(c.cdate, 'YYYY/MM/DD'), c.price "
					+ " from orders o, concerts c, members m "
					+ " where o.no = ? and o.concerts_no = c.no and o.id = m.id ";
			
			getPreparedStatement(sql);
			
			pstmt.setInt(1, no);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				payInfo.setNo(rs.getInt(1));
				payInfo.setFirstName(rs.getString(2));
				payInfo.setLastName(rs.getString(3));
				payInfo.setHp(rs.getString(4));
				payInfo.setDate(rs.getString(5));
				payInfo.setPrice(rs.getInt(6));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		payInfo.setSeats(getOrderSeats(no)); // 좌석 정보 조회
		
		return payInfo;
	}
	
	// 해당 주문 번호의 결제 좌석 번호를 모두 반환하는 함수
	private ArrayList<String> getOrderSeats(int no) { // no: order_no
		ArrayList<String> seats = new ArrayList<String>();
		
		try {
			String sql = " select seat_no from seats where order_no = ? ";
			
			getPreparedStatement(sql);
			
			pstmt.setInt(1, no);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				seats.add(rs.getString(1));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return seats;
	}
}
