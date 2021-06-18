package dao;

import java.util.ArrayList;

import vo.ReplyVO;

public class ReplyDAO extends DAO {

	public int saveReply(ReplyVO vo) {
		int result = -2;
		try {
			String sql = "INSERT INTO REPLY VALUES(?,?,?,sysdate)";
			getPreparedStatement(sql);

			pstmt.setString(1, vo.getArtist());
			pstmt.setString(2, vo.getId());
			pstmt.setString(3, vo.getContent());
			

			result = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}

		close();
		return result;
	}

	//댓글 전체리스트 출력
	public ArrayList<ReplyVO> getList() {
		ArrayList<ReplyVO> list = new ArrayList<ReplyVO>();

		try {
			String sql = "SELECT ARTIST,ID,CONTENT,TO_CHAR(RDATE, 'YYYY/MM/DD') FROM (SELECT * FROM REPLY ORDER BY RDATE DESC)";
			getPreparedStatement(sql);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				ReplyVO vo = new ReplyVO();
				vo.setArtist(rs.getString(1));
				vo.setId(rs.getString(2));
				vo.setContent(rs.getString(3));
				vo.setDate(rs.getString(4));

				list.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		close();
		return list;
	}
}
