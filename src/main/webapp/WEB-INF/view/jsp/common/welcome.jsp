<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>블루팁스</title>
<jsp:include page="../layout/library2.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="/css/common/welcome.css">
<script type="text/javascript">
	//로그인 페이지로 이동
	function moveSignInPage() {
		location.href = "/common/signin";
	}
</script>
</head>
<body>
	<!-- posts area -->
	<div class="container">
		<div class="welcome-box">
			<div style="text-align: center; margin-bottom: 30px; margin-top: 15%;">
				<img class="align-bottom logoImg" src="/img/mainLogo.PNG"> 
			</div>
			
			<button class="btn btn-info startBtn" onclick="moveSignInPage();">드디어 시작하기</button>
		</div>
	</div>
</body>
</html>