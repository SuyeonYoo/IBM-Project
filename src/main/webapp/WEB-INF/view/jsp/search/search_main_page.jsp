<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>블루팁스</title>
<jsp:include page="../search/search_main_navbar.jsp"></jsp:include>
<jsp:include page="../common/sidebar.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="/css/common/search_main.css">
<style type="text/css">
.dropdown-menu {
    min-width: 90%;
}
</style>
<script type="text/javascript">

	if (member_id == 'null') {
		$("#alertModal").find(".modal-body").text("로그인 해주세요.");
		$("#alertModal").modal();
		
		$("#alertEventType").val("sessionNull");
	}
	
	$(function() {		
		$("#btnAlertModalClose").click(function() {
			var alertEventType = $(this).next().val();
			
			if (alertEventType == "sessionNull") {
				location.href = "/common/signin";	
			}
		});
	});
	
	$(document).ready(function() {
		$(".closebtn").hide();
	});
	
	function openNav() {
	    document.getElementById("mySidenav").style.width = "350px";
	    $(".closebtn").show();
	}

	function closeNav() {
	    document.getElementById("mySidenav").style.width = "0";
	    $(".closebtn").hide();
	}
	
</script>
<script type="text/javascript" src="/js/search.js"></script>
</head>
<body>
	<div class="container">
		<div class="row" style="text-align: center; margin-bottom: 30px; margin-top: 15%;">
			<img class="align-bottom logoImg" src="../img/mainLogo.png"> 
		</div>
	    
	    <div class="input-group" style="width:50%; margin:0 auto;">
		    <input type="text" class="form-control" id="search" placeholder="궁금한게 뭐예요?" name="title">
		    <span class="input-group-btn">
		        <button type="button" class="btn btn-info" id="btnSearch">찾기</button>
		    </span>
		</div>
	</div>
	
	<div class="btn-chat">
		<button type="button" class="btn btn-primary btn-circle btn-xl" onclick="openNav()">ㅊ</button>
	</div>
</body>
</html>