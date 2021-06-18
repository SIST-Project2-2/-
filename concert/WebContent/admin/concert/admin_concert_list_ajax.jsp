<%@page import="com.google.gson.Gson"%>
<%@page import="java.lang.reflect.Field"%>
<%@page import="java.util.Enumeration"%>
<%@page import="vo.ConcertVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.ConcertDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//
int page_no = 1; // 현재 페이지 번호
int list_size = 0; // 페이지 당 보여줄 게시글 수
int page_count = 0; // 총 페이지 수
ConcertDAO concert_dao = new ConcertDAO(); // 콘서트 DAO 객체
ArrayList<ConcertVO> concert_list = null; // 현재 페이지 콘서트 데이터 리스트 
String search_parameters = ""; // get 방식으로 URL 뒤에 붙일 스트링
Enumeration<String> parameter_names = request.getParameterNames(); // 받은 파라미터명들을 저장하는 인스턴스
String[] searchCategories = request.getParameterValues("category"); // 검색 카테고리들을 String 형태로 저장하는 배열
String searchTarget = request.getParameter("search"); // 검색할 내용

/** 파라미터들 중 'page_no'를 찾아내기 위한 반복문 **/
while (parameter_names.hasMoreElements()) {
	String parameter_name = parameter_names.nextElement();
	// 'page_no'가 존재하면 작업
	if (parameter_name.equals("page_no")) {
		page_no = Integer.parseInt(request.getParameter(parameter_name));
	}
}

/** 검색 카테고리 설정 **/
ConcertVO concert = new ConcertVO(); // 카테고리 설정하기 위해 사용될 객체 생성
//System.out.println("jsp파일 카테고리 목록: " + Arrays.toString(searchCategories));
Field[] fields = concert.getClass().getDeclaredFields(); // ConcertVO 에 선언된 필드 목록
for (Field field : fields) {
	field.setAccessible(true); // private 필드에도 접근 가능하도록 설정
	if (searchCategories != null) { // 검색할 category가 존재하는지 확인
		for (int i = 0; i < searchCategories.length; i++) {
	if (field.getName().equals(searchCategories[i])) { // 해당 카테고리가 필드에 존재하는지 확인
		field.set(concert, request.getParameter("search")); // 존재하면 conert 객체의 해당 필드에 값을 넣음
		//				if(search_parameters.equals("")){
		search_parameters += "&";
		//				}
		search_parameters += "category=" + field.getName();
		//				search_parameters += field.getName() + "=" + request.getParameter("search");
		break;
	}
		}
	}
}
if (!search_parameters.equals("")) {
	search_parameters += "&search=" + request.getParameter("search");
}
//System.out.println("GET방식으로 받아온 파라미터: " + Arrays.toString(searchCategories));
//System.out.println("만든 검색 파라미터: " + search_parameters);
page_count = concert_dao.count_concert_pages(10, concert);
//System.out.println("총 페이지 수: " + page_count);
concert_list = concert_dao.get_concert_search_list(page_no, 10, concert);
list_size = concert_list.size();
//System.out.println("콘서트 목록 사이즈: "+list_size);
concert_dao.close();

Gson gson = new Gson();
String result = gson.toJson(concert_list);
out.print(result);
%>