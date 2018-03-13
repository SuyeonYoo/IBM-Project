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
	
	<div class="col-xs-6 col-xs-offset-3" style="text-align: center; margin-top:100px; margin-bottom:20px;">
		<img class="align-bottom" src="/img/login_logo.PNG" style="vertical-align: bottom; height: 75px"> 
		<span class="align-bottom" style="font-size: 50px; margin-left:5px">BlueWiki</span>
	</div>
	
	<form class="col-xs-6 col-xs-offset-3" action="#">
    	<div class="input-group stylish-input-group">
      	<input type="text" class="form-control"  placeholder="Search" >
        	<span class="input-group-addon">
          	<button type="submit">
            <i class="fas fa-search grayscale"></i>
            </button>  
           </span>
      </div>
    </form>
	
</body>
</html>