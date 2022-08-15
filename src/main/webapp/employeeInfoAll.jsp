<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.*, employeeInfo.* " %>
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
				<h2>사원 정보 조회</h2>
				<div class="secEmployeeInfo">
					<table border="1">
						<tr>
							<th>사원번호</th>
							<th>사원 비밀번호</th>
							<th>사원 이름</th>
							<th>월급</th>
							<th>작업 번호</th>
						</tr>
<%
	ArrayList empinfo = (ArrayList)request.getAttribute("EMPINFO");
	int size = empinfo.size();
	for(int i =0; i<size; i++){
		EmployeeInfo info = (EmployeeInfo)empinfo.get(i);
%>
						<tr>
							<td><a href="employeeSelectInfo.do?NUM=<%= info.getEmpnum()%>"><%= info.getEmpnum() %></a></td>
							<td><input type="password" name="PWD" value="<%= info.getEmppwd() %>" readonly class="empPwd"/></td>
							<td><%= info.getEmpname() %></td>
							<td><%= info.getSalary() %></td>
							<td><%= info.getWorknum() %></td>
						</tr>
<%
	}
%>
					</table>
				</div>
			</section>
		</div>
		<div id="footerWrap">
			<jsp:include page="footer.jsp"/>
		</div>
	</div><!-- wrap -->
</body>
</html>