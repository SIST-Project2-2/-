package dao;

import vo.PayInfoVO;

public class PayInfoDAO extends DAO {
	
	
	public PayInfoVO getPayInfo(int no) { // no: 주문 번호
		PayInfoVO vo = new PayInfoVO();
		
		try {
			String sql = "";
			
			pstmt.setInt(1, no);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return vo;
	}
}
