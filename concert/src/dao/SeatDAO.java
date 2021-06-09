package dao;

import java.util.ArrayList;

import vo.SeatVO;

//반환형이 int인 경우 성공하면 1, 성공 못하면 0, SQL 에러나면 -1, 자바에서 에러나면 -2
public class SeatDAO extends DAO {

	// 특정 콘서트의 예매된 좌석들을 조회하는 함수
	public ArrayList<SeatVO> getReservedSeatList(int concert_no) {
		ArrayList<SeatVO> list = new ArrayList<SeatVO>();
		try {
			String sql = "SELECT * FROM SEATS WHERE CONCERT_NO = ?";
			getPreparedStatement(sql);

			pstmt.setInt(1, concert_no);

			rs = pstmt.executeQuery();
			while (rs.next()) {
				SeatVO vo = new SeatVO();
				vo.setConcert_no(rs.getInt(1));
				vo.setSeat_no(rs.getString(2));
				vo.setId(rs.getString(3));
				vo.setOrder_no(rs.getInt(4));
				list.add(vo);
			}
		} catch (Exception e) {
			list = null;
			e.printStackTrace();
		}
		return list;
	}

	// 좌석 여러개를 한번에 예매하는 함수
	public int reserveSeats(ArrayList<SeatVO> seatList) {
		int result = -2;
		try {
			String sql = "INSERT INTO SEATS ";
			int seatList_size = seatList.size();
			for (int i = 0; i < seatList_size; i++) {
				SeatVO seat = seatList.get(i);
				sql += "SELECT " + seat.getConcert_no() + ", '" + seat.getSeat_no() + "', '" + seat.getId() + "', " + seat.getOrder_no() + " FROM DUAL ";
				if (i != seatList_size - 1) {
					sql += " UNION ALL ";
				}
			}
			System.out.println(sql);
			getPreparedStatement(sql);

			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		close();
		return result;
	}

	// 좌석 하나를 예매하는 함수
	public int reserveSeat(SeatVO vo) {
		int result = -2;
		try {
			String sql = "INSERT INTO SEATS VALUES(?, ?, ?, ?)";
			getPreparedStatement(sql);

			pstmt.setInt(1, vo.getConcert_no());
			pstmt.setString(2, vo.getSeat_no());
			pstmt.setString(3, vo.getId());
			pstmt.setInt(4, vo.getOrder_no());

			rs = pstmt.executeQuery();
			if (rs.next()) {
				result = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		close();
		return result;
	}
}
