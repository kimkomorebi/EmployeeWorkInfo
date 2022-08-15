<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link href="style.css" rel="stylesheet" type="text/css">
<title>사원 정보 관리 시스템</title>
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
					<h2>로그인 결과</h2>
					<p>
					<%
						String result = request.getParameter("RESULT");
						if(result.equals("OK")){
							out.print("로그인 되었습니다.<br/>");
							String id = (String)session.getAttribute("LOGINID");
							out.print("환영합니다. "+id+"사원님");
						}else if(result.equals("NOPWD")){
							out.print("암호가 일치하지 않습니다. 암호를 확인해 주세요.");
						}else if(result.equals("NOID")){
							out.print("계정이 없습니다. 가입 후 이용해 주세요.");
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