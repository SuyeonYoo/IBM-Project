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
	
	<div class="row" style="text-align: center">
		<img class="align-bottom" src="/img/login_logo.PNG" style="vertical-align: bottom; height: 100px"> 
		<span class="align-bottom" style="font-size: 70px;">BlueWiki</span>
	</div>
			
	<div style="margin-top: 30px; text-align: center">
	    <input  placeholder="Search here" /> 
	    <i class="fa fa-search right-icon"></i> 
	</div>
	
	
</body>
</html>