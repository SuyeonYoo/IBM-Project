<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>BLUEWIKI</title>
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
			<div>
				<img class="align-center logoImg" src="/img/login_logo.PNG"> 
				<span class="align-bottom logoName">BlueWiki</span>
			</div>
			
			<h2 class="text-center text-secondary">회원가입이 완료되었습니다!</h2>
			<button class="btn btn-info startBtn" onclick="moveSignInPage();">Start Bluewiki</button>
		</div>
	</div>
</body>
</html>