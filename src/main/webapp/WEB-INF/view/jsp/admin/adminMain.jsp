<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>블루팁스</title>
<script src="/lib/jquery/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	

	
});


</script>
</head>
<body style="font-family: 'nanumsquareB', sans-serif;">

<!-- Navbar -->
<jsp:include page="../layout/navbar.jsp"></jsp:include>

<div class="container" align="center"><br><br><br><br><br><br>
	<input type="button" class="btn btn-outline-secondary" style="width:240px;height:270px;font-size:20px;font-weight: bold;font-color:#000066" value="신고회원 목록" onClick="location.href='/admin/rptMember'">
	<input type="button" class="btn btn-outline-secondary" style="width:240px;height:270px;font-size:20px;font-weight: bold;font-color:#000066" value="신고게시글 목록" onClick="location.href='/admin/rptPost'">
	<!-- <input type="button" value="관리자관리" onClick="location.href='/admin/mngAdmin'"> -->
</div>

</body>
</html>