<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>BLUEWIKI</title>
</head>
<script type="text/javascript">

</script>
<body>
	<!-- Setting -->
	<jsp:include page="../layout/library.jsp"></jsp:include>

	<!-- posts area -->
	<div class="container" style="margin-top: 80px">
		<form id="frm">
			<div class="row">
				<img class="align-bottom" src="/img/login_logo.PNG" style="vertical-align: bottom; height: 100px"> 
				<span class="align-bottom" style="font-size: 70px;">BlueWiki</span>
			</div>
			<br> <br>
			<div class="col-xs-12">
				<p style="font-size: 40px;">Sign up</p>
				<p style="font-size: 20px; margin-left: 5px;">with your <span style="color: #3CAEFF">w3<b>id</b></span></p>
			</div>

			<div class="col-xs-12" style="margin-top: 30px; margin-left: 5px;">
				<p>nickname</p>
				<input type="text" class="form-control" >
				<br>
				<p>w3<b>id</b></p>
				<input type="text" class="form-control" value="@kr.ibm.com">
				<br>
				<p>password</p>
				<input type="password" class="form-control">
			</div>

			<div class="col-xs-12" style="margin-top: 30px; margin-left: 5px;">
				<center>
					<button type="button" class="btn btn-outline-primary" style="margin-right:30px">Sign Up</button>
					<button type="button" class="btn btn-outline-secondary" onclick="moveSignUpPage()">Cancel</button>
				</center>
			</div>
			
		</form>
	</div>
</body>
</html>