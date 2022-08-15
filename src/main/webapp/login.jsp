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
				<%
					String m = request.getParameter("M");
					if(m != null) {
				%>
					<script type="text/javascript">
						alert("���񽺸� �̿��Ͻ÷��� �α����� ���ּ���.");
					</script>
				<%
					}
				%>
				<div class="loginWrap">
					<h2>�α��Τ���</h2>
					<div class="sectionInfo" align="center"'>
						<form action="login.do" method="post" onSubmit="return check(this)">
							�� �� : <input type="text" name="ID" size="15" focus()/><br/>
							�� ȣ : <input type="password" name="PWD" size="15"/><br/><br/>
							<input type="submit" value="�α���" class="loginBtn loginSubmit"/>
							<input type="reset" value="�� ��" class="loginBtn loginReset"/>
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
				alert("������ �Է��� �ּ���.");
				return false;
			}
			if(fc.PWD.value == ''){
				alert("��ȣ�� �Է��� �ּ���.");
				return false;
			}
		}
	</script>
</body>
</html>