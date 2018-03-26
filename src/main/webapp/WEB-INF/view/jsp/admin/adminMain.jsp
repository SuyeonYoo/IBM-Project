<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>BLUEWIKI</title>
<!-- CSS -->
<link rel="stylesheet" type="text/css" href="/css/common/signin.css">
<script src="/lib/jquery/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	

	
});


</script>
</head>
<body>
	<!-- Setting -->
	<jsp:include page="../layout/library.jsp"></jsp:include>

	<input type="button" value="회원신고목록" onClick="location.href='/admin/rptMember'">
	<input type="button" value="게시글신고목록" onClick="location.href='/admin/rptPost'">
	<input type="button" value="관리자관리" onClick="location.href='/admin/mngAdmin'">
	
	

</body>
</html>