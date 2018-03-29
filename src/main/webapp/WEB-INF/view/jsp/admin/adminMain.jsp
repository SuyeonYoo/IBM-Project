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
<body>

<!-- Navbar -->
<jsp:include page="../layout/navbar.jsp"></jsp:include>

<div class="container">
	<input type="button" value="회원신고목록" onClick="location.href='/admin/rptMember'">
	<input type="button" value="게시글신고목록" onClick="location.href='/admin/rptPost'">
	<input type="button" value="관리자관리" onClick="location.href='/admin/mngAdmin'">
</div>
	

</body>
</html>