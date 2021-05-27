package dao;

import java.util.ArrayList;

import vo.NoticeVO;

public class NoticeDAO extends DAO {
	
	
	public NoticeDAO() {
		super();
	}
	
	// 공지사항 번호를 입력받아 해당 공지사항 상세내용 가져오기(사용자)
	public NoticeVO getNoticeInfoForUser(int no) {
		NoticeVO info = new NoticeVO();
		
		try {
			String sql = "SELECT NO, TITLE, CONTENT, WDATE, VIEWS "
					+ " FROM NOTICES WHERE NO = ? ";
			getPreparedStatement(sql);

			pstmt.setInt(1, no);

			rs = pstmt.executeQuery();
			if (rs.next()) {
				info.setNo(rs.getInt(1));
				info.setTitle(rs.getString(2));
				info.setContent(rs.getString(3));
				info.setDate(rs.getString(4));
				info.setViews(rs.getInt(5));
			} else {
				return null; // 해당하는 공지사항이 없을 경우 null 반환
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return info;
	}
	
	// 페이지 번호를 입력받아 해당 페이지의 공지사항 목록 불러오기
	public ArrayList<NoticeVO> getNoticeListForUser(int page) {
		ArrayList<NoticeVO> list = new ArrayList<NoticeVO>();
		NoticeVO notice = null;
		
		try {
			// 한 페이지에 공지사항 10개 씩 불러오도록 작성함
			String sql = "select no, title, content, wdate, views "
					+ " from (select rownum as rno, no, title, content, wdate, views "
					+ "	from notices "
					+ "	where rownum <= 10 * ? "
					+ "	order by no desc) "
					+ " where rno > 10 * (? - 1) ";
			getPreparedStatement(sql);

			pstmt.setInt(1, page);
			pstmt.setInt(2, page);

			rs = pstmt.executeQuery();
			while(rs.next()) {
				notice = new NoticeVO();
				notice.setNo(rs.getInt(1));
				notice.setTitle(rs.getString(2));
				notice.setContent(rs.getString(3));
				notice.setDate(rs.getString(4));
				notice.setViews(rs.getInt(5));
				list.add(notice);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	// 공지사항 목록에서 검색한 결과 출력
	public ArrayList<NoticeVO> searchNoticeListForUser(String text) {
		ArrayList<NoticeVO> list = new ArrayList<NoticeVO>();
		NoticeVO notice = null;
		
		try {
			String sql = " select no, title, content, wdate, writer, views from notices "
					+ " where regexp_like(title, '?') or regexp_like(content, '?') ";
			getPreparedStatement(sql);

			pstmt.setString(1, text);
			pstmt.setString(2, text);

			rs = pstmt.executeQuery();
			while(rs.next()) {
				notice = new NoticeVO();
				notice.setNo(rs.getInt(1));
				notice.setTitle(rs.getString(2));
				notice.setContent(rs.getString(3));
				notice.setDate(rs.getString(4));
				notice.setViews(rs.getInt(5));
				list.add(notice);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
}
