<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>BLUEWIKI</title>
<jsp:include page="../layout/library2.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="/css/common/signin.css">
<script type="text/javascript">

// 회원가입 페이지로 이동
function moveSignUpPage() {
	location.href = "/common/signup";
}

</script>
</head>
<body>
	<!-- posts area -->
	<div class="container">
		<form class="form-signin" method="POST" onsubmit="return false;">
			<div class="logo-box">
				<img class="align-center logoImg" src="/img/login_logo.PNG"> 
				<span class="align-bottom logoName">BlueWiki</span>
			</div>
			
			<div class="form-label-group">
		        <input type="email" id="inputEmail" class="form-control" placeholder="w3id address (abc@kr.ibm.com)" required autofocus>
	        </div>
		
	      	<div class="form-label-group">
		        <input type="password" id="inputPassword" class="form-control" placeholder="비밀번호" required>
	      	</div>
		
		    <button class="btn btn-info btnSignin" type="submit">로그인</button>
		    <button class="btn btnSignup" onclick="moveSignUpPage();">회원가입</button>
		</form>
	</div>
</body>
</html>