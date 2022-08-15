<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>사원 정보 관리 시스템</title>
</head>
<body>
<%
	String result = request.getParameter("RESULT");
	if(result.equals("OK")){
%>
	<script type="text/javascript">
		alert("데이터 입력에 성공하였습니다.");
		location.href ="employeeInfoAll.do";
	</script>
<%
	}else if(result.equals("NOK")){
%>
	<script type="text/javascript">
		alert("데이터 입력에 실패하였습니다.");
		location.href ="employeeInfoAll.do";
	</script>
<%
	}
%>
</body>
</html>