<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<div class="title"><h1><a href="index.jsp">��� ���� ���� �ý���</a></h1></div>
<%
	String id = (String)session.getAttribute("LOGINID");

%>
<%-- <div class="welcomeComment">
	<p>�������! <%= id %> �����!</p>
</div> --%>
<nav>
	<ul>
		<li><a href="employeeEntry.do">��� ���� ���</a></li><!-- entry.jsp -->
		<li><a href="employeeInfoAll.do">��� ���� ��ȸ</a></li>
		<li><a href="workProgress.do">�۾� ���� ��ȸ</a></li>
		<li><a href="workNumberInfo.do">�۾� ��ȣ ����</a></li>
		<li><a href="index.jsp">Ȩ����</a></li>
		<%
			
			if(id == null){
		%>
		<li><a href="login.jsp">�α���</a></li>
		<%
			}else {
				/* if(id.equals("201")){
					id = "�����";
				}else if(id.equals("202")){
					id = "������";
				}else if(id.equals("203")){
					id = "����";
				}else if(id.equals("204")){
					id = "��浿";
				}else if(id.equals("205")){
					id = "�谡��";
				}else if(id.equals("206")){
					id = "�輼��";
				}else if(id.equals("207")){
					id = "�輱��";
				} */
		%>
		<li class="logoutBtn">
			<a href="logout.do"">�α׾ƿ�</a>
			<span class="welcomeComment">�������! <%= id %> �����!</span>
		</li>
		<%		
			}
		%>
		
	</ul>
</nav>