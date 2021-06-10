package dao;

import java.util.ArrayList;

import vo.PayInfoVO;

public class PayInfoDAO extends DAO {
	
	// 해당 유저의 주문이 맞는지 확인
	public boolean isCorrectUser(int no, String id) {
		boolean result =false;
		
		try {
			String sql = " select count(*) from orders where no = ? and id = ? ";
			
			getPreparedStatement(sql);
			
			pstmt.setInt(1, no);
			pstmt.setString(2, id);
			
			rs = pstmt.executeQuery();
			if(rs.next()) { // 해당 유저의 주문이 맞을 경우 true 반환, 아닐 경우 false(초기값) 반환
				if(rs.getInt(1) == 1) {
					result = true;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	// 해당 유저의 주문 정보들 불러오기
	public ArrayList<PayInfoVO> getTicketlist(String id) {
		ArrayList<PayInfoVO> list = new ArrayList<PayInfoVO>();
		PayInfoVO vo = null;
		
		try {
			String sql = " select m.first_name, m.last_name, o.no, c.no, c.artist, c.title, c.location, to_char(c.cdate, 'YYYY.MM.DD HH:Mi') "
					+ " from members m, orders o, concerts c "
					+ " where m.id = ? and o.id = m.id and o.concerts_no = c.no "
					+ " order by o.no desc ";
			
			getPreparedStatement(sql);
			
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				vo = new PayInfoVO();
				
				vo.setFirstName(rs.getString(1));
				vo.setLastName(rs.getString(2));
				vo.setOrderNo(rs.getInt(3));
				vo.setConcertNo(rs.getInt(4));
				vo.setArtist(rs.getString(5));
				vo.setTitle(rs.getString(6));
				vo.setLocation(rs.getString(7));
				vo.setDate(rs.getString(8));
				
				list.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		// 해당 사용자의 각 주문별 좌석 정보 구하기
		for(PayInfoVO ticket : list) {
			ticket.setSeats(getOrderSeats(ticket.getOrderNo()));
		}
		
		return list;
	}
	
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
				payInfo.setOrderNo(rs.getInt(1));
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
