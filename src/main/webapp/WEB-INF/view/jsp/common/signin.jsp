<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>블루팁스</title>
<jsp:include page="../layout/library2.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="/css/common/signin.css">
<script type="text/javascript">

	//콜백설정
	var callback = {		
		signInSuccess : function(data) {
	
			if(data == "success") {
				location.href = "/common/searchPage";
			} else if (data == "fail") {
				$("#alertModal").find(".modal-body").text("아이디와 비밀번호를 확인해주세요.");
				$("#alertModal").modal();
			}
		}
	}
	
	// 로그인
	function signin() {
		
		var memberId = $("#usrId").val();
		var pwd = $("#usrPw").val();
		
		if(checkInput()) {
			$.ajax({
		        url : "/common/signin_member",
		        type : 'POST',
		        data : {
		        	memberId : memberId,
		        	pwd : pwd
		        },
		        success: function(data){
		        	callback.signInSuccess(data);
		        },
		        error:function(request,status,error){
		            console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		            $("#alertModal").find(".modal-body").text("로그인에 실패하였습니다.\n관리자에게 문의하세요.");
					$("#alertModal").modal();
		        }
	    	});
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
			<div class="row" style="text-align: center; margin-bottom: 30px; margin-top: 15%;">
				<img class="align-bottom logoImg" src="../img/mainLogo.png"> 
			</div>
			
			<div class="form-label-group">
		        <input type="text" id="usrId" class="form-control" placeholder="w3id address (abc@kr.ibm.com)" autofocus>
	        </div>
		
	      	<div class="form-label-group">
		        <input type="password" id="usrPw" class="form-control" maxlength="20" placeholder="비밀번호" >
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
	          <h4 class="modal-title">블루팁스</h4>
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
	        <h5 class="modal-title" id="exampleModalLabel">블루팁스</h5>
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