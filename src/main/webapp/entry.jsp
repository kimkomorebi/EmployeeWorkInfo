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
				<h2>��� ���� ���</h2>
				<div class="sectionInfo">
					<form action="employeeRegister.do" method="post" onSubmit="return check(this)">
						<table border="1">
							<tr>
								<th>��� ��ȣ[�ڵ� ���]</th>
								<td><input type="text" name="EMPNUMBER" value="<%= employeeNum %>" readonly/></td>
							</tr>
							<tr>
								<th>��� ��й�ȣ</th>
								<td><input type="text" name="PWD"/></td>
							</tr>
							<tr>
								<th>��� �̸�</th>
								<td><input type="text" name="NAME"/></td>
							</tr>
							<tr>
								<th>����</th>
								<td><input type="text" name="SALARY"/></td>
							</tr>
							<tr>
								<th>�۾� ��ȣ[�ڵ� ���]</th>
								<td><input type="text" name="TASKNUMBER" value="<%= workNum%>" readonly/></td>
							</tr>
							<tr>
								<th>�۾� �Ϸ� ������</th>
								<td><input type="date" name="DATE"/></td>
							</tr>
							<tr>
								<th>���� �ڵ�[10~20]</th>
								<td><input type="text" name="BUSINESSCODE"/></td>
							</tr>
							<tr>
								<th>�ٹ��� ��ȣ[1~5]</th>
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
									<input type="submit" value="�� ��" name="btn" class="insertBtn entryPageBtn"/>
									<input type="button" value="�� ȸ" onClick="doSearch()" class="selectBtn entryPageBtn"/>
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
				alert("��� ��й�ȣ�� �Է��� �ּ���."); return false;
			}
			if(fc.NAME.value == ''){
				alert("��� �̸��� �Է��� �ּ���."); return false;
			}
			if(fc.SALARY.value == ''){
				alert("��� ������ �Է��� �ּ���."); return false;
			}
			if(fc.DATE.value == ''){
				alert("�۾� �Ϸ� �������� �Է��� �ּ���."); return false;
			}
			if(fc.BUSINESSCODE.value == ''){
				alert("���� �ڵ带 �Է��� �ּ���."); return false;
			}
			if(10 > fc.BUSINESSCODE.value || fc.BUSINESSCODE.value > 20){
				alert("���� �ڵ�� 10~20������ ���ڸ� �Է��� �ּ���.");
				return false;
			}
			if(confirm("��� ������ ����Ͻðڽ��ϱ�?")){
				return true;
			}else {
				return false;
			}
		}
	</script>
</body>
</html>