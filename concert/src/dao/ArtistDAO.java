package dao;

import java.util.ArrayList;

import vo.ArtistVO;

public class ArtistDAO extends DAO{
	
	//지원 작성
	//아티스트 전체 리스트
	public ArrayList<ArtistVO> getList(){
		ArrayList<ArtistVO> list = new ArrayList<ArtistVO>();
		String sql = "select name, content, simg, no from artists order by no";
				
		getPreparedStatement(sql);
		
		try {
			rs = pstmt.executeQuery();
			while(rs.next()){
				ArtistVO vo = new ArtistVO();
				vo.setName(rs.getString(1));
				vo.setContent(rs.getString(2));
				vo.setSimg(rs.getString(3));
				
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
	
	//insert -> 아티스트 추가
	public boolean getInsertResult(ArtistVO vo) {
		boolean result = false;
		try {
			String sql = "insert into artists values('b_'||artists_no_seq.nextval, ?, ?, ?, ?)";
			getPreparedStatement(sql);
			
			pstmt.setString(1, vo.getName());
			pstmt.setString(2, vo.getContent());
			pstmt.setString(3, vo.getImg());
			pstmt.setString(4, vo.getSimg());
			
			int val = pstmt.executeUpdate();
			
			if(val == 1) {
				result = true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		close();
		return result;
	}
}
