<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>BLUEWIKI</title>
<!-- CSS -->
<link rel="stylesheet" type="text/css" href="/css/common/signin.css">
<script src="/lib/jquery/jquery.min.js"></script>
<script type="text/javascript">

// 회원가입 페이지로 이동
function moveSignUpPage() {
	location.href = "/common/signup";
}

</script>
</head>
<body>
	<!-- Setting -->
	<jsp:include page="../layout/library.jsp"></jsp:include>

	<!-- posts area -->
	<div class="container">
		<form class="form-signin" method="POST" onsubmit="return false;">
			<div class="row">
				<p class="logoTxt text-center">BlueWiki ; Sign in</p>
			</div>
			
			<div class="form-label-group">
		        <input type="email" id="inputEmail" class="form-control" placeholder="w3id address (abc@kr.ibm.com)" required autofocus>
	        </div>
		
	      	<div class="form-label-group">
		        <input type="password" id="inputPassword" class="form-control" placeholder="Password" required>
	      	</div>
		
		    <button class="btn btn-primary btnSignin" type="submit">Sign In</button>
		    <button class="btn btnSignup" onclick="moveSignUpPage();">Sign up</button>
		</form>
	</div>
</body>
</html>