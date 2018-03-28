<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>블루팁스_create</title>
</head>
<body>
	<!-- Navbar -->
	<jsp:include page="../layout/navbar.jsp"></jsp:include>
	
	<div class="container">
		<div style="font-size:30px;">
			<b>${title}</b>
			<br><br>
			<!-- 목차 만들기 -->
			<div class="col-xs-7">
				<div class="text-right" id="index">
				<span id="indexTitle" style="font-size:17px">목차를 생성해주세요&nbsp; </span>
				<button type="button" class="btn btn-default btn-xs" id="btnIndex"><i class="fas fa-list-ol grayscale"></i></button>
				<div id="indexGroup" class="btn-group" style="display:none;">
					<button type="button" class="btn btn-default btn-xs" id="btnPlus"><i class="fas fa-plus grayscale"></i></button>
					<button type="button" class="btn btn-default btn-xs" id="btnMinus"><i class="fas fa-minus grayscale"></i></button>
					<button type="button" class="btn btn-default btn-xs" id="btnLeft"><i class="fas fa-angle-double-right grayscale"></i></button>
					<button type="button" class="btn btn-default btn-xs" id="btnRight"><i class="fas fa-angle-double-left grayscale"></i></button>
				</div>
				
				<%-- <button type="button" class="btn btn-default" id="btnIndex" onclick="create('${title}');"><i class="fas fa-pencil-alt"></i></button> --%>
				<div id="indexDiv" class="col-xs-12 form-control" style="height:auto; min-height: 40px;"></div>
				</div>
			</div>
			
			<!-- 목차 만들기 -->
			<div class="col-xs-5">
			테스트
			</div>
		</div>
	</div>
</body>

<script>
var numbering = 1;
var crtInputId = "";

$( document ).ready(function() {
	/* 목차생성 버튼 클릭 시*/
	$("#btnIndex").click(function(){
		$("index").append("<i class='fas fa-angle-double-right'></i>");
		$("#indexTitle").text("");
		$("#btnIndex").hide();
		$("#indexGroup").show();

	 $("#btnPlus").click(function(){
		 $("#indexDiv").append("<div id='indexDiv"+numbering+"' class='text-left'><span>"+numbering+". </span><input type='text' class='index-input'/></div>");
		 numbering = numbering+1;
		 
			$(".index-input").focus(function() {
				crtInputId = $(this).parent("div").attr("id");
			});
			
	 });
	 
	 $("#btnMinus").click(function(){
			$("#"+crtInputId).remove();
	 });
		 
	 $("#btnLeft").click(function(){
		 $("#indexDiv"+numbering)
	 });
	 
	 $("#btnRight").click(function(){
		 alert(1);
	 });
		
	});
	
});
</script>
</html>