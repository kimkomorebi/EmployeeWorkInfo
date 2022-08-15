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
		alert("작업을 완료했습니다. 사원 정보 조회 및 수정 페이지로 이동합니다.");
		location.href ="employeeInfoAll.do";
	</script>
<%
	}else if(result.equals("NOK")){
%>
	<script type="text/javascript">
		alert("작업을 실패했습니다. 관리자에게 문의해 주세요.");
		location.href ="employeeInfoAll.do";
	</script>
<%		
	}
%>
</body>
</html>