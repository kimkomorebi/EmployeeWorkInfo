<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link href="style.css" rel="stylesheet" type="text/css">
<title>��� ���� ���� �ý���</title>
</head>
<body>
	<div id="wrap">
		<div id="headerWrap">
			<header>
				<jsp:include page="headerMenu.jsp"/>
			</header>
		</div>
		<div class="" id="sectionWrap">
			<section>
				<div class="sectionInfo" align="center">
					<h2>�α��� ���</h2>
					<p>
					<%
						String result = request.getParameter("RESULT");
						if(result.equals("OK")){
							out.print("�α��� �Ǿ����ϴ�.<br/>");
							String id = (String)session.getAttribute("LOGINID");
							out.print("ȯ���մϴ�. "+id+"�����");
						}else if(result.equals("NOPWD")){
							out.print("��ȣ�� ��ġ���� �ʽ��ϴ�. ��ȣ�� Ȯ���� �ּ���.");
						}else if(result.equals("NOID")){
							out.print("������ �����ϴ�. ���� �� �̿��� �ּ���.");
						}
					%>
					</p>
				</div>
			</section>
		</div>
		<div id="footerWrap">
			<jsp:include page="footer.jsp"/>
		</div>
	</div><!-- wrap -->
</body>
</html>