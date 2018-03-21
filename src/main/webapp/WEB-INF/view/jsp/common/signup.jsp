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
		$("#pwGroup").hide();
		$("#sendEmailGroup").hide();
		$("#btnSignup").attr("disabled","disabled");
	});
	
	// 콜백설정
	var callback = {		
		idChkingSuccess : function(data) {

			if(data == "true") {
				$("#alertModal").find(".modal-body").text("사용가능한 이메일입니다.");
				$("#alertModal").modal();	
				$("#sendEmailGroup").show();
			} else {
				$("#alertModal").find(".modal-body").text("이미 사용 중인 이메일입니다.");
				$("#alertModal").modal();
			}
		}
	}
	
	// ID 중복확인
	function checkExId() {
		
		var usrId = $("#usrId").val();
		var idArray = usrId.split("@");
		
		if (idArray[1] != "kr.ibm.com") {
			$("#alertModal").find(".modal-body").text("이메일을 형식에 맞춰 입력해주세요.\n(abc@kr.ibm.com)");
			$("#alertModal").modal();
		} else {
			
			$.ajax({
		        url : "/common/checkExistedId",
		        type : 'POST',
		        data : {
		        	usrId : usrId,
		        },
		        success: function(data){
		        	console.log(data);
		        	callback.idChkingSuccess(data);
		        }
	    	});
		}
	}
	
	// 이메일 발송
	function sendEmail() {
		var userEmail = $("#usrId").val();
		
		$.ajax({
	        url : "/sendEmail/verifyEmail",
	        type : 'POST',
	        data : {
	        	userEmail : userEmail,
	        },
	        success: function(data){
	        	console.log(data);
	        	callback.idChkingSuccess(data);
	        }
    	});
	}

	// confirm modal 호출
	function openConfirmModal(data) {
		
		if (data == "email") {
			$("#confirmModal").find(".modal-body").text("입력한 이메일로 인증 메일을 보내시겠습니까?");
			$("#confirmModal").modal();	
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
			$("#alertModal").find(".modal-body").text("이메일을 입력해주세요.");
			$("#alertModal").modal();
		} else if (usrPw == null || usrPw == "") {
			$("#alertModal").find(".modal-body").text("비밀번호를 입력해주세요.");
			$("#alertModal").modal();
		} else if (usrPwRe == null || usrPwRe == "") {
			$("#alertModal").find(".modal-body").text("비밀번호를 재입력해주세요.");
			$("#alertModal").modal();
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
	        
	        <div class="form-label-group" id="sendEmailGroup">
	        	<h5 class="guideTxt"> <a onclick="openConfirmModal('email')" >IBMer 인증하기</a><small> 블루위키는 우리만의 공간이잖아요 ;)</small></h5>
				<div class="inputEmail">
					<input type="email" id="chkNum" class="form-control">
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
	        <button type="button" class="btn btn-primary" onclick="sendEmail()">확인</button>
	      </div>
	    </div>
	  </div>
	</div>
</body>
</html>