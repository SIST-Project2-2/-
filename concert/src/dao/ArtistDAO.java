package dao;

import java.util.ArrayList;

import vo.ArtistVO;

public class ArtistDAO extends DAO{
	
	//지원 작성
	//아티스트 전체 리스트
	public ArrayList<ArtistVO> getList(){
		ArrayList<ArtistVO> list = new ArrayList<ArtistVO>();
		String sql = "select name, content from artists ";
				
		getPreparedStatement(sql);
		
		try {
			rs = pstmt.executeQuery();
			while(rs.next()){
				ArtistVO vo = new ArtistVO();
				vo.setName(rs.getString(1));
				vo.setContent(rs.getString(2));
				
				list.add(vo);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		close();
		return list;
	}
		
	//아티스트 삭제
	public boolean getDeleteResult(String name) {
		boolean result = false;
		String sql = "delete from artists where name=? ";
		
		getPreparedStatement(sql);
		
		try {
			pstmt.setString(1, name);
			
			int value = pstmt.executeUpdate();
			if(value != 0) {
				result = true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		close();
		
		return result;
	}
}
