<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>BLUEWIKI</title>
<jsp:include page="../layout/library2.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="/css/common/signin.css">
<script type="text/javascript">

	// 로그인
	function signin() {
		
		if(checkInput()) {
			
		}
	}
	
	function checkInput() {
		
		var usrId = $("#usrId").val();
		var usrPw = $("#usrPw").val();
		var idArray = usrId.split("@");
		
		if (usrId == null || usrId == "") {
			$("#alertModal").find(".modal-body").text("이메일을 입력해주세요.");
			$("#alertModal").modal();
			
			return false;
		} else if (idArray[1] != "kr.ibm.com") {
			$("#alertModal").find(".modal-body").text("이메일을 형식에 맞춰 입력해주세요.\n(abc@kr.ibm.com)");
			$("#alertModal").modal();
			
			return false;
		} else if (usrPw == null || usrPw == "") {
			$("#alertModal").find(".modal-body").text("비밀번호를 입력해주세요.");
			$("#alertModal").modal();
			
			return false;
		} else if (usrPw.length < 8 || usrPw.length > 20) {
			$("#alertModal").find(".modal-body").text("비밀번호는 8~20 자 이내로 입력해주세요.");
			$("#alertModal").modal();
			
			return false;
		}
		
		return true;
	}
	
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
				<span class="align-bottom logoName">블루위키</span>
			</div>
			
			<div class="form-label-group">
		        <input type="text" id="usrId" class="form-control" placeholder="w3id address (abc@kr.ibm.com)" autofocus>
	        </div>
		
	      	<div class="form-label-group">
		        <input type="password" id="usrPw" class="form-control" placeholder="비밀번호" >
	      	</div>
		
		    <button class="btn btn-info btnSignin" onclick="signin()">로그인</button>
		    <button class="btn btnSignup" onclick="moveSignUpPage();">회원가입</button>
		</form>
	</div>
	
	<!-- Modal -->
	<div class="modal fade" id="alertModal" role="dialog">
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
	
	<!-- Modal -->
	<div class="modal fade" id="confirmModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-sm" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	        <p name="modalCnts">This is a small modal.</p>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
	        <button type="button" class="btn btn-primary" id="btnConfirm" data-dismiss="modal">확인</button>
	        <input type="hidden" id="conType" value=""/>
	      </div>
	    </div>
	  </div>
	</div>
	
	<!-- Loading -->
	<div id="loading" class="wrap-loading display-none">
    	<div><img src="/img/loading3.gif"/></div>
	</div> 
</body>
</html>