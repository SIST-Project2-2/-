package dao;

import java.util.ArrayList;

import concert.Commons;
import vo.NoticeVO;
import vo.PageVO;

public class NoticeDAO extends DAO {
	int notice_per_page = 8; // 한 페이지 당 보이는 공지 개수
	
	public NoticeDAO() {
		super();
	}
	
	// 공지사항 번호를 입력받아 해당 공지사항 상세내용 가져오기(관리자)
	public NoticeVO getNoticeInfoForAdmin(int no) {
		NoticeVO info = new NoticeVO();
		
		try {
			String sql = "SELECT NO, TITLE, CONTENT, TO_CHAR(WDATE, 'YYYY-MM-DD HH24:MI'), WRITER, VIEWS, TAG "
					+ " FROM NOTICES WHERE NO = ? ";
			getPreparedStatement(sql);
			
			pstmt.setInt(1, no);
			
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
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return info;
	}
	
	// 공지사항 번호를 입력받아 해당 공지사항 삭제하기(관리자)
	public boolean deleteNotice(int no) {
		int result = 0;
		
		try {
			String sql = " DELETE FROM NOTICES "
					+ " WHERE NO = ? ";
			getPreparedStatement(sql);
			
			pstmt.setInt(1, no);
			
			result = pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		// 삭제된 데이터가 1개일 경우 true 반환(삭제 성공) 그 외에는 false 반환(오류 발생)
		if(result == 1) {
			return true;
		}else {
			return false;
		}
	}
	
	// 페이지 번호를 입력받아 해당 페이지의 공지사항 목록 불러오기(관리자)
	public ArrayList<NoticeVO> getNoticeListForAdmin(int page) {
		ArrayList<NoticeVO> list = new ArrayList<NoticeVO>();
		NoticeVO notice = null;
		
		try {
			// 한 페이지에 공지사항 10개 씩 불러오도록 작성함
			String sql = "select no, title, TO_CHAR(WDATE, 'YYYY-MM-DD HH24:MI'), writer, views "
					+ " from (select rownum as rno, no, title, wdate, writer, views "
					+ "	from notices "
					+ "	where rownum <= ? * ? "
					+ "	order by no desc) "
					+ " where rno > ? * (? - 1) ";
			getPreparedStatement(sql);
			
			pstmt.setInt(1, notice_per_page);
			pstmt.setInt(2, page);
			pstmt.setInt(3, notice_per_page);
			pstmt.setInt(4, page);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
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
	public ArrayList<NoticeVO> getNoticeListForAdmin(int page, int category, String text) {
		ArrayList<NoticeVO> list = new ArrayList<NoticeVO>();
		NoticeVO notice = null;
		
		try {
			String sql = "select no, title, TO_CHAR(WDATE, 'YYYY-MM-DD HH24:MI'), writer, views "
					+ " from (select rownum as rno, no, title, wdate, writer, views "
					+ "		from notices where ";
			
			if(category == 1) { // category값에 따라 검색하는 범위 변경
				sql += " 	title like(?) ";
			}else if(category == 2) {
				sql += " 	content like(?) ";
			}else {
				sql += " 	(title like(?) or content like(?)) ";
			}
			
			sql += " and rownum <= ? * ? " // 페이지 범위 내의 목록 출력
					+ "	order by no desc) "
					+ " where rno > ? * (? - 1) ";
			
			getPreparedStatement(sql);
			
			int i = 1;
			pstmt.setString(i++, Commons.s_string(text));
			if(category != 1 && category != 2) {
				pstmt.setString(i++, Commons.s_string(text));
			}
			pstmt.setInt(i++, notice_per_page);
			pstmt.setInt(i++, page);
			pstmt.setInt(i++, notice_per_page);
			pstmt.setInt(i++, page);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
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
			String sql = "SELECT NO, TITLE, CONTENT, TO_CHAR(WDATE, 'YYYY-MM-DD HH24:MI'), VIEWS "
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
			String sql = "select no, title, content, TO_CHAR(WDATE, 'YYYY-MM-DD HH24:MI'), views, tag "
					+ " from (select rownum as rno, no, title, content, wdate, views, tag "
					+ "	from notices "
					+ "	where rownum <= ? * ? "
					+ "	order by no desc) "
					+ " where rno > ? * (? - 1) ";
			getPreparedStatement(sql);

			pstmt.setInt(1, notice_per_page);
			pstmt.setInt(2, page);
			pstmt.setInt(3, notice_per_page);
			pstmt.setInt(4, page);

			rs = pstmt.executeQuery();
			while(rs.next()) {
				notice = new NoticeVO();
				notice.setNo(rs.getInt(1));
				notice.setTitle(rs.getString(2));
				notice.setContent(rs.getString(3));
				notice.setDate(rs.getString(4));
				notice.setViews(rs.getInt(5));
				notice.setTag(rs.getString(6));
				list.add(notice);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	// 공지사항 목록에서 검색
	// 매개변수 category: 1: 제목, 2: 내용, 그 외: 전체
	public ArrayList<NoticeVO> getNoticeListForUser(int page, int category, String text) {
		ArrayList<NoticeVO> list = new ArrayList<NoticeVO>();
		NoticeVO notice = null;
		
		try {
			String sql = "select no, title, content, TO_CHAR(WDATE, 'YYYY-MM-DD HH24:MI'), views, tag "
					+ " from (select rownum as rno, no, title, content, wdate, views, tag "
					+ "		from notices where ";
			
			if(category == 1) { // category값에 따라 검색하는 범위 변경
				sql += " 	title like(?) ";
			}else if(category == 2) {
				sql += " 	content like(?) ";
			}else {
				sql += " 	(title like(?) or content like(?)) ";
			}
			
			sql += " and rownum <= ? * ? " // 페이지 범위 내의 목록 출력
				+ "	order by no desc) "
				+ " where rno > ? * (? - 1) ";
			
			getPreparedStatement(sql);
			
			int i = 1;
			pstmt.setString(i++, Commons.s_string(text));
			if(category != 1 && category != 2) {
				pstmt.setString(i++, Commons.s_string(text));
			}
			pstmt.setInt(i++, notice_per_page);
			pstmt.setInt(i++, page);
			pstmt.setInt(i++, notice_per_page);
			pstmt.setInt(i++, page);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				notice = new NoticeVO();
				notice.setNo(rs.getInt(1));
				notice.setTitle(rs.getString(2));
				notice.setContent(rs.getString(3));
				notice.setDate(rs.getString(4));
				notice.setViews(rs.getInt(5));
				notice.setTag(rs.getString(6)); // 태그를 String으로 넣을까 리스트로 넣을까?
				list.add(notice);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	// 공지사항 목록에서 검색한 결과 출력(아티스트별)
	public ArrayList<NoticeVO> getNoticeListForUser(int page, String artist) {
		ArrayList<NoticeVO> list = new ArrayList<NoticeVO>();
		NoticeVO notice = null;
		
		try {
			String sql = " select no, title, content, TO_CHAR(WDATE, 'YYYY-MM-DD HH24:MI'), views, tag "
					+ " from (select rownum as rno, no, title, content, wdate, views, tag "
					+ " 	from notices "
					+ " 	where tag like(?) and rownum <= ? * ?) "
					+ " where rno > ? * (? - 1) ";
			
			
			getPreparedStatement(sql);
			
			pstmt.setString(1, Commons.s_string(artist));
			pstmt.setInt(2, notice_per_page);
			pstmt.setInt(3, page);
			pstmt.setInt(4, notice_per_page);
			pstmt.setInt(5, page);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				notice = new NoticeVO();
				notice.setNo(rs.getInt(1));
				notice.setTitle(rs.getString(2));
				notice.setContent(rs.getString(3));
				notice.setDate(rs.getString(4));
				notice.setViews(rs.getInt(5));
				notice.setTag(rs.getString(6));
				list.add(notice);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	// 공지사항 목록에서 검색한 결과 출력(아티스트별+검색)
	public ArrayList<NoticeVO> getNoticeListForUser(int page, int category, String artist, String text) {
		ArrayList<NoticeVO> list = new ArrayList<NoticeVO>();
		NoticeVO notice = null;
		
		try {
			String sql = " select no, title, content, TO_CHAR(WDATE, 'YYYY-MM-DD HH24:MI'), views, tag "
					+ " from (select rownum as rno, no, title, content, wdate, views, tag "
					+ " from notices "
					+ " where tag like(?) and ";
			
			if(category == 1) { // category값에 따라 검색하는 범위 변경
				sql += " title like(?) ";
			}else if(category == 2) {
				sql += " content like(?) ";
			}else {
				sql += " (title like(?) or content like(?)) ";
			}
			
			sql += " and rownum <= ? * ? " // 페이지 범위 내의 목록 출력
				+ "	order by no desc) "
				+ " where rno > ? * (? - 1) ";
			
			getPreparedStatement(sql);
			
			int i = 1;
			pstmt.setString(i++, Commons.s_string(artist));
			pstmt.setString(i++, Commons.s_string(text));
			if(category != 1 && category != 2) {
				pstmt.setString(i++, Commons.s_string(text));
			}
			pstmt.setInt(i++, notice_per_page);
			pstmt.setInt(i++, page);
			pstmt.setInt(i++, notice_per_page);
			pstmt.setInt(i++, page);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				notice = new NoticeVO();
				notice.setNo(rs.getInt(1));
				notice.setTitle(rs.getString(2));
				notice.setContent(rs.getString(3));
				notice.setDate(rs.getString(4));
				notice.setViews(rs.getInt(5));
				notice.setTag(rs.getString(6));
				list.add(notice);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	// PageVO를 설정하는 함수
//	public PageVO getPageProcess(int count, int nowPage) {
//		PageVO vo = new PageVO();
//		int total_page = count / notice_per_page; // 전체 페이지 수
//		if(count % notice_per_page != 0) {
//			total_page ++;
//		} 
//		
//		vo.setTotal(total_page);
//		
//		// 현 페이지가 1인 경우 이전 버튼 비활성화
//		if(nowPage == 1) { 
//			vo.setPrev(false);
//		}else {
//			vo.setPrev(true);
//		}
//		
//		// 현 페이지가 마지막 페이지인 경우 다음 버튼 비활성화
//		if(nowPage == total_page || total_page == 0) { 
//			vo.setNext(false);
//		}else {
//			vo.setNext(true);
//		}
//		
//		// 보여지는 페이지 중 시작 페이지와 끝 페이지
//		if(nowPage <= 5) { // 현 페이지가 5페이지 이내일 경우
//			vo.setStart(1);
//			vo.setEnd(total_page);
//		}else if(total_page - nowPage <= 2) { // 현 페이지가 뒤에서 2번째 이내일 경우
//			vo.setStart(total_page - 4);
//			vo.setEnd(total_page);
//		}else { // 그 외의 경우
//			vo.setStart(nowPage - 2);
//			vo.setEnd(nowPage + 2);
//		}
//		
//		return vo;
//	}
	
	// 페이지 구하기 - 기본
	public PageVO getPageInfo(int nowPage) {
		int count = 0;
		
		try {
			String sql = " select count(*) from notices ";
			getPreparedStatement(sql);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				count = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return Commons.getPageProcess(count, nowPage, notice_per_page);
	}
	
	// 페이지 구하기 - 가수별
	public PageVO getPageInfo(int nowPage, String artist) {
		int count = 0;
		
		try {
			String sql = " select count(*) from notices "
					+ " where tag like(?) ";
			getPreparedStatement(sql);
			
			pstmt.setString(1, Commons.s_string(artist));
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				count = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return Commons.getPageProcess(count, nowPage, notice_per_page);
	}
	
	// 페이지 구하기 - 검색
	public PageVO getPageInfo(int nowPage, int category, String text) {
		int count = 0;
		
		try {
			String sql = " select count(*) from notices where ";
			if(category == 1) {
				sql += " title like(?) ";
			}else if(category == 2) {
				sql += " content like(?) ";
			}else {
				sql += " title like(?) and content like(?) ";
			}
			
			getPreparedStatement(sql);
			
			pstmt.setString(1, Commons.s_string(text));
			if(category != 1 && category != 2) {
				pstmt.setString(2, Commons.s_string(text));
			}
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				count = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return Commons.getPageProcess(count, nowPage, notice_per_page);
	}
	
	// 페이지 구하기 - 아티스트별 + 검색
	public PageVO getPageInfo(int nowPage, int category, String artist, String text) {
		int count = 0;
		
		try {
			String sql = " select count(*) from notices "
					+ " where tag like(?) and ";
			if(category == 1) {
				sql += " title like(?) ";
			}else if(category == 2) {
				sql += " content like(?) ";
			}else {
				sql += " (title like(?) or content like(?)) ";
			}
			
			getPreparedStatement(sql);
			
			pstmt.setString(1, Commons.s_string(artist));
			pstmt.setString(2, Commons.s_string(text));
			if(category != 1 && category != 2) {
				pstmt.setString(3, Commons.s_string(text));
			}
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				count = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return Commons.getPageProcess(count, nowPage, notice_per_page);
	}
}
