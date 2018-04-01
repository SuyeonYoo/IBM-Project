<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>블루팁스_noResult</title>
</head>
<body>
	<!-- Navbar -->
	<jsp:include page="../layout/navbar.jsp"></jsp:include>
	<jsp:include page="../common/sidebar.jsp"></jsp:include>
	<div class="container">
		<div class="alert alert-info" role="alert">
			<span style="font-size:15pt"><b style="font-size:20pt"> ${title} </b> 에 해당하는 검색결과가 없습니다. </span>
		</div>
		<div class="text-right">
			<span style="margin-top:15px">
			<b style="font-size:15pt">${title}</b> 에 대한 새 문서 만들기&nbsp;</span>
			<button type="button" class="btn btn-default" id="btnCreate" onclick="create('${title}');"><i class="fas fa-pencil-alt"></i></button>
		</div>
	</div>
	
	<div class="btn-chat">
		<button type="button" class="btn btn-primary btn-circle btn-xl" onclick="openNav()">ㅊ</button>
	</div>	
</body>

<script>
$( document ).ready(function() {
	
	$(".closebtn").hide();
	
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

/* 글쓰기 버튼 클릭 시*/
function create(title){
	location.href="/board/create/"+title;
}

function openNav() {
    document.getElementById("mySidenav").style.width = "350px";
    $(".closebtn").show();
    $("#search").hide();
}

function closeNav() {
    document.getElementById("mySidenav").style.width = "0";
    $(".closebtn").hide();
    $("#search").show();
}

</script>

</html>