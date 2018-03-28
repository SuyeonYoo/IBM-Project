<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>블루팁스</title>
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
		    	<div class="row" style="text-align: center; margin-bottom: 30px; margin-top: 15%;">
					<img class="align-bottom logoImg" src="/img/mainLogo.PNG"> 
				</div>
		    	<hr>
		    	<p>즐거운 지식공유 플랫폼</p>
		    	<a class="btn btn-default btn-lg" onclick="loadLogin()">시작하기</a>
			</div>
	</div>
</header>
</body>
</html>