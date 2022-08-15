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
	<%
		String employeeNum = request.getParameter("ENUM");
		String workNum = request.getParameter("WORKNUM");
	%>
	<div id="wrap">
		<div id="headerWrap">
			<header>
				<jsp:include page="headerMenu.jsp"/>
			</header>
		</div>
		<div class="" id="sectionWrap">
			<section>
				<h2>사원 정보 등록</h2>
				<div class="sectionInfo">
					<form action="employeeRegister.do" method="post" onSubmit="return check(this)">
						<table border="1">
							<tr>
								<th>사원 번호[자동 등록]</th>
								<td><input type="text" name="EMPNUMBER" value="<%= employeeNum %>" readonly/></td>
							</tr>
							<tr>
								<th>사원 비밀번호</th>
								<td><input type="text" name="PWD"/></td>
							</tr>
							<tr>
								<th>사원 이름</th>
								<td><input type="text" name="NAME"/></td>
							</tr>
							<tr>
								<th>월급</th>
								<td><input type="text" name="SALARY"/></td>
							</tr>
							<tr>
								<th>작업 번호[자동 등록]</th>
								<td><input type="text" name="TASKNUMBER" value="<%= workNum%>" readonly/></td>
							</tr>
							<tr>
								<th>작업 완료 예정일</th>
								<td><input type="date" name="DATE"/></td>
							</tr>
							<tr>
								<th>업무 코드[10~20]</th>
								<td><input type="text" name="BUSINESSCODE"/></td>
							</tr>
							<tr>
								<th>근무지 번호[1~5]</th>
								<td>
									<select name="WPNUM">
										<option>1</option>
										<option>2</option>
										<option>3</option>
										<option>4</option>
										<option>5</option>
									</select>
								</td>
							</tr>
							<tr>
								<td colspan="2" align="center">
									<input type="submit" value="등 록" name="btn" class="insertBtn entryPageBtn"/>
									<input type="button" value="조 회" onClick="doSearch()" class="selectBtn entryPageBtn"/>
								</td>
							</tr>
						</table>
					</form>
				</div>
			</section>
		</div>
		<div id="footerWrap">
			<jsp:include page="footer.jsp"/>
		</div>
	</div><!-- wrap -->
	<script type="text/javascript">
		function doSearch(){
			location.href="employeeInfoAll.do";
		}
		function check(fc){
			if(fc.PWD.value == ''){
				alert("사원 비밀번호를 입력해 주세요."); return false;
			}
			if(fc.NAME.value == ''){
				alert("사원 이름을 입력해 주세요."); return false;
			}
			if(fc.SALARY.value == ''){
				alert("사원 월급을 입력해 주세요."); return false;
			}
			if(fc.DATE.value == ''){
				alert("작업 완료 예정일을 입력해 주세요."); return false;
			}
			if(fc.BUSINESSCODE.value == ''){
				alert("업무 코드를 입력해 주세요."); return false;
			}
			if(10 > fc.BUSINESSCODE.value || fc.BUSINESSCODE.value > 20){
				alert("업무 코드는 10~20사이의 숫자를 입력해 주세요.");
				return false;
			}
			if(confirm("사원 정보를 등록하시겠습니까?")){
				return true;
			}else {
				return false;
			}
		}
	</script>
</body>
</html>