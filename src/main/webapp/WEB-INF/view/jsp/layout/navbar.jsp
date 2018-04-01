<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>블루팁스</title>
<jsp:include page="../layout/library.jsp"></jsp:include>
<script type="text/javascript" src="/js/search.js"></script>
<script type="text/javascript">
	var member_id = "<%=(String)session.getAttribute("member_id")%>";
	
	$(document).ready(function() {
		console.log(member_id);
		
		if (member_id == 'null') {
			$("#alertModal").find(".modal-body").text("로그인 해주세요.");
			$("#alertModal").modal();
			
			$("#alertEventType").val("sessionNull");
		}
	});
	
	$(function() {		
		$("#btnAlertModalClose").click(function() {
			var alertEventType = $(this).next().val();
			
			if (alertEventType == "sessionNull") {
				location.href = "/common/signin";	
			}
		});
	});
	
</script>
</head>
<body>
<!-- navbar -->
	<nav class="navbar navbar-default">
	
	   <div class="container-fluid text-right">
	     <div class="nav navbar-nav navbar-left">
	       <a href="/common/searchPage"><img src="/img/mainLogo2.PNG" height="50" class="d-inline-block align-top cursor" alt=""></a>
	       <!-- <a class="navbar-brand nav-padding logo-text cursor" href="#">Blue<b>WiKi</b></a> -->
	     </div>
	
	    <ul class="nav navbar-nav navbar-left">
	    <li class="dropdown">
	        <a class="nav-align dropdown-toggle" data-toggle="dropdown" href="#">
	        <i class="fas fa-align-justify fa-lg grayscale cursor"></i>&nbsp;&nbsp;&nbsp;이용안내</a>
	        <ul class="dropdown-menu">
	          <li><a href="#">공지사항</a></li>
	          <li><a href="#">문의게시판</a></li>
	          <li><a href="#">신고게시판</a></li>
	        </ul>
	      </li>
	 			<li id="chgList"><a class="nav-align cursor"><i class="fas fa-clock fa-lg grayscale cursor"></i>&nbsp;&nbsp;&nbsp;최근변경</a></li>
	 			<li id="top15"><a class="nav-align cursor"><i class="far fa-heart fa-lg grayscale cursor"></i>&nbsp;&nbsp;&nbsp;Top15</a></li>
	    </ul>
	    
	    <ul class="nav navbar-nav navbar-right" style="padding-top:10px;">
	    	<li class="dropdown">
       			<a class="dropdown-toggle" data-toggle="dropdown"><i class="fas fa-user fa-lg grayscale"></i>&nbsp;</a>
       			<ul class="dropdown-menu">
       				<li class="dropdown-header">환영합니다 :)<br><%=(String)session.getAttribute("member_id")%></li>
				    <li class="divider"></li>
      				<li><a href="#">로그아웃</a></li>
			    </ul>
       		</li>
	    </ul>
	    
	    <!-- 검색어 입력하는 부분 -->
	    <form class="navbar-form navbar-right" id="frmSearchtxt" method="GET">
	    <fieldset>
	    	<div class="input-group stylish-input-group">
					<input class="form-control" id="search" placeholder="Search" name="title" autocomplete="off">
					<span class="input-group-addon searchbtn">
	        	<button type="button" id="btnSearch"> <i class="fas fa-search"></i></button>  
	         </span>
	      </div>
	      </fieldset>
	    </form>
	   </div>
	</nav>
	
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
	        	<button type="button" class="btn btn-default" data-dismiss="modal" id="btnAlertModalClose">Close</button>
	        	<input type="hidden" id="alertEventType" value=""/>
	        </div>
	      </div>
	    </div>
	</div>
</body>
</html>
