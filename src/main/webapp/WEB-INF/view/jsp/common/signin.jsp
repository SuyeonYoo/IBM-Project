<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>BLUEWIKI</title>
<!-- CSS -->
<link rel="stylesheet" type="text/css" href="/css/common/signin.css">
</head>
<script type="text/javascript">

// 회원가입 페이지로 이동
function moveSignUpPage() {
	location.href = "/common/signup";
}

</script>
<body>
	<!-- Setting -->
	<jsp:include page="../layout/library.jsp"></jsp:include>

	<!-- posts area -->
	<div class="container">
		<form class="form-signin">
			<div class="row">
				<p class="logoTxt text-center">BlueWiki</p>
			</div>
			<h1 class="h4 mb-3 font-weight-normal text-left">Sign In</h1>
			
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