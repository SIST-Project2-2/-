<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%
	request.setCharacterEncoding("UTF-8");
String inputYn = request.getParameter("inputYn");
//주소
String roadAddrPart1 = request.getParameter("roadAddrPart1");
//사용자 입력 상세주소
String addrDetail = request.getParameter("addrDetail");
%>
</head>
<script language="javascript">


function init(){
	var url = location.href;
	var confmKey = "U01TX0FVVEgyMDIxMDYxNDE3NTAwOTExMTI4MDY=";
	var resultType = "3"; // 도로명주소 검색결과 화면 출력내용, 1 : 도로명, 2 : 도로명+지번+상세보기(관련지번, 관할주민센터), 3 : 도로명+상세보기(상세건물명), 4 : 도로명+지번+상세보기(관련지번, 관할주민센터, 상세건물명)
	var inputYn= "<%=inputYn%>";
	if(inputYn != "Y"){
		//주소 검색을 처음 눌렀을때 해당 값 반환
		document.form.confmKey.value = confmKey;
		document.form.returnUrl.value = url;
		document.form.resultType.value = resultType;
		document.form.action="https://www.juso.go.kr/addrlink/addrLinkUrl.do"; //인터넷망
		document.form.submit();
	}else{
		//opener : 처음 창을 연 객체 
		opener.jusoCallBack("<%=roadAddrPart1%>","<%=addrDetail%>");
			window.close();
		}
	}
</script>
<body onload="init();">
	<form id="form" name="form" method="post">
	<!-- confmKey : API 승인키 , returnUrl : 도로명 주소를 return 받을 사이트 주소 , resultType : 도로명+상세보기(상세건물명) 데이터 반환 -->
		<input type="hidden" id="confmKey" name="confmKey" value="" /> <input
			type="hidden" id="returnUrl" name="returnUrl" value="" /> <input
			type="hidden" id="resultType" name="resultType" value="" />
	</form>
</body>
</html>