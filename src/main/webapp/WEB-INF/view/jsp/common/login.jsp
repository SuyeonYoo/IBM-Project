<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>BLUEWIKI</title>
</head>
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
			<!-- <div class="col-xs-12">
				<h4>&nbsp;Looks like you are new today</h4>
				<h1 style="margin-top:0px !important;"><b>Recheck yoru Id or Sign up</b></h1>
			</div> -->
			<div class="col-xs-12">
				<p style="font-size: 40px;">Sign in</p>
				<p style="margin-left: 5px;">with your <span style="color: #3CAEFF">w3<b>id</b></span></p>
			</div>

			<div class="col-xs-12" style="margin-top: 30px; margin-left: 5px;">
				<p>w3<b>id</b></p>
				<input type="text" class="form-control" value="@kr.ibm.com">
				<br>
				<p>password</p>
				<input type="password" class="form-control">
			</div>

			<div class="col-xs-12" style="margin-top: 10px; margin-left: 30px;">
				<input type="checkbox" class="form-check-input" id="exampleCheck1">Log on automatically for the next time
			</div>

			<div class="col-xs-12" style="margin-top: 30px; margin-left: 5px;">
				<center>
					<button type="button" class="btn btn-outline-primary" style="margin-right:30px">SignIn</button>
					<button type="button" class="btn btn-outline-secondary">SignUp</button>
				</center>
			</div>
			
		</form>
	</div>
</body>
</html>