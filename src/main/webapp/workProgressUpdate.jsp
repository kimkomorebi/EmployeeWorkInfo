<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.* ,workProgress.* " %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link href="style.css" rel="stylesheet" type="text/css">
<title>��� ���� ���� �ý���</title>
</head>
<body>
<%
	String worknum = request.getParameter("WORKNUM");
	
%>
<div id="wrap">
		<div id="headerWrap">
			<header>
				<jsp:include page="headerMenu.jsp"/>
			</header>
		</div>
		<div class="" id="sectionWrap">
			<section>
				<h2>�۾� ���� ���� �ý���</h2>
				<div class="sectionInfo">
					<form action="workProgressComplete.do" method="post" onSubmit="return check(this)">
						<table border="1">
						<%
						EmployeeWorkInfo empWorkInfo = (EmployeeWorkInfo)request.getAttribute("EMPWORKINFO");
						%>
							<tr>
								<th>��� ��ȣ<br/>[���� �Ұ�]</th>
								<th>��� �̸�<br/>[���� ���������� ���� �Ұ�]</th>
								<th>�۾� ��ȣ<br/>[���� �Ұ�]</th>
								<th>�۾� �Ϸ� ������</th>
								<th>���� �ڵ�[10~20]</th>
								<th>�ٹ��� ��ȣ[1~5]</th>
								<th>���</th>
							</tr>
							<tr>
								<td>
									<input type="text" name="EMPNUM" value="<%= empWorkInfo.getEmpnum()  %>" readonly class="notUpdate"/>
								</td>
								<td>
									<input type="text" name="EMPNAME" value="<%= empWorkInfo.getEmpname() %>" readonly class="notUpdate"/>
								</td>
								<td>
									<input type="text" name="WORKNUM" value="<%= empWorkInfo.getWokrnum() %>" readonly class="notUpdate"/>
								</td>
								<td><input type="date" name="WORKDATE" value="<%= empWorkInfo.getWorkdate() %>"/></td>
								<td><input type="text" name="BUSICODE" value="<%= empWorkInfo.getBiscode()  %>"/></td>
								<td><input type="text" name="LOCATION" value="<%= empWorkInfo.getLocacode() %>"/></td>
								<td><input type="submit" name="COMP" value="���� �Ϸ�" onClick="comp()" class="workUpdateBtn workPageBtn"/></td>
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
	function check(fc){
		if(fc.BUSICODE.value < 10 || fc.BUSICODE.value > 20){
			alert("���� �ڵ�� 10~20���� ���ڸ� �Է��� �ּ���.");
			return false;
		}
		if(fc.LOCATION.value > 5 || fc.LOCATION.value < 1){
			alert("�ٹ��� ��ȣ�� 1~5 ���� ���ڸ� �Է��� �ּ���.");
			return false;
		}
		if(confirm("�����Ͻðڽ��ϱ�?")){
			return true;
		}else {
			return false;
		}
	}
</script>
</body>
</html>