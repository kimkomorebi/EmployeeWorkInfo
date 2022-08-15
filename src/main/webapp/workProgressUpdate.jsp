<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.* ,workProgress.* " %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link href="style.css" rel="stylesheet" type="text/css">
<title>사원 정보 관리 시스템</title>
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
				<h2>작업 정보 수정 시스템</h2>
				<div class="sectionInfo">
					<form action="workProgressComplete.do" method="post" onSubmit="return check(this)">
						<table border="1">
						<%
						EmployeeWorkInfo empWorkInfo = (EmployeeWorkInfo)request.getAttribute("EMPWORKINFO");
						%>
							<tr>
								<th>사원 번호<br/>[변경 불가]</th>
								<th>사원 이름<br/>[현재 페이지에서 변경 불가]</th>
								<th>작업 번호<br/>[변경 불가]</th>
								<th>작업 완료 예정일</th>
								<th>업무 코드[10~20]</th>
								<th>근무지 번호[1~5]</th>
								<th>비고</th>
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
								<td><input type="submit" name="COMP" value="수정 완료" onClick="comp()" class="workUpdateBtn workPageBtn"/></td>
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
			alert("업무 코드는 10~20사이 숫자를 입력해 주세요.");
			return false;
		}
		if(fc.LOCATION.value > 5 || fc.LOCATION.value < 1){
			alert("근무지 번호는 1~5 사이 숫자를 입력해 주세요.");
			return false;
		}
		if(confirm("수정하시겠습니까?")){
			return true;
		}else {
			return false;
		}
	}
</script>
</body>
</html>