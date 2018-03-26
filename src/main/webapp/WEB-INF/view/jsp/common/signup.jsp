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

	var $loading = $('#loadingDiv').hide();
	
	$(document)
	.ajaxStart(function () {
	    $loading.show();
	})
	.ajaxStop(function () {
	    $loading.hide();
	});
  
	$(document).ready(function() {
		//$("#pwGroup").hide();
		$("#pwReNotice").hide();
		$("#sendEmailGroup").hide();
		//$("#btnSignup").attr("disabled", true);
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
		},
		mailSendingSuccess : function(data) {
			$("#alertModal").find(".modal-body").text("인증메일이 입력하신 메일주소로 발송되었습니다.");
			$("#alertModal").modal();	
			
			$("#alreadyChk").val("true");
			$("#authNum").val(data);
		},
		signUpSuccess : function(data) {
			
			if(data == "success") {
				location.href="/common/welcome";
			} else {
				console.log(data);
				var message = data;
				$("#alertModal").find(".modal-body").text(data);
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
		        	callback.idChkingSuccess(data);
		        }
	    	});
		}
	}
	
	// confirm modal 호출
	function openConfirmModal(data) {
		
		if (data == "email") {
			$("#confirmModal").find(".modal-body").text("입력한 이메일로 인증 메일을 보내시겠습니까?");
			$("#confirmModal").modal();	
		}
	}
	
	// 이메일 발송
	function sendEmail() {
		var userEmail = $("#usrId").val();
		
		$.ajax({
	        url : "/mail/sendAuthMail",
	        type : 'POST',
	        data : {
	        	userEmail : userEmail,
	        },
	        success: function(data){
	        	callback.mailSendingSuccess(data);
	        }
    	});
	}
	
	// 유효한 인증번호 확인
	function checkAuthNum() {
		
		var alreadyChk = $("#alreadyChk").val();
		
		if (alreadyChk == "true") {
			var userAuthNum = $("#userAuthNum").val();
			var authNum = $("#authNum").val();
			
			if (userAuthNum == authNum) {
				$("#alertModal").find(".modal-body").text("인증번호가 일치합니다.");
				$("#alertModal").modal();
				
				$("#sendEmailGroup").hide();
				$("#pwGroup").show();
				
				$("#btnSignup").attr("disabled", false);
			} else {
				$("#alertModal").find(".modal-body").text("인증번호가 일치하지 않습니다.");
				$("#alertModal").modal();
			}
		} else {
			$("#alertModal").find(".modal-body").text("우선 인증메일을 발송해주세요!");
			$("#alertModal").modal();
		}
	}
	
	// 비밀번호 길이 확인
	function chkLength() {
		var usrPw = $("#usrPw").val();
		
		if (usrPw.length < 8) {
			$("#pwNotice").removeClass();
			$("#pwNotice").addClass("text-danger");
			$("#pwNotice").text("8자리 이상 입력해주세요.");
		} else {
			$("#pwNotice").text("");
		}
	}
	
	// 비밀번호 재입력 확인
	function isSame() {
		
		var usrPw = $("#usrPw").val();
		var usrPwRe = $("#usrPwRe").val();
		
		if (usrPw != usrPwRe) {
			$("#pwReNotice").removeClass();
			$("#pwReNotice").addClass("text-danger");
			$("#pwReNotice").text("비밀번호가 일치하지 않습니다.");
			$("#chkSame").val("false");
		} else if (usrPw == usrPwRe) {
			$("#pwReNotice").removeClass();
			$("#pwReNotice").addClass("text-info");
			$("#pwReNotice").text("비밀번호가 일치합니다.");
			$("#chkSame").val("true");
		}
		
		$("#pwReNotice").show();
	}
	
	// 로그인 페이지로 이동
	function moveSignInPage() {
		location.href = "/common/signin";
	}
	
	// 회원가입
	function signUp() {
		
		var memberId = $("#usrId").val();	
		var pwd = $("#usrPw").val();
		
		if (checkInput()) {
			
			$.ajax({
		        url : "/common/signup_member",
		        type : 'POST',
		        data : {
		        	memberId : memberId,
		        	pwd : pwd
		        },
		        success: function(data){
		        	callback.signUpSuccess(data);
		        },
		        error:function(request,status,error){
		            console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		            $("#alertModal").find(".modal-body").text("회원가입에 실패하였습니다.\n관리자에게 문의하세요.");
					$("#alertModal").modal();
		        }
	    	});
		}
	}
	
	// 회원가입
	function checkInput() {
		
		var usrId = $("#usrId").val();	
		var usrPw = $("#usrPw").val();
		var usrPwRe = $("#usrPwRe").val();
		var alreadyChk = $("#alreadyChk").val();
		var chkSame = $("#chkSame").val();
		
		if (usrId == null || usrId == "") {
			$("#alertModal").find(".modal-body").text("이메일을 입력해주세요.");
			$("#alertModal").modal();
			
			return false;
		} else if (usrPw == null || usrPw == "") {
			$("#alertModal").find(".modal-body").text("비밀번호를 입력해주세요.");
			$("#alertModal").modal();
			
			return false;
		} else if (usrPwRe == null || usrPwRe == "") {
			$("#alertModal").find(".modal-body").text("비밀번호를 재입력해주세요.");
			$("#alertModal").modal();
			
			return false;
		} /* else if (alreadyChk != "true") {
			$("#alertModal").find(".modal-body").text("이메일 인증이 이루어지지 않았습니다.");
			$("#alertModal").modal();
			
			return false;
		} */ else if (chkSame != "true") {
			$("#alertModal").find(".modal-body").text("비밀번호가 일치하지 않습니다.");
			$("#alertModal").modal();
			
			return false;
		} else if (usrPw.length < 8 || usrPw.length > 20) {
			$("#alertModal").find(".modal-body").text("비밀번호는 8~20 자 이내로 입력해주세요.");
			$("#alertModal").modal();
			
			return false;
		}
		
		return true;
	}

</script>
</head>
<body>
	<!-- Setting -->
	<jsp:include page="../layout/library.jsp"/>
	<!-- posts area -->
	<div class="container">
		<form class="form-signin" method="POST" onsubmit="return false;">
			
			<div class="logo-box">
				<img class="align-center logoImg" src="/img/login_logo.PNG"> 
				<span class="align-bottom logoName">BlueWiki</span>
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
					<input type="text" id="userAuthNum" class="form-control">
				</div>
		    	<button class="btn btn-outline-info" onclick="checkAuthNum()">인증확인</button>
		    	<input type="hidden" id="authNum" value=""/>
		    	<input type="hidden" id="alreadyChk" value=""/>
	        </div>
	        
	        <div id="pwGroup">
	        	<div class="form-label-group">
			        <input type="password" id="usrPw" class="form-control" placeholder="Password" maxlength="20" onkeyup="chkLength()">
			        <h6 class="text-muted">비밀번호는 8~20 자 이내로 입력해주세요.</h6>
			        <h6 class="text-muted">비밀번호는 숫자, 영문, 특수문자(!@$%^&* 만 허용) 를 조합해주세요.</h6>
			        <h6 class='text-danger' id="pwNotice"></h6>
		      	</div>
		      	
		      	<div class="form-label-group" id="pwReGroup">
			        <input type="password" id="usrPwRe" class="form-control" placeholder="Re-enter Password" maxlength="20" onkeyup="isSame()">
		      		<h6 class="text-info" id="pwReNotice">비밀번호가 일치합니다.</h6>
		      		<input type="hidden" id="chkSame" value="">
		      	</div>
	        </div>
		    
		    <button class="btn btn-info btnSignin" type="submit" id="btnSignup" onclick="signUp();">Sign Up</button>
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
	        <button type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
	      </div>
	    </div>
	  </div>
	</div>
</body>
</html>