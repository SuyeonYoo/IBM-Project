<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>BLUEWIKI</title>
<!-- CSS -->
<link rel="stylesheet" type="text/css" href="/css/search/search_main.css">
</head>
<body>
	<!-- Set -->
	<jsp:include page="../layout/library.jsp"></jsp:include>
	
	<!-- Navbar -->
	<jsp:include page="../search/search_main_navbar.jsp"></jsp:include>
	
	<div class="container">
		<div class="row" style="text-align: center; margin-bottom: 30px; margin-top: 15%;">
			<img class="align-bottom" src="/img/login_logo.PNG" style="vertical-align: bottom; height: 100px"> 
			<span class="align-bottom" style="font-size: 70px;">BlueWiki</span>
		</div>
		
		<div style="width:50%; margin:0 auto;">
	        <div class="slinput" style="text-align: center">
	        	<i class="fa fa-search left-icon"></i> 
	            <input class="form-control form-control-lg form-control--rounded" name="s" type="search" id="" placeholder="Search">
	        </div>
	    </div>
	</div>
</body>
</html>