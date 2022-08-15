<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
				<h2>사원 정보 관리 시스템</h2>
				<div class="sectionInfo">
					<p>
						1. 회사 사원의 기본적인 정보를 조회 등록 수정 및 삭제할 수 있습니다.<br/>
						2. 위의 메뉴 네 개 중 원하는 작업을 선택해주세요.<br/>
						3. 기본적인 사원 정보와 사원의 작업 현황 정보는 따로 구분돼 있습니다.<br/>
						4. 데이터를 조회 후에 변경 및 삭제가 가능합니다.<br/>
						5. 새로운 사원 등록은 조회를 하지 않아도 가능합니다.<br/>
						6. 데이터를 수정 및 삭제를 할 시에는 신중하게 생각하시고 진행하여 주시기 바랍니다.<br/>
						7. 로그인시 사원 번호(ID)와 비밀번호를 입력해주세요. 사원 번호는 숫자입니다.<br/>
						8. 사원 번호는 자동 등록됩니다.<br/>
						9. '사원 정보 및 수정' 페이지에서 사원 정보를 삭제해도 작업 번호는 남아있습니다.<br>
						작업 번호도 삭제 희망시 '작업 번호 관리 페이지'에서 별도로 삭제해 주세요.<br>
						10. '작업 현황 조회 및 수정' 페이지와 '작업 번호 관리 페이지'에서 데이터 삭제시<br>
						해당 작업 번호에 등록돼 있던 사원 정보도 함께 삭제됩니다.
						
					</p>
				</div>
			</section>
		</div>
		<div id="footerWrap">
			<jsp:include page="footer.jsp"/>
		</div>
	</div><!-- wrap -->
</body>
</html>