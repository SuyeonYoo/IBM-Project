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
function moveSignInPage() {
	location.href = "/common/login";
}

// 회원가입
function signUp() {
	
	if (checkInput()) {
		
	}
}

// 회원가입
function checkInput() {
	
	var usrNm = $("#usrNm").val();
	var usrId = $("#usrId").val();	
	var usrPw = $("#usrPw").val();
	
	if (usrNm == null || usrNm == "") {
		
		$("#myModal").find(".modal-body").text("닉네임을 입력해주세요.");
		$("#myModal").modal();
	} else if (usrId == null || usrId == "") {
		$("#myModal").find(".modal-body").text("이메일을 입력해주세요.");
		$("#myModal").modal();
	} else if (usrPw == null || usrPw == "") {
		$("#myModal").find(".modal-body").text("비밀번호를 입력해주세요.");
		$("#myModal").modal();
	}
	
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
			<h1 class="h4 mb-3 font-weight-normal text-left">Sign up</h1>
			
			<div class="form-label-group">
		        <input type="email" id="inputEmail" class="form-control" placeholder="Email address" required autofocus>
	        </div>
		
	      	<div class="form-label-group">
		        <input type="password" id="inputPassword" class="form-control" placeholder="Password" required>
	      	</div>
		
		    <div class="checkbox mb-3">
		        <label>
		        	<input type="checkbox" value="remember-me"> Remember me
		        </label>
		    </div>
		    <button class="btn btn-lg btn-primary btn-block" type="submit">Sign up</button>
		</form>
	</div>
	
	<!-- Modal -->
	<div class="modal fade" id="myModal" role="dialog">
	    <div class="modal-dialog modal-sm">
	      <div class="modal-content">
	        <div class="modal-header">
	          <button type="button" class="close" data-dismiss="modal">&times;</button>
	          <h4 class="modal-title">BLUEWIKI</h4>
	        </div>
	        <div class="modal-body">
	          <p name="modalCnts">This is a small modal.</p>
	        </div>
	        <div class="modal-footer">
	          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	        </div>
	      </div>
	    </div>
	</div>
</body>
</html>