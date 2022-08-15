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
			alert("삭제가 완료되었습니다. 작업 현황 조회창으로 이동합니다.");
			location.href="workProgress.do";
		</script>
	<%
		}else if(result.equals("NOK")){
	%>
	<script type="text/javascript">
	alert("삭제를 실패했습니다. 관리자에게 문의해 주세요.");
	location.href="workProgress.do";
	</script>
	<%
		}
	%>
</body>
</html>