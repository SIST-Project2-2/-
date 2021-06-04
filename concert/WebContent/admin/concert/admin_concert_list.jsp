<%@page import="java.lang.reflect.Field"%>
<%@page import="java.util.Arrays"%>
<%@page import="dao.ConcertDAO"%>
<%@page import="vo.ConcertVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	int page_no = 1; // 현재 페이지 번호
	int list_size = 0; // 페이지 당 보여줄 게시글 수
	int page_count = 0; // 총 페이지 수
	ConcertDAO concert_dao = new ConcertDAO(); // 콘서트 DAO 객체
	ArrayList<ConcertVO> concert_list = null; // 현재 페이지 콘서트 데이터 리스트 
	String search_parameters = ""; // get 방식으로 URL 뒤에 붙일 스트링
	Enumeration<String> parameter_names = request.getParameterNames(); // 받은 파라미터명들을 저장하는 인스턴스
	String[] searchCategories = request.getParameterValues("category"); // 검색 카테고리들을 String 형태로 저장하는 배열
	String searchTarget = request.getParameter("search"); // 검색할 내용
	
	// 파라미터들 중 'page_no'를 찾아내기 위한 반복문
	while (parameter_names.hasMoreElements()) {
		String parameter_name = parameter_names.nextElement();
		// 'page_no'가 존재하면 작업
		if (parameter_name.equals("page_no")) {
			page_no = Integer.parseInt(request.getParameter(parameter_name));
		}
	}
	
	// 검색 카테고리 설정
	ConcertVO concert = new ConcertVO(); // 카테고리 설정하기 위해 사용될 객체 생성
//	System.out.println("jsp파일 카테고리 목록: " + Arrays.toString(searchCategories));
		

	Field[] fields = concert.getClass().getDeclaredFields(); // ConcertVO 에 선언된 필드 목록
	for(Field field : fields){ 
		field.setAccessible(true); // private 필드에도 접근 가능하도록 설정
		if(searchCategories != null){ // 검색할 category가 존재하는지 확인
			for(int i = 0; i < searchCategories.length; i++){
				if(field.getName().equals(searchCategories[i])){ // 해당 카테고리가 필드에 존재하는지 확인
					field.set(concert, request.getParameter("search")); // 존재하면 conert 객체의 해당 필드에 값을 넣음
//					if(search_parameters.equals("")){
						search_parameters += "&";
//					}
					search_parameters += "category=" + field.getName();
//					search_parameters += field.getName() + "=" + request.getParameter("search");
					break;
				}
			}			
		}
	}
	if(!search_parameters.equals("")){
		search_parameters += "&search=" + request.getParameter("search");
	}
//	System.out.println("GET방식으로 받아온 파라미터: " + Arrays.toString(searchCategories));
//	System.out.println("만든 검색 파라미터: " + search_parameters);

	page_count = concert_dao.count_concert_pages(10, concert);
//	System.out.println("총 페이지 수: " + page_count);
	concert_list = concert_dao.get_concert_search_list(page_no, 10, concert);
	list_size = concert_list.size();
//	System.out.println("콘서트 목록 사이즈: "+list_size);
	
	concert_dao.close();
%>
<!-- header -->
<jsp:include page="../admin_header.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 - 콘서트 목록</title>
<script type="text/javascript">
	window.onload = function() {
		
		set_category();
		create_tbody();
		create_pagenation();
		
		// 검색 카테고리를 설정하는 함수
		function set_category() {
			var artist = $("#artist");
			var title = $("#title");
			var search_text = $("#notice_list_search");
			<% 
			if(searchCategories == null){%> // 검색을 하지 않았으면 둘 다 설정
				artist.attr("checked", "checked");
				title.attr("checked", "checked");<%
			}else{%>
				search_text.val("<%=searchTarget%>");<%
				for(String str: searchCategories){
				out.write(str + ".attr(\"checked\", \"checked\");");
				}
			}
			%>			
		}
		
		// 페이지네이션 부분을 생성하는 함수
		function create_pagenation(){
			var pagenation = $("#page_previous");
			<%
			String html_pagenation = "";
			int page_start = (page_no % 10 == 0) ? ((page_no / 10) - 1) * 10 + 1 : (page_no / 10) * 10 + 1;
			int page_end = (page_start + 9 > page_count) ? page_count : page_start + 9; 
			for(int i = page_start; i <= page_end && i <= page_count; i++){
				String html = "";
				html += "<li class='page-item'>";
				html += "	<a class='page-link' id='page_link" + i + "' href='?page_no=" + i + search_parameters + "' name='" + i + "'>" + i + "</a>";
				html += "</li>";
				html_pagenation += html;
			}
			%>
			pagenation.after("<%= html_pagenation%>");
			$("#page_link" + <%= page_no %>).addClass("font-weight-bold");
			$("#page_previous_link").attr("href", "?page_no=<%= (page_start - 10 <= 0) ? 1 : page_start - 10%><%=search_parameters%>");
			$("#page_next_link").attr("href", "?page_no=<%= (page_start + 10 > page_count) ? page_count : (page_start + 10)%><%=search_parameters%>");
	 	}

		// 테이블 부분을 생성하는 함수
		function create_tbody() {
			var tbody = $("#tbody");
			<%
			String html = "";
			for (int i = 0; i < list_size; i++) {
				html += "<tr>";
				html += "<th scope=\"row\">" + concert_list.get(i).getNo() + "</th>";
				html += "<td class=\"text-left\">" + concert_list.get(i).getTitle() + "</td>";
				html += "<td>" + concert_list.get(i).getArtist() + "</td>";
				html += "<td>" + concert_list.get(i).getCdate() + "</td>";
				html += "<td>" + concert_list.get(i).getLocation() + "</td>";
				html += "<td>";
				html += "	<a class=\"btn-sm btn-light\" href=\"admin_concert_edit.jsp\">수정</a>";
				html += "</td>";
				html += "<td>";
				html += "	<a type=\"button\" class=\"btn-sm btn-danger\" data-toggle=\"modal\" data-target=\"#exampleModal\" data-whatever=\""
						+ concert_list.get(i).getNo() + "\">삭제</a>";
				html += "</td>";
				html += "</tr>";
			}%>
			tbody.html('<%=html%>');
		}
	}
</script>
</head>
<body>
	<div class="container">
		<h1 class="font-weight-bold text-left">콘서트 목록</h1>

		<!-- 검색 창 -->
		<form action="#">
			<div class="row">
				<div class="col-8 container mb-3">
					<div class="input-group input-group-sm">
						<div class="input-group-prepend">
							<button class="btn btn-outline-info dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">카테고리</button>
							<div class="dropdown-menu">
								<div class="form-check dropdown-item">
									<input class="form-check-input" type="checkbox" value="title" name="category" id="title">
									<label class="form-check-label" for="title"> 콘서트 명 </label>
								</div>
								<div class="form-check dropdown-item">
									<input class="form-check-input" type="checkbox" value="artist" name="category" id="artist">
									<label class="form-check-label" for="artist"> 아티스트 </label>
								</div>
							</div>
						</div>
						<input type="text" class="form-control" placeholder="검색..." name="search" id="notice_list_search">
						<div class="input-group-append">
							<button type="submit" class="btn btn-primary" id="notice_list_search_button">검색</button>
						</div>
					</div>
				</div>
			</div>
		</form>

		<table class="table table-hover table-sm text-center">
			<thead>
				<tr>
					<th scope="col">번호</th>
					<th scope="col" class="text-left">콘서트 명</th>
					<th scope="col">아티스트</th>
					<th scope="col">날짜</th>
					<th scope="col">지역</th>
					<th scope="col">수정</th>
					<th scope="col">삭제</th>
				</tr>
			</thead>
			<tbody id="tbody">
			</tbody>
		</table>
		<div class="text-right">
			<a href="admin_concert_add.jsp" class="btn-sm btn-primary">등록</a>
		</div>
		<ul class="pagination justify-content-center" id="pagenation">
			<li class="page-item" id="page_previous">
				<a class="page-link" id="page_previous_link" href="#">&lt;</a>
			</li>
			<li class="page-item" id="page_next">
				<a class="page-link" id="page_next_link" href="#">&gt;</a>
			</li>
		</ul>
	</div>


	<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">New message</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
					<button type="button" class="btn btn-danger" id="btn_delete">삭제</button>
				</div>
			</div>
		</div>
	</div>
</body>

<script>
	$('#exampleModal').on('show.bs.modal', function(event) {
		var button = $(event.relatedTarget); // Button that triggered the modal
		var recipient = button.data('whatever'); // Extract info from data-* attributes
		// If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
		// Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
		var modal = $(this);
		modal.find('.modal-title').text(+recipient + '번 콘서트을 삭제하시겟습니까?');
		
		$("#btn_delete").click(function() {
			location.href = "http://localhost:9000/concert/admin/concert/admin_concert_delete_action.jsp?no=" + recipient;
		}); 
	})
</script>
</html>