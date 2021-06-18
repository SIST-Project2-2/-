<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.MemberDAO, vo.MemberVO, java.util.*, java.lang.reflect.Field"%>
<%
	request.setCharacterEncoding("utf-8");
	MemberDAO dao = new MemberDAO();
	//ArrayList<MemberVO> list = dao.getList();
	String id = request.getParameter("id");
	String rpage = request.getParameter("page")==null?"1":request.getParameter("page");
	String search_parameters = ""; // get 방식으로 URL 뒤에 붙일 스트링
	Enumeration<String> parameter_names = request.getParameterNames(); // 받은 파라미터명들을 저장하는 인스턴스
	String[] searchCategories = request.getParameterValues("category"); // 검색 카테고리들을 String 형태로 저장하는 배열
	String searchTarget = request.getParameter("search"); // 검색할 내용
	
	//페이징 처리 - startCount, endCount 구하기
	int startCount = 0;
	int endCount = 0;
	int pageSize = 10;	//한페이지당 게시물 수
	int reqPage = 1;	//요청페이지	
	int pageCount = 1;	//전체 페이지 수
	int dbCount = dao.execTotalCount();	//DB에서 가져온 전체 행수
	
	//총 페이지 수 계산
	if(dbCount % pageSize == 0){
		pageCount = dbCount/pageSize;
	}else{
		pageCount = dbCount/pageSize+1;
	}
	
	//요청 페이지 계산
	if(rpage != null){
		reqPage = Integer.parseInt(rpage);
		startCount = (reqPage-1) * pageSize+1;
		endCount = reqPage *pageSize;
	}else{
		startCount = 1;
		endCount = 10;
	}
	
	ArrayList<MemberVO> list = dao.getList(startCount, endCount);
	
	/** 검색 카테고리 설정 **/
	MemberVO member = new MemberVO(); // 카테고리 설정하기 위해 사용될 객체 생성
//	System.out.println("jsp파일 카테고리 목록: " + Arrays.toString(searchCategories));
	Field[] fields = member.getClass().getDeclaredFields(); // ConcertVO 에 선언된 필드 목록
	for(Field field : fields){ 
		field.setAccessible(true); // private 필드에도 접근 가능하도록 설정
		if(searchCategories != null){ // 검색할 category가 존재하는지 확인
			for(int i = 0; i < searchCategories.length; i++){
				if(field.getName().equals(searchCategories[i])){ // 해당 카테고리가 필드에 존재하는지 확인
					field.set(member, request.getParameter("search")); // 존재하면 conert 객체의 해당 필드에 값을 넣음
						search_parameters += "&";
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
	System.out.println("GET방식으로 받아온 파라미터: " + Arrays.toString(searchCategories));
	System.out.println("만든 검색 파라미터: " + search_parameters);
	//int page_count = endCount;
//	System.out.println("총 페이지 수: " + page_count);
	list = dao.get_member_search_list(Integer.parseInt(rpage), 10, member);
//	list_size = concert_list.size();
	System.out.println("멤버목록 목록 사이즈: "+list.size());
	
//	concert_dao.close();

%>
<!-- header -->
<jsp:include page="../admin_header.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 관리</title>
<link rel="stylesheet" href="http://localhost:9000/concert/css/am-pagination.css">
<script src="http://localhost:9000/concert/js/jquery-3.6.0.min.js"></script>
<script src="http://localhost:9000/concert/js/am-pagination.js"></script>
<script>
	$(document).ready(function(){
		
		//페이지네이션
		var pager = jQuery('#ampaginationsm').pagination({
		
		    maxSize: 7,	    		// max page size
		    totals: <%=dbCount%>,	// total pages	
		    page: <%=rpage%>,		// initial page		
		    pageSize: 10,			// max number items per page
		
		    // custom labels		
		    lastText: '&raquo;', 		
		    firstText: '&laquo;',		
		    prevText: '&lt;',		
		    nextText: '&gt;',
				     
		    btnSize:'sm'	// 'sm'  or 'lg'		
		});
		
		jQuery('#ampaginationsm').on('am.pagination.change',function(e){
			   jQuery('.showlabelsm').text('The selected page no: '+e.page);
	           $(location).attr('href', "http://localhost:9000/concert/admin/member/admin_member_list.jsp?page="+e.page);         
	    });
		
		//검색 카테고리를 설정하는 함수
		function set_category() {
			var id = $("#chkbox_id");
			var nickname = $("#chkbox_nickname");
			<% if(searchCategories == null) { %>
				id.attr("checked", "checked");
				nickname.attr("checked", "checked");
			<% }else { %>
				search_text.val("<%=searchTarget%>");
				<% for(String str : searchCategories) {
					out.write(str + ".attr(\"checked\",\"checked\");");
				}
			} %>
		}
 	});
</script>
<style>
form div {
	text-align: center;
}

form div.table, td {
	border-collapse: collapse;
	text-align: center;
}

div#member_delete {
	margin: auto;
	width: 50%;
}
</style>
</head>
<body>
	<section class="container text-center">
		<h1 class="font-weight-bold text-left">회원 관리</h1>

		<!-- 검색 창 -->
		<form action="#">
			<div class="row">
				<div class="col-8 container mb-3">
					<div class="input-group input-group-sm">
						<!-- <select class="custom-select col-2" id="category">
							<option value="title" selected>제목</option>
							<option value="content">내용</option>
							<option value="writer">작성자</option>
						</select> -->
						<div class="input-group-prepend">
							<button class="btn btn-outline-info dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">카테고리</button>
							<div class="dropdown-menu">
								<div class="form-check dropdown-item">
									<input class="form-check-input" type="checkbox" value="id" name="category" id="id"> <label class="form-check-label" for="chkbox_id"> 아이디 </label>
								</div>
								<div class="form-check dropdown-item">
									<input class="form-check-input" type="checkbox" value="nickname" name="category" id="nickname"> <label class="form-check-label" for="chkbox_nickname"> 닉네임 </label>
								</div>
							</div>
						</div>
						<input type="text" class="form-control" placeholder="검색..." name="search" id="notice_list_search">
						<div class="input-group-append">
							<button type="button" class="btn btn-primary" id="notice_list_search_button">검색</button>
						</div>
					</div>
				</div>
			</div>
		</form>

		<table class="table table-hover table-sm">
			<thead>
				<tr>
					<th scope="col">ID</th>
					<th scope="col">닉네임</th>
					<th scope="col">이름</th>
					<th scope="col">전화번호</th>
					<th scope="col">이메일</th>
					<th scope="col">삭제</th>
				</tr>
			</thead>
			<tbody id="table_body">
				<%
				for (MemberVO vo : list) {
			%>
				<tr>
					<th scope="row"><%=vo.getId()%></th>
					<td class="text-left"><%=vo.getNickname()%></td>
					<td><%=vo.getLast_name()%><%=vo.getFirst_name()%></td>
					<td><%=vo.getPhone()%></td>
					<td><%=vo.getEmail()%></td>
					<% if(vo.getWithdrawal().equals("1")) { %>
					<td><a href="admin_member_list_delete_process.jsp?id=<%=vo.getId()%>"><button type="button" class="btn-sm btn-danger">삭제</button></a> <% }else{ %>
					<td><a href="#" onClick="alert('해당 회원이 취소신청을 하지 않았습니다')"><button type="button" class="btn-sm btn-secondary">삭제</button></td>
					<% } %>
					<% } %>
					<!-- 
					<td><a href="admin_member_list_delete_process.jsp?id=<%=id%>" type="button" class="btn-sm btn-danger"
						data-toggle="modal" data-target="#exampleModal"
						data-whatever="'+i+'">삭제</a></td>
						 -->
				</tr>
			</tbody>
		</table>
		<td colspan=4><div id="ampaginationsm"></div></td>
		<!-- 
		<ul class="pagination justify-content-center">
			<li class="page-item"><a class="page-link" href="#">&lt;</a></li>
			<li class="page-item"><a class="page-link" href="#">1</a></li>
			<li class="page-item"><a class="page-link" href="#">2</a></li>
			<li class="page-item"><a class="page-link" href="#">3</a></li>
			<li class="page-item"><a class="page-link" href="#">&gt;</a></li>
		</ul>
		 -->
	</section>
	<!-- 
	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">New message</h5>
					<a type="button" class="close" data-dismiss="modal"
						aria-label="Close"> <span aria-hidden="true">&times;</span>
					</a>
				</div>
				<div class="modal-footer">
					<a type="button" class="btn-sm btn-secondary" data-dismiss="modal">취소</a>
					<a type="button" class="btn-sm btn-danger">삭제</a>
				</div>
			</div>
		</div>
	</div>
	 -->
</body>
<script>
	/**
	 $('#exampleModal').on('show.bs.modal', function(event) {
	 var button = $(event.relatedTarget) // Button that triggered the modal
	 var recipient = button.data('whatever') // Extract info from data-* attributes
	 // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
	 // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
	 var modal = $(this)
	 modal.find('.modal-title').text(+recipient + '번 게시글을 삭제하시겟습니까?')
	 })
	 */
</script>
</html>