<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>BLUEWIKI</title>
<jsp:include page="../layout/library2.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="/css/common/first.css">
<script type="text/javascript">

	// 로그인 페이지로 이동 
	function loadLogin() {
		location.href = "/common/signin";	
	}
</script>
</head>
<body>
<!-- Header -->
<header id="header">
	<div class="intro">
			<div class="intro-text">
		    	<h1>블루팁스</h1>
		    	<hr>
		    	<p>블루팁스 한줄 소개</p>
		    	<a class="btn btn-default btn-lg" onclick="loadLogin()">시작하기</a>
			</div>
	</div>
</header>
</body>
</html>