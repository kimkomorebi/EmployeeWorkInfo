<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.* , workProgress.* " %>
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
				<h2>작업 정보 조회</h2>
				<div class="secEmployeeInfo">
						<table border="1">
							<tr>
								<th>사원 번호</th>
								<th>사원 이름</th>
								<th>작업 번호</th>
								<th>작업 완료 예정일</th>
								<th>업무 코드</th>
								<th>근무지 번호</th>
								<th>수정 / 삭제</th>
							</tr>
<%
							ArrayList list = (ArrayList)request.getAttribute("LIST");
							int size = list.size();
							for(int i=0; i<size; i++){
								EmployeeWorkInfo empWorkInfo = (EmployeeWorkInfo)list.get(i);
%>
					<form action="workProgressUpdate.do" method="post" onSubmit="return check(this)" >

							<tr>
								<td>
									<%-- <input type="text" name="EMPNUM" value="<%= empWorkInfo.getEmpnum()  %>" readonly class="empNum"/> --%>
									<input type="hidden" name="EMPNUM" value="<%= empWorkInfo.getEmpnum()  %>"/>
									<%= empWorkInfo.getEmpnum()  %>
								</td>
								<td><%= empWorkInfo.getEmpname()  %></td>
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
								out.print("서울");
							}else if(location == 2){
								out.print("인천");
							}else if(location == 3){
								out.print("경기");
							}else if(location == 4){
								out.print("강원");
							}else if(location == 5){
								out.print("부산");
							}else {
								out.print("잘못 입력");
							}
						%>
								</td>
								<td colsapn="2">
									<input type="submit" name="btn" value="수 정" class="workUpdateBtn workPageBtn"/>
									<input type="submit" name="btn" value="삭 제" class="workDeleteBtn workPageBtn"/>
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
			if(confirm("작업을 진행하시겠습니까?")){
				return true;
			}else{
				return false;
			}
		}
	</script>
</body>
</html>