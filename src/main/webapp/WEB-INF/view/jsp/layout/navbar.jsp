<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>BLUEWIKI</title>
<!-- Set -->
<jsp:include page="../layout/library.jsp"></jsp:include>
</head>
<body>

<!-- navbar -->
<nav class="navbar navbar-default">

   <div class="container-fluid text-right">
     <div class="navbar-header">
       <img class="logo" src="/img/login_logo.PNG" width="30" height="30" class="d-inline-block align-top cursor" alt="">
       <a class="navbar-brand nav-padding logo-text cursor" href="#">Blue<b>WiKi</b></a>
     </div>

    <ul class="nav navbar-nav navbar-left">
    <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#">
        <i class="fas fa-align-justify  grayscale cursor"></i>&nbsp;이용안내</a>
        <ul class="dropdown-menu">
          <li><a href="#">공지사항</a></li>
          <li><a href="#">문의게시판</a></li>
          <li><a href="#">신고게시판</a></li>
        </ul>
      </li>
 			<li id="chgList"><a class="cursor"><i class="fas fa-clock grayscale cursor"></i>&nbsp;최근변경</a></li>
 			<li id="top15"><a class="cursor"><i class="far fa-heart grayscale cursor"></i>&nbsp;Top15</a></li>
    </ul>
    
    <ul class="nav navbar-nav navbar-right">
       <li><a class="cursor"><i class="fas fa-user grayscale cursor"></i>&nbsp;</a></li>
       <li><a class="cursor"><i class="fas fa-sign-out-alt grayscale cursor"></i></a></li>
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