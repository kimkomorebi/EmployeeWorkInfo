<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.* , workProgress.* " %>
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
				<h2>�۾� ��ȣ ��ȸ �� ����</h2>
				<div class="secEmployeeInfo">
						<table border="1">
							<tr>
								<th>�۾� ��ȣ</th>
								<th>�۾� �Ϸ� ������</th>
								<th>���� �ڵ�</th>
								<th>�ٹ��� ��ȣ</th>
								<th>���� / ����</th>
							</tr>
<%
							ArrayList list = (ArrayList)request.getAttribute("LIST");
							int size = list.size();
							for(int i=0; i<size; i++){
								EmployeeWorkInfo empWorkInfo = (EmployeeWorkInfo)list.get(i);
%>
					<form action="workNumberDelete.do" method="post" onSubmit="return check(this)" >

							<tr>
								<td>
									<%-- <input type="text" name="WORKNUM" value="<%= empWorkInfo.getWokrnum()  %>" readonly class="wokrNum"/> --%>
									<input type="hidden" name="WORKNUM" value="<%= empWorkInfo.getWokrnum()  %>"/>
									<%= empWorkInfo.getWokrnum()  %>
								</td>
								<td><%= empWorkInfo.getWorkdate() %></td>
								<td><%= empWorkInfo.getBiscode()  %></td>
								<td>
						<%
							int location = empWorkInfo.getLocacode();
							if(location == 1){
								out.print("����");
							}else if(location == 2){
								out.print("��õ");
							}else if(location == 3){
								out.print("���");
							}else if(location == 4){
								out.print("����");
							}else if(location == 5){
								out.print("�λ�");
							}else {
								out.print("�߸� �Է�");
							}
						%>
								</td>
								<td colsapn="2">
									<input type="submit" name="btn" value="�� ��" class="workNumDeleteBtn workPageBtn"/>
								</td>
							</tr>
					</form>
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
	<script type="text/javascript">
		function check(){
			if(confirm("���� �����Ͻðڽ��ϱ�?")){
				return true;
			}else{
				return false;
			}
		}
	</script>
</body>
</html>