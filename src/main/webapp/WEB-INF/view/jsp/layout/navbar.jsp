<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- Set -->
	<jsp:include page="../layout/libarary.jsp"></jsp:include>
	
	<!-- navbar -->
   <nav class="navbar navbar-default custom-nav">
      <div class="container-fluid text-right">
        <div class="navbar-header">
          <img class="logo" src="/img/login_logo.png" width="30" height="30" class="d-inline-block align-top cursor" alt="">
          <a class="navbar-brand nav-padding logo-text cursor" href="#">Blue<b>WiKi</b></a>
        </div>
        <ul class="nav navbar-nav">
          <li id="id1" class="active cursor"><a>menu1</a></li>
          <li id="id2" class="cursor"><a>menu2</a></li>
        </ul>
        <ul class="nav navbar-nav navbar-right">
          <li><a class="cursor"><i class="fas fa-user grayscale cursor"></i>&nbsp;</a></li>
        </ul>
         
         <form class="navbar-form navbar-right" action="#">
           <div class="input-group stylish-input-group">
               <input type="text" class="form-control"  placeholder="Search" >
               <span class="input-group-addon">
                <button type="submit">
                 <i class="fas fa-search grayscale"></i>
                </button>  
               </span>
         </div>
       </form>
       
      </div>
   </nav>
	


<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<!-- Bootstarp & Jquery -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<!-- FontAwesome -->
    <script src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>
	<!-- Bootbox -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootbox.js/4.4.0/bootbox.min.js"></script>  
</head>
<body>
<!-- navbar -->
	<nav class="navbar navbar-default">
		<div class="container-fluid">
	  	<div class="navbar-header">
	    	<a class="navbar-brand" href="#">WebSiteName</a>
	  	</div>
	  	<ul class="nav navbar-nav">
	  	<li class="active"><a href="#">Home</a></li>
	  		<li><a href="#">Page 1</a></li>
				<li><a href="#">Page 2</a></li>
				<li><a href="#">Page 3</a></li>
			</ul>
		</div>
	</nav>
</body>
</html>