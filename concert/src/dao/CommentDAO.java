package dao;

import java.util.ArrayList;

import concert.Commons;
import vo.CommentVO;
import vo.PageVO;

public class CommentDAO extends DAO{
	int commentPerPage = 10; // 댓글 목록 한 페이지 당 보이는 댓글 수
	String listCommonStart = " select no, artist, id, content, report, recommend, wdate "
			+ " from (select rownum as rno, no, artist, id, content, report, recommend, wdate "
			+ " 	from (select no, artist, id, content, report, recommend, wdate "
			+ "			from comments "; // 댓글 리스트 출력 sql문 앞부분 공통
	String listCommonEnd = " ) where rownum <= ? * ? ) where rno > ? * (? - 1) "; // 댓글 리스트 출력 sql문 뒷부분 공통
	String countCommon = " select count(*) from comments "; // 댓글 수 출력 sql문 공통
	
	// 목록 불러오기 실행 함수 - 기본
	private ArrayList<CommentVO> executeSelectList(String sql, int page) {
		ArrayList<CommentVO> list = new ArrayList<CommentVO>();
		CommentVO comment = null;
		
		try {
			getPreparedStatement(sql);
			
			pstmt.setInt(1, commentPerPage);
			pstmt.setInt(2, page);
			pstmt.setInt(3, commentPerPage);
			pstmt.setInt(4, page);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				comment = new CommentVO();
				
				comment.setNo(rs.getInt(1));
				comment.setArtist(rs.getString(2));
				comment.setId(rs.getString(3));
				comment.setContent(rs.getString(4));
				comment.setReport(rs.getInt(5));
				comment.setRecommend(rs.getInt(6));
				comment.setDate(rs.getString(7));
				
				list.add(comment);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	// 목록 불러오기 실행 함수 - 아티스트별 또는 검색
	private ArrayList<CommentVO> executeSelectList(String sql, int page, String str) {
		ArrayList<CommentVO> list = new ArrayList<CommentVO>();
		CommentVO comment = null;
		
		try {
			getPreparedStatement(sql);
			
			pstmt.setString(1, str);
			pstmt.setInt(2, commentPerPage);
			pstmt.setInt(3, page);
			pstmt.setInt(4, commentPerPage);
			pstmt.setInt(5, page);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				comment = new CommentVO();
				
				comment.setNo(rs.getInt(1));
				comment.setArtist(rs.getString(2));
				comment.setId(rs.getString(3));
				comment.setContent(rs.getString(4));
				comment.setReport(rs.getInt(5));
				comment.setRecommend(rs.getInt(6));
				comment.setDate(rs.getString(7));
				
				list.add(comment);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	// 목록 불러오기 실행 함수 - 아티스트별 검색
	private ArrayList<CommentVO> executeSelectList(String sql, int page, String artist, String search) {
		ArrayList<CommentVO> list = new ArrayList<CommentVO>();
		CommentVO comment = null;
		
		try {
			getPreparedStatement(sql);
			
			pstmt.setString(1, artist);
			pstmt.setString(2, Commons.s_string(search));
			pstmt.setInt(3, commentPerPage);
			pstmt.setInt(4, page);
			pstmt.setInt(5, commentPerPage);
			pstmt.setInt(6, page);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				comment = new CommentVO();
				
				comment.setNo(rs.getInt(1));
				comment.setArtist(rs.getString(2));
				comment.setId(rs.getString(3));
				comment.setContent(rs.getString(4));
				comment.setReport(rs.getInt(5));
				comment.setRecommend(rs.getInt(6));
				comment.setDate(rs.getString(7));
				
				list.add(comment);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	// 댓글 목록 출력 - 기본
	public ArrayList<CommentVO> getCommentList(int page, int order) {
		String sql = listCommonStart + " order by ";
		
		// order가 0일 경우 최신순, 1일 경우 신고 내림차순, 2일 경우 신고 오름차순
		if(order == 0) {
			sql += " no desc ";
		}else if(order == 1) {
			sql += " report desc ";
		}else if(order == 2){
			sql += " report asc ";
		}
				
		sql +=  listCommonEnd;
		
		return executeSelectList(sql, page);
	}
	
	// 댓글 목록 출력 - 아티스트별
	public ArrayList<CommentVO> getCommentList(int page, int order, String artist) {
		String sql = listCommonStart + " where artist = ? order by ";
		
		// order가 0일 경우 최신순, 1일 경우 신고 내림차순, 2일 경우 신고 오름차순
		if(order == 0) {
			sql += " no desc ";
		}else if(order == 1) {
			sql += " report desc ";
		}else if(order == 2){
			sql += " report asc ";
		}
		
		sql += listCommonEnd;
		
		return executeSelectList(sql, page, artist);
	}
	
	// 댓글 목록 출력 - 검색
	public ArrayList<CommentVO> getCommentListSearch(int page, int order, String search) {
		String sql = listCommonStart + " where id like(?) order by ";
		
		// order가 0일 경우 최신순, 1일 경우 신고 내림차순, 2일 경우 신고 오름차순
		if(order == 0) {
			sql += " no desc ";
		}else if(order == 1) {
			sql += " report desc ";
		}else if(order == 2){
			sql += " report asc ";
		}
		
		sql += listCommonEnd;
		
		return executeSelectList(sql, page, Commons.s_string(search));
	}
	
	// 댓글 목록 출력 - 아티스트별 검색
	public ArrayList<CommentVO> getCommentListSearch(int page, int order, String artist, String search) {
		String sql = listCommonStart + " where artist = ? and id like(?) order by ";
		
		// order가 0일 경우 최신순, 1일 경우 신고 내림차순, 2일 경우 신고 오름차순
				if(order == 0) {
					sql += " no desc ";
				}else if(order == 1) {
					sql += " report desc ";
				}else if(order == 2){
					sql += " report asc ";
				}
		
		sql += listCommonEnd;
		
		return executeSelectList(sql, page, artist, Commons.s_string(search));
	}
	
	// 댓글 수 구하기 - 기본
	private int executeCount(String sql) {
		int count = 0;
		
		try {
			getPreparedStatement(sql);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				count = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return count;
	}
	
	// 댓글 수 구하기 - 아티스트별 또는 검색
	private int executeCount(String sql, String str) {
		int count = 0;
		
		try {
			getPreparedStatement(sql);
			
			pstmt.setString(1, str);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				count = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return count;
	}
	
	// 댓글 수 구하기 - 아티스트별 검색
	private int executeCount(String sql, String artist, String search) {
		int count = 0;
		
		try {
			getPreparedStatement(sql);
			
			pstmt.setString(1, artist);
			pstmt.setString(2, search);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				count = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return count;
	}
	
	// 페이지 정보 출력 - 기본
	public PageVO getPageInfo(int nowPage) {
		String sql = countCommon;
		
		int count = executeCount(sql);
		
		return Commons.getPageProcess(count, nowPage, commentPerPage);
	}
	
	// 페이지 정보 출력 - 아티스트별
	public PageVO getPageInfo(int nowPage, String artist) {
		String sql = countCommon + " where artist = ? ";
		
		int count = executeCount(sql, artist);
		
		return Commons.getPageProcess(count, nowPage, commentPerPage);
	}
	
	// 페이지 정보 출력 - 검색
	public PageVO getPageInfoSearch(int nowPage, String search) {
		String sql = countCommon + " where comment like(?) ";
		
		int count = executeCount(sql, Commons.s_string(search));
		
		return Commons.getPageProcess(count, nowPage, commentPerPage);
	}
	
	// 페이지 정보 출력 - 아티스트별 검색
	public PageVO getPageInfoSearch(int nowPage, String artist, String search) {
		String sql = countCommon + " where artist = ? and comment like(?) ";
		
		int count = executeCount(sql, artist, Commons.s_string(search));
		
		return Commons.getPageProcess(count, nowPage, commentPerPage);
	}
}
