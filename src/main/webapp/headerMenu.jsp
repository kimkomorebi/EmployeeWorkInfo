<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<div class="title"><h1><a href="index.jsp">사원 정보 관리 시스템</a></h1></div>
<%
	String id = (String)session.getAttribute("LOGINID");

%>
<%-- <div class="welcomeComment">
	<p>어서오세요! <%= id %> 사원님!</p>
</div> --%>
<nav>
	<ul>
		<li><a href="employeeEntry.do">사원 정보 등록</a></li><!-- entry.jsp -->
		<li><a href="employeeInfoAll.do">사원 정보 조회</a></li>
		<li><a href="workProgress.do">작업 정보 조회</a></li>
		<li><a href="workNumberInfo.do">작업 번호 관리</a></li>
		<li><a href="index.jsp">홈으로</a></li>
		<%
			
			if(id == null){
		%>
		<li><a href="login.jsp">로그인</a></li>
		<%
			}else {
				/* if(id.equals("201")){
					id = "김희망";
				}else if(id.equals("202")){
					id = "김절망";
				}else if(id.equals("203")){
					id = "김용기";
				}else if(id.equals("204")){
					id = "김길동";
				}else if(id.equals("205")){
					id = "김가로";
				}else if(id.equals("206")){
					id = "김세로";
				}else if(id.equals("207")){
					id = "김선배";
				} */
		%>
		<li class="logoutBtn">
			<a href="logout.do"">로그아웃</a>
			<span class="welcomeComment">어서오세요! <%= id %> 사원님!</span>
		</li>
		<%		
			}
		%>
		
	</ul>
</nav>