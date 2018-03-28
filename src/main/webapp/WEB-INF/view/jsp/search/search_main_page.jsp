<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>BLUEWIKI</title>
<jsp:include page="../search/search_main_navbar.jsp"></jsp:include>
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
</script>
</head>
<body>
	<div class="container">
		<div class="row" style="text-align: center; margin-bottom: 30px; margin-top: 15%;">
			<img class="align-bottom" src="/img/login_logo.PNG" style="vertical-align: bottom; height: 100px"> 
			<span class="align-bottom" style="font-size: 70px;">BlueWiki</span>
		</div>
		
		<div style="width:50%; margin:0 auto;">
	        <div class="slinput" style="text-align: center">
	        	<i class="fa fa-search left-icon"></i> 
	            <input class="form-control form-control-lg form-control--rounded" type="search" name="title" id="search" placeholder="Search" autocomplete="off">
	        </div>
	    </div>
	</div>
</body>
</html>