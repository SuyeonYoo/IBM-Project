<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
	<c:if test="${result.title} eq null" >
		검색결과가 없습니다.
	</c:if>
	<!-- 본문 -->
		<div class="col-xs-9 box">
			<div class="row">
				<!-- 제목 -->
				<div class="col-xs-6 text-left">
					<span id="bTitle" style="font-size:32pt">${result.title}</span>
				</div>
				<!-- 아이콘 -->
				<div class="col-xs-6" style="margin-top:20px;">
					<div class="btn-group pull-right">
		  			<button type="button" class="btn btn-outline-secondary"><i class="fas fa-edit"></i></button>
		  			<button type="button" class="btn btn-outline-secondary"><i class="fas fa-share"></i></button>
		  			<button type="button" class="btn btn-outline-secondary"><i class="fas fa-bookmark"></i></button>
		  			<button type="button" class="btn btn-outline-secondary"><i class="far fa-heart"></i></button>
		  			<button type="button" class="btn btn-outline-secondary"><i class="fas fa-ban"></i></button>
	  			</div>
				</div>
			</div>
			<!-- 수정자, 수정일자  --> 		
			<div class="row">
				<div class="col-xs-12 text-right ">
					<span>${result.writer}</span>
				</div>
			</div>
			<!-- 목차  --> 
			<div class="row">
				<div class="col-xs-6" style="border:1px solid #ccc;">
					<c:forEach var="index" varStatus="status" items="${indexList}" step="1" begin="0">
						<c:forEach var="space" step="1" begin="2" end="${index.dept}">
							&nbsp;
						</c:forEach>
						 ${index.numbering}&nbsp;&nbsp;${index.title}<br>
					</c:forEach>
				</div>
			</div>
			
		</div>
	<!-- 오른쪽 페이지 -->
		<div class="col-xs-3">
		</div>
	
	</div>
	
	
</body>
<script>
$( document ).ready(function() {
/* 검색 버튼 클릭 시*/
$("#btnSearch").click(function(){
	var title = $("[name=title]").val();
	var data = {"title" : title};
	
	$.ajax({
		type : 'POST',
    url : '/board/index',
    data : data,
    success:function(result){
    	
    	if(result.resultList.length > 0)
    		ArrResult.length = 0;
    	
			for (var i=0; i < result.resultList.length; i++){
				ArrResult.push(result.resultList[i].title);	
			}
			console.log(ArrResult);
			}
	});

	/* $("#frmSearchtxt").attr("action", "/main/"+title).submit(); */
	$(location).attr('href', "/board/main/"+title);

});
});	
</script> 
</html>