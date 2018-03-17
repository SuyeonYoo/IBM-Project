<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>BLUEWIKI</title>
</head>
<body>
	<!-- Navbar -->
	<jsp:include page="../layout/navbar.jsp"></jsp:include>
	
	<div class="container">
	<!-- 본문 -->
		<div class="col-xs-9 box">
			<span id="bTitle" style="font-size:32pt">${result.title}</span>
			
			<div class="btn-group navbar-right" style="margin-top:15px; margin-right:10px;">
  			<button type="button" class="btn btn-outline-secondary"><i class="fas fa-edit"></i></button>
  			<button type="button" class="btn btn-outline-secondary"><i class="fas fa-share"></i></button>
  			<button type="button" class="btn btn-outline-secondary"><i class="fas fa-bookmark"></i></button>
  			<button type="button" class="btn btn-outline-secondary"><i class="far fa-heart"></i></button>
  			<button type="button" class="btn btn-outline-secondary"><i class="fas fa-ban"></i></button>
			</div>
			
		</div>
	<!-- 오른쪽 페이지 -->
		<div class="col-xs-3">
		</div>
	
	</div>
	
	
</body>
<script>
/* 검색 버튼 클릭 시*/
$("#btnSearch").click(function(){
	var title = $("[name=title]").val();
	var data = {"title" : title};
	
	/* $("#frmSearchtxt").attr("action", "/main/"+title).submit(); */
	$(location).attr('href', "/board/main/"+title);

});
</script> 
</html>