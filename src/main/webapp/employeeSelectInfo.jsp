<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="employeeInfo.* " %>
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
				<h2>��� ���� ���� �� ����</h2>
				<div class="">
					<form action="employeeInfoUpdate.do" method="post" onSubmit="return check()">
						<table border="1">
<%
	EmployeeInfo empinfo = (EmployeeInfo)request.getAttribute("EMPINFO");
%>
							<tr>
								<th>�����ȣ</th>
								<td>
									<input type="hidden" name="EMPNUMBER" value="<%= empinfo.getEmpnum() %>"/>
									<%-- <input type="text" name="EMPNUMBER" value="<%= empinfo.getEmpnum() %>" readonly/> --%>
									<%= empinfo.getEmpnum() %>
								</td>
							</tr>
							<tr>
								<th>��� ��й�ȣ</th>
								<td><input type="password" name="PWD" value="<%= empinfo.getEmppwd() %>"/></td>
							</tr>
							<tr>
								<th>��� �̸�</th>
								<td><input type="text" name="NAME" value="<%= empinfo.getEmpname() %>"/></td>
							</tr>
							<tr>
								<th>����</th>
								<td><input type="text" name="SALARY" value="<%= empinfo.getSalary() %>"/></td>
							</tr>
							<tr>
								<th>�۾� ��ȣ</th>
								<td>
									<input type="hidden" name="TASKNUMBER" value="<%= empinfo.getWorknum() %>"/>
									<%= empinfo.getWorknum() %>
								</td>
							</tr>
							<tr>
								<td colspan="2">
									<input type="submit" value="�� ��" name="btn" class="workUpdateBtn employeePageBtn"/>
									<input type="submit" value="�� ��" name="btn" class="workDeleteBtn employeePageBtn"/>
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
	function check(){
		if(confirm("������ �۾��� �����Ͻðڽ��ϱ�?")){
			return true;
		}else {
			return false;
		}
	}
</script>
</body>
</html>