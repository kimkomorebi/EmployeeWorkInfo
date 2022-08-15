<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.*, employeeInfo.* " %>
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
				<h2>��� ���� ��ȸ</h2>
				<div class="secEmployeeInfo">
					<table border="1">
						<tr>
							<th>�����ȣ</th>
							<th>��� ��й�ȣ</th>
							<th>��� �̸�</th>
							<th>����</th>
							<th>�۾� ��ȣ</th>
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