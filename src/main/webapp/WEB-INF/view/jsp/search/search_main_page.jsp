<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>블루팁스</title>
<jsp:include page="../search/search_main_navbar.jsp"></jsp:include>
<jsp:include page="../common/sidebar.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="/css/common/search_main.css">
<script>

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

	var ArrResult = new Array();
	
	$(document).ready(function() {
		$('#search').focus();
		
		/* 검색어 입력 시 */
		$("#search").keyup(function(){
			var title = $("[name=title]").val();
			var data = {"title" : title};
			console.log(title);
			
			$.ajax({
				type : 'POST',
	      url : '/board/searchtxt',
	      data : data,
	      success:function(result){
	      	
	      	if(result.resultList.length > 0)
	      		ArrResult.length = 0;
	      	
					for (var i=0; i < result.resultList.length; i++){
						ArrResult.push(result.resultList[i].title);	
					}
					console.log(ArrResult);
	
	      }
	  	});
		});	
		
		/* 검색어  자동완성 */
		$('#search').typeahead({
	    source: ArrResult
		});
		
	});
	
	function openNav() {
	    document.getElementById("mySidenav").style.width = "300px";
	}

	function closeNav() {
	    document.getElementById("mySidenav").style.width = "0";
	}
</script>
</head>
<body>
	<div class="container">
		<div class="row" style="text-align: center; margin-bottom: 30px; margin-top: 15%;">
			<img class="align-bottom logoImg" src="/img/mainLogo.PNG"> 
		</div>
	    
	    <div class="input-group" style="width:50%; margin:0 auto;">
		    <input type="text" class="form-control" id="search" placeholder="궁금한게 뭐예요?">
		    <span class="input-group-btn">
		        <button type="button" class="btn btn-info">찾기</button>
		    </span>
		</div>
	</div>
	
	<div class="btn-chat">
		<button type="button" class="btn btn-primary btn-circle btn-xl" onclick="openNav()">챗봇</button>
	</div>
</body>
</html>