<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>BLUEWIKI</title>
</head>
<body>
	<!-- Set -->
<jsp:include page="../layout/library.jsp"></jsp:include>

<!-- navbar -->
<nav class="navbar navbar-default">
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
<!-- test -->