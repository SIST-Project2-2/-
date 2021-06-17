package dao;

import java.util.ArrayList;

import concert.Commons;
import vo.NoticeVO;

public class NoticeDAO extends DAO {
	String listCommonStartAdmin = " select no, title, TO_CHAR(WDATE, 'YYYY-MM-DD HH24:MI'), writer, views "
			+ " from (select rownum as rno, no, title, wdate, writer, views "
			+ "		from (select * from notices order by no desc) where "; // 관리자 목록 출력 시작부분 공통
	String listCommonStart = "select no, title, content, TO_CHAR(WDATE, 'YYYY-MM-DD HH24:MI'), views, tag, simg "
			+ " from (select rownum as rno, no, title, content, wdate, views, tag, simg "
			+ "		from (select * from notices order by no desc) where "; // 목록 출력 시작부분 공통 
	String listCommonEnd = " rownum <= ? * ?) where rno > ? * (? - 1) "; // 목록 출력 끝부분 공통
	String countCommon = " select count(*) from notices "; // 게시글수 출력 공통
	String byArtist = " tag like(?) "; // 아티스트별
	String categoryTitle = " title like(?) "; // 제목 검색
	String categoryContent = " content like(?) "; // 내용 검색
	String categoryAll = " (title like(?) or content like(?)) "; // 제목+내용 검색
	
	public NoticeDAO() {
		super();
	}
  
	// 공지사항 번호를 입력받아 해당 공지사항 상세내용 가져오기(관리자)
	public NoticeVO getNoticeInfoForAdmin(String no) {
		NoticeVO info = new NoticeVO();

		try {
			String sql = "SELECT NO, TITLE, CONTENT, TO_CHAR(WDATE, 'YYYY-MM-DD HH24:MI'), WRITER, VIEWS, TAG "
					+ " FROM NOTICES WHERE NO = ? ";
			getPreparedStatement(sql);

			pstmt.setString(1, no);

			rs = pstmt.executeQuery();
			if (rs.next()) {
				info.setNo(rs.getInt(1));
				info.setTitle(rs.getString(2));
				info.setContent(rs.getString(3));
				info.setDate(rs.getString(4));
				info.setWriter(rs.getString(5));
				info.setViews(rs.getInt(6));
				info.setTag(rs.getString(7));
			} else {
				return null; // 해당하는 공지사항이 없을 경우 null 반환
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return info;
	}

	// 공지사항 번호를 입력받아 해당 공지사항 삭제하기(관리자)
	public boolean deleteNotice(int no) {
		int result = 0;

		try {
			String sql = " DELETE FROM NOTICES " + " WHERE NO = ? ";
			getPreparedStatement(sql);

			pstmt.setInt(1, no);

			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}

		// 삭제된 데이터가 1개일 경우 true 반환(삭제 성공) 그 외에는 false 반환(오류 발생)
		if (result == 1) {
			return true;
		} else {
			return false;
		}
	}

	// 페이지 번호를 입력받아 해당 페이지의 공지사항 목록 불러오기(관리자)
	public ArrayList<NoticeVO> getNoticeListForAdmin(int page, int noticePerPage) {
		ArrayList<NoticeVO> list = new ArrayList<NoticeVO>();
		NoticeVO notice = null;

		try {
			// 한 페이지에 공지사항 10개 씩 불러오도록 작성함
			String sql = listCommonStartAdmin + listCommonEnd;
			getPreparedStatement(sql);

			pstmt.setInt(1, noticePerPage);
			pstmt.setInt(2, page);
			pstmt.setInt(3, noticePerPage);
			pstmt.setInt(4, page);

			rs = pstmt.executeQuery();
			while (rs.next()) {
				notice = new NoticeVO();
				notice.setNo(rs.getInt(1));
				notice.setTitle(rs.getString(2));
				notice.setDate(rs.getString(3));
				notice.setWriter(rs.getString(4));
				notice.setViews(rs.getInt(5));
				list.add(notice);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	// 공지사항 목록에서 검색(관리자)
	// 매개변수 category: 1: 제목, 2: 내용, 그 외: 전체
	public ArrayList<NoticeVO> getNoticeListForAdmin(int page, int noticePerPage, int category, String text) {
		ArrayList<NoticeVO> list = new ArrayList<NoticeVO>();
		NoticeVO notice = null;

		try {
			String sql = listCommonStartAdmin;

			if (category == 1) { // category값에 따라 검색하는 범위 변경
				sql += categoryTitle;
			} else if (category == 2) {
				sql += categoryContent;
			} else {
				sql += categoryAll;
			}

			sql += " and " + listCommonEnd;

			getPreparedStatement(sql);

			int i = 1;
			pstmt.setString(i++, Commons.s_string(text));
			if (category != 1 && category != 2) {
				pstmt.setString(i++, Commons.s_string(text));
			}
			pstmt.setInt(i++, noticePerPage);
			pstmt.setInt(i++, page);
			pstmt.setInt(i++, noticePerPage);
			pstmt.setInt(i++, page);

			rs = pstmt.executeQuery();
			while (rs.next()) {
				notice = new NoticeVO();
				notice.setNo(rs.getInt(1));
				notice.setTitle(rs.getString(2));
				notice.setDate(rs.getString(3));
				notice.setWriter(rs.getString(4));
				notice.setViews(rs.getInt(5));
				list.add(notice);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	// 공지사항 번호를 입력받아 해당 공지사항 상세내용 가져오기(사용자)
	public NoticeVO getNoticeInfoForUser(int no) {
		NoticeVO info = new NoticeVO();

		try {
			String sql = "SELECT NO, TITLE, CONTENT, TO_CHAR(WDATE, 'YYYY-MM-DD HH24:MI'), VIEWS , TAG, SIMG"
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
				info.setTag(rs.getString(6));
				info.setSimg(rs.getString(7));
			} else {
				return null; // 해당하는 공지사항이 없을 경우 null 반환
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return info;
	}

	// 페이지 번호를 입력받아 해당 페이지의 공지사항 목록 불러오기
	public ArrayList<NoticeVO> getNoticeListForUser(int page, int noticePerPage) {
		ArrayList<NoticeVO> list = new ArrayList<NoticeVO>();
		NoticeVO notice = null;

		try {
			// 한 페이지에 공지사항 10개 씩 불러오도록 작성함
			String sql = listCommonStart + listCommonEnd;
			getPreparedStatement(sql);

			pstmt.setInt(1, noticePerPage);
			pstmt.setInt(2, page);
			pstmt.setInt(3, noticePerPage);
			pstmt.setInt(4, page);

			rs = pstmt.executeQuery();
			while (rs.next()) {
				notice = new NoticeVO();
				notice.setNo(rs.getInt(1));
				notice.setTitle(rs.getString(2));
				notice.setContent(rs.getString(3));
				notice.setDate(rs.getString(4));
				notice.setViews(rs.getInt(5));
				notice.setTag(rs.getString(6));
				notice.setSimg(rs.getString(7));
				list.add(notice);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	// 공지사항 목록에서 검색
	// 매개변수 category: 1: 제목, 2: 내용, 그 외: 전체
	public ArrayList<NoticeVO> getNoticeListForUser(int page, int noticePerPage, int category, String text) {
		ArrayList<NoticeVO> list = new ArrayList<NoticeVO>();
		NoticeVO notice = null;

		try {
			String sql = listCommonStart;

			if (category == 1) { // category값에 따라 검색하는 범위 변경
				sql += categoryTitle;
			} else if (category == 2) {
				sql += categoryContent;
			} else {
				sql += categoryAll;
			}

			sql += " and " + listCommonEnd;

			getPreparedStatement(sql);

			int i = 1;
			pstmt.setString(i++, Commons.s_string(text));
			if (category != 1 && category != 2) {
				pstmt.setString(i++, Commons.s_string(text));
			}
			pstmt.setInt(i++, noticePerPage);
			pstmt.setInt(i++, page);
			pstmt.setInt(i++, noticePerPage);
			pstmt.setInt(i++, page);

			rs = pstmt.executeQuery();
			while (rs.next()) {
				notice = new NoticeVO();
				notice.setNo(rs.getInt(1));
				notice.setTitle(rs.getString(2));
				notice.setContent(rs.getString(3));
				notice.setDate(rs.getString(4));
				notice.setViews(rs.getInt(5));
				notice.setTag(rs.getString(6));
				notice.setSimg(rs.getString(7));
				list.add(notice);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	// 공지사항 목록에서 검색한 결과 출력(아티스트별)
	public ArrayList<NoticeVO> getNoticeListForUser(int page, int noticePerPage, String artist) {
		ArrayList<NoticeVO> list = new ArrayList<NoticeVO>();
		NoticeVO notice = null;

		try {
			String sql = listCommonStart + byArtist + " and " + listCommonEnd;

			getPreparedStatement(sql);

			pstmt.setString(1, Commons.s_string(artist));
			pstmt.setInt(2, noticePerPage);
			pstmt.setInt(3, page);
			pstmt.setInt(4, noticePerPage);
			pstmt.setInt(5, page);

			rs = pstmt.executeQuery();
			while (rs.next()) {
				notice = new NoticeVO();
				notice.setNo(rs.getInt(1));
				notice.setTitle(rs.getString(2));
				notice.setContent(rs.getString(3));
				notice.setDate(rs.getString(4));
				notice.setViews(rs.getInt(5));
				notice.setTag(rs.getString(6));
				notice.setSimg(rs.getString(7));
				list.add(notice);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	// 공지사항 목록에서 검색한 결과 출력(아티스트별+검색)
	public ArrayList<NoticeVO> getNoticeListForUser(int page, int noticePerPage, int category, String artist, String text) {
		ArrayList<NoticeVO> list = new ArrayList<NoticeVO>();
		NoticeVO notice = null;

		try {
			String sql = listCommonStart + byArtist + " and ";

			if (category == 1) { // category값에 따라 검색하는 범위 변경
				sql += categoryTitle;
			} else if (category == 2) {
				sql += categoryContent;
			} else {
				sql += categoryAll;
			}

			sql += " and " + listCommonEnd;

			getPreparedStatement(sql);

			int i = 1;
			pstmt.setString(i++, Commons.s_string(artist));
			pstmt.setString(i++, Commons.s_string(text));
			if (category != 1 && category != 2) {
				pstmt.setString(i++, Commons.s_string(text));
			}
			pstmt.setInt(i++, noticePerPage);
			pstmt.setInt(i++, page);
			pstmt.setInt(i++, noticePerPage);
			pstmt.setInt(i++, page);

			rs = pstmt.executeQuery();
			while (rs.next()) {
				notice = new NoticeVO();
				notice.setNo(rs.getInt(1));
				notice.setTitle(rs.getString(2));
				notice.setContent(rs.getString(3));
				notice.setDate(rs.getString(4));
				notice.setViews(rs.getInt(5));
				notice.setTag(rs.getString(6));
				notice.setSimg(rs.getString(7));
				list.add(notice);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	// 페이지 구하기 - 기본
	public int getCount(int nowPage) {
		int count = 0;
		
		try {
			String sql = countCommon;
			getPreparedStatement(sql);
			
			rs = pstmt.executeQuery();
			if (rs.next()) {
				count = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return count;
	}
	
	// 페이지 구하기 - 가수별
	public int getCount(int nowPage, String artist) {
		int count = 0;
		
		try {
			String sql = countCommon + " where " + byArtist;
			getPreparedStatement(sql);
			
			pstmt.setString(1, Commons.s_string(artist));
			
			rs = pstmt.executeQuery();
			if (rs.next()) {
				count = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return count;
	}

	// 페이지 구하기 - 검색
	public int getCount(int nowPage, int category, String text) {
		int count = 0;

		try {
			String sql = countCommon + " where ";
			if (category == 1) { // category값에 따라 검색하는 범위 변경
				sql += categoryTitle;
			} else if (category == 2) {
				sql += categoryContent;
			} else {
				sql += categoryAll;
			}

			getPreparedStatement(sql);

			pstmt.setString(1, Commons.s_string(text));
			if (category != 1 && category != 2) {
				pstmt.setString(2, Commons.s_string(text));
			}

			rs = pstmt.executeQuery();
			if (rs.next()) {
				count = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return count;
	}

	// 페이지 구하기 - 아티스트별 + 검색
	public int getCount(int nowPage, int category, String artist, String text) {
		int count = 0;

		try {
			String sql = countCommon + " where " + byArtist + " and ";
			if (category == 1) { // category값에 따라 검색하는 범위 변경
				sql += categoryTitle;
			} else if (category == 2) {
				sql += categoryContent;
			} else {
				sql += categoryAll;
			}

			getPreparedStatement(sql);

			pstmt.setString(1, Commons.s_string(artist));
			pstmt.setString(2, Commons.s_string(text));
			if (category != 1 && category != 2) {
				pstmt.setString(3, Commons.s_string(text));
			}

			rs = pstmt.executeQuery();
			if (rs.next()) {
				count = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return count;
	}

	// 관리자 - 공지사항 등록
	public int updateNoticeList(NoticeVO vo) {
		int result = -2;

		try {

			String sql = "INSERT INTO NOTICES VALUES(NOTICES_NO_SEQ.NEXTVAL, ?, ?, sysdate, 'admin', 0, ?, ?, ?)";
			getPreparedStatement(sql);

			pstmt.setString(1, vo.getTitle());
			pstmt.setString(2, vo.getContent());
			pstmt.setString(3, vo.getTag());
			pstmt.setString(4, vo.getImg());
			pstmt.setString(5, vo.getSimg());

			// 성공하면 1, 성공 못하면 0, SQL 에러나면 -1, 자바에서 에러나면 -2
			result = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	// 관리자 - 공지사항 조회수
	public void getUpdateView(String no) {
		String sql = "update notices set views = views + 1 where no = ? ";
		getPreparedStatement(sql);
		
		try {
			pstmt.setString(1, no);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return;
	}
	
	public int getUpdateNotice(String no, NoticeVO vo) {
		
		int result = -2;
		String sql = "update notices set tag=?,title=?,content=? where no=?";
		getPreparedStatement(sql);
		
		try {
			
			pstmt.setString(1, vo.getTag());
			pstmt.setString(2,vo.getTitle());
			pstmt.setString(3,vo.getContent());
			pstmt.setString(4,no);
			
			result = pstmt.executeUpdate();
			
			if(result==1) {
				result=1; //업데이트 성공
			}else {
				result=0; //업데이트 실패
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		close();
		return result;
		
	}
}
