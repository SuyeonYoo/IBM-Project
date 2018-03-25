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

	$(document).ready(function() {
		//$("#pwGroup").hide();
		//$("#btnSignup").attr("disabled","disabled");
	});
	
	function checkExId() {
		
		var usrId = $("#usrId").val();
		var idArray = usrId.split("@");
		
		if (idArray[1] != "kr.ibm.com") {
			$("#myModal").find(".modal-body").text("이메일을 형식에 맞춰 입력해주세요.\n(abc@kr.ibm.com)");
			$("#myModal").modal();
		} else {
			
			$.ajax({
		        url : "/common/checkExistedId",
		        type : 'POST',
		        data : {
		        	usrId : usrId,
		        },
		        success: function(data){
		        	$("#myModal").find(".modal-body").text(data.resultData);
					$("#myModal").modal();
		        }
	    	});
		}
	}
	
	// 로그인 페이지로 이동
	function moveSignInPage() {
		location.href = "/common/signin";
	}
	
	// 회원가입
	function signUp() {
		
		if (checkInput()) {
			
		}
	}
	
	// 회원가입
	function checkInput() {
		
		var usrId = $("#usrId").val();	
		var usrPw = $("#usrPw").val();
		var usrPwRe = $("#usrPwRe").val();
		
		if (usrId == null || usrId == "") {
			$("#myModal").find(".modal-body").text("이메일을 입력해주세요.");
			$("#myModal").modal();
		} else if (usrPw == null || usrPw == "") {
			$("#myModal").find(".modal-body").text("비밀번호를 입력해주세요.");
			$("#myModal").modal();
		} else if (usrPwRe == null || usrPwRe == "") {
			$("#myModal").find(".modal-body").text("비밀번호를 재입력해주세요.");
			$("#myModal").modal();
		}
		
	}

</script>
</head>
<body>
	<!-- Setting -->
	<jsp:include page="../layout/library.jsp"/>
	<!-- posts area -->
	<div class="container">
		<form class="form-signin" method="POST" onsubmit="return false;">
			
			<div class="row">
				<p class="logoTxt text-center">BlueWiki ; Sign up</p>
				<br/>
			</div>
			
			<div class="form-label-group">
				<div class="inputEmail">
					<input type="email" id="usrId" class="form-control" placeholder="w3id address (abc@kr.ibm.com)">
				</div>
		    	<button class="btn btn-outline-info" onclick="checkExId()">중복확인</button>
	        </div>
	        
	        <div class="form-label-group" id="idChecking">
	        	<h5 class="guideTxt"> <a href="" onclick="" >IBMer 인증하기</a><small> 블루위키는 우리만의 공간이잖아요 ;)</small></h5>
				<div class="inputEmail">
					<input type="email" id="chkNum" class="form-control" placeholder="w3id address (abc@kr.ibm.com)">
				</div>
		    	<button class="btn btn-outline-info" onclick="checkExId()">인증확인</button>
	        </div>
	        
	        <div id="pwGroup">
	        	<div class="form-label-group">
			        <input type="password" id="usrPw" class="form-control" placeholder="Password">
		      	</div>
		      	
		      	<div class="form-label-group">
			        <input type="password" id="usrPwRe" class="form-control" placeholder="Re-enter Password">
		      	</div>
	        </div>
		    
		    <button class="btn btn-primary btnSignin" type="submit" id="btnSignup">Sign Up</button>
		    <button class="btn btnSignup" onclick="moveSignInPage();">Cancel</button>
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