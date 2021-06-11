<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dao.MemberDAO, vo.MemberVO, java.util.*"%>
<%
	request.setCharacterEncoding("utf-8");
	MemberDAO dao = new MemberDAO();
	//ArrayList<MemberVO> list = dao.getList();
	String id = request.getParameter("id");
	String rpage = request.getParameter("page");
	
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
							<button class="btn btn-outline-info dropdown-toggle"
								type="button" data-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false">카테고리</button>
							<div class="dropdown-menu">
								<div class="form-check dropdown-item">
									<input class="form-check-input" type="checkbox" value="id"
										name="category" id="id"> <label
										class="form-check-label" for="id"> 아이디 </label>
								</div>
								<div class="form-check dropdown-item">
									<input class="form-check-input" type="checkbox" value="content"
										name="category" id="content"> <label
										class="form-check-label" for="content"> 닉네임 </label>
								</div>
							</div>
						</div>
						<input type="text" class="form-control" placeholder="검색..."
							name="search" id="notice_list_search">
						<div class="input-group-append">
							<button type="button" class="btn btn-primary"
								id="notice_list_search_button">검색</button>
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
					<td><a href="admin_member_list_delete_process.jsp?id=<%=vo.getId()%>"><button type="button" class="btn-sm btn-danger">삭제</button></a>
					
					<!-- 
					<td><a href="admin_member_list_delete_process.jsp?id=<%=id%>" type="button" class="btn-sm btn-danger"
						data-toggle="modal" data-target="#exampleModal"
						data-whatever="'+i+'">삭제</a></td>
						 -->
				</tr>
				<%
					}
				%>
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
</body>
<script>
	$('#exampleModal').on('show.bs.modal', function(event) {
		var button = $(event.relatedTarget) // Button that triggered the modal
		var recipient = button.data('whatever') // Extract info from data-* attributes
		// If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
		// Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
		var modal = $(this)
		modal.find('.modal-title').text(+recipient + '번 게시글을 삭제하시겟습니까?')
	})
</script>
</html>