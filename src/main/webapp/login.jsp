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
				<%
					String m = request.getParameter("M");
					if(m != null) {
				%>
					<script type="text/javascript">
						alert("서비스를 이용하시려면 로그인을 해주세요.");
					</script>
				<%
					}
				%>
				<div class="loginWrap">
					<h2>로그인</h2>
					<div class="sectionInfo" align="center"'>
						<form action="login.do" method="post" onSubmit="return check(this)">
							사 번 : <input type="text" name="ID" size="15" focus()/><br/>
							암 호 : <input type="password" name="PWD" size="15"/><br/><br/>
							<input type="submit" value="로그인" class="loginBtn loginSubmit"/>
							<input type="reset" value="취 소" class="loginBtn loginReset"/>
						</form>
					</div>
			</section>
		</div>
		<div id="footerWrap">
			<jsp:include page="footer.jsp"/>
		</div>
	</div><!-- wrap -->
	<script type="text/javascript">
		function check(fc){
			if(fc.ID.value == ''){
				alert("계정을 입력해 주세요.");
				return false;
			}
			if(fc.PWD.value == ''){
				alert("암호를 입력해 주세요.");
				return false;
			}
		}
	</script>
</body>
</html>