<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>��� ���� ���� �ý���</title>
</head>
<body>
	<%
		String result = request.getParameter("RESULT");
		if(result.equals("OK")){
	%>
		<script type="text/javascript">
			alert("������ �Ϸ�Ǿ����ϴ�. �۾� ��Ȳ ��ȸ �������� ���ư��ϴ�.");
			location.href="workProgress.do";
		</script>
	<%
		}else if(result.equals("NOK")){
	%>
		<script type="text/javascript">
			alert("���� ����! �����ڿ��� ������ �ּ���");
			location.href="workProgress.do";
		</script>
	<%
		}
	%>
</body>
</html>