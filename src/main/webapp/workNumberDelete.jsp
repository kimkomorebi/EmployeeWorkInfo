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
		if(result.equals("RM")){
	%>
		<script type="text/javascript">
			alert("������ �Ϸ�Ǿ����ϴ�. �۾� ��ȣ ���� �������� �̵��մϴ�.");
			location.href="workNumberInfo.do";
		</script>
	<%
		}else if(result.equals("NRM")){
	%>
	<script type="text/javascript">
	alert("������ �����߽��ϴ�. �����ڿ��� ������ �ּ���.");
	location.href="workNumberInfo.do";
	</script>
	<%
		}
	%>
</body>
</html>