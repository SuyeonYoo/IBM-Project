<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="/css/fileUpload.css">
<title>블루팁스_create</title>
</head>
<body style="font-family: 'nanumsquareB', sans-serif;">
	<!-- Navbar -->
	<jsp:include page="../layout/navbar.jsp"></jsp:include>
	
	<div class="container">
		<div style="font-size:30px;">
				<i class='fas fa-book'></i><b> ${title}</b>
			<br>
			<div class="col-xs-12">
				<div class='div-topBorder'></div>
			</div>
			<!-- 목차 만들기 -->
			<div class="col-xs-7">
				<span class="text-left" style="color:#565656;">INDEX</span>
				<div class="text-right" id="index" style="margin-top:0px">
				<span id="indexTitle" style="font-size:17px">목차를 생성해주세요&nbsp; </span>
				<button type="button" class="btn btn-default btn-xs" id="btnIndex"><i class="fas fa-list-ol grayscale"></i></button>
				<div id="indexGroup" class="btn-group" style="display:none;">
					<button type="button" class="btn btn-default btn-xs" id="btnPlus"><i class="fas fa-plus grayscale"></i></button>
					<button type="button" class="btn btn-default btn-xs" id="btnMinus" disabled="true"><i class="fas fa-minus grayscale"></i></button>
				</div>
				
				<%-- <button type="button" class="btn btn-default" id="btnIndex" onclick="create('${title}');"><i class="fas fa-pencil-alt"></i></button> --%>
				<div id="indexDiv" class="col-xs-12 form-control" style="height:auto; min-height: 40px;"></div>
				</div>
			</div>
			
			<!-- 소개 부분 만들기 -->
			<div class="col-xs-5">
				
				<div class="define" style="margin:0px; margin-top:15px;">
					<div class="grayscale cursor" id="defineDiv" style="margin-top:14px; text-align:center">
						<span id="defineSpan">정의를 입력해주세요</span>
						<input type="text" id="defineText" class='defineText hide'/>
					</div>
				</div>
				<div class="fileDiv">
					<input type="file" name="imageUpload" id="imageUpload" class="hide"/> 
					<label for="imageUpload" id="labelFile" class="btn-file cursor"><i id="imgPlus" class="fas fa-plus"></i>
						<img src="" id="imagePreview" alt="" width="200px"/>
					</label>
					
				</div>
			</div>
				
			<!-- 본문 부분 만들기 -->
			<div class="col-xs-12">
				<div class="row content-div" style="margin-bottom:20px"> 본문 </div>
				<div id="contentDiv">
				</div>
			</div>
		</div>
	</div>
	
	<br/>
	
	<div style="position: fixed; align-items: center; bottom: 10px; right: 10px;">
		<button class="btn btn-info" style="width: 80px;" id="btnSignup">등록</button>
		<button class="btn" style="width: 80px;" id="btnCancel" onclick="moveSearchMain();">취소</button>
	</div>
</body>

<script>

var numbering = 1;
var crtInputId = "";
var oEditors = [];

$( document ).ready(function() {
	
	/* 정의 클릭 시*/
	$("#defineDiv").click(function(){
		$("#defineSpan").hide();
		$("#defineText").removeClass("hide");
		$("#defineText").focus();
	});
	
	/* 정의 클릭 시*/
	$("#defineText").focusout(function(){
		if($("#defineText").val() == ""){
			$("#defineSpan").show();
			$("#defineText").addClass("hide");
		}
	});
	
	$('#imageUpload').change(function(){	
		$("#imgPlus").hide();
		readImgUrlAndPreview(this);
		function readImgUrlAndPreview(input){
			 if (input.files && input.files[0]) {
		            var reader = new FileReader();
		            reader.onload = function (e) {			            	
		                $('#imagePreview').attr('src', e.target.result);
		                $('#imagePreview').attr('width', "100%");
		                $('#labelFile').removeClass('btn-file');
		                $('#labelFile').addClass('btn-fileAfter');
						}
		          };
		          reader.readAsDataURL(input.files[0]);
		     }	
	});

	/* 목차생성 버튼 클릭 시*/
	$("#btnIndex").click(function(){
		$("index").append("<i class='fas fa-angle-double-right'></i>");
		$("#indexTitle").text("");
		$("#btnIndex").hide();
		$("#indexGroup").show();

	 $("#btnPlus").click(function(){
		 $("#indexDiv").append("<div id='indexDiv"+numbering+"' class='text-left'><span id='indexSpan"+numbering+"'>"+numbering+
				 ". </span><input type='text' id='indexText"+numbering+"' class='index-input'/></div>");
		 $.when($('#contentDiv').append("<div id='contentIndex"+numbering+"' class='row'><span id='indexContentSpan"+numbering+"'>"+numbering+
				 ". </span><input type='text' id='indexContentText"+numbering+"' class='index-input margin-bottom' readonly/>"+
				 "<textarea id='contentTxtarea"+numbering+"' class='form-control main-content'></textarea></div>")).then(function(){
					 nhn.husky.EZCreator.createInIFrame({
					     oAppRef: oEditors,
					     elPlaceHolder: "contentTxtarea"+(numbering-1),
					     sSkinURI: "/lib/smarteditor2/demo/SmartEditor2Skin.html",
					     fCreator: "createSEditor2"
					 });
			});

		 //autosize($("#contentTxtarea"+numbering));
		 numbering = numbering+1;
		 
		
		 
			$(".index-input").focus(function() {
				crtInputId = $(this).parent("div").attr("id");
				$("#btnMinus").attr("disabled",false);
			});
			
			$("#indexText"+(numbering-1)).focus();
			/* $(".index-input").focusout(function() {
					$("#btnMinus").attr("disabled",true);
				}); */
				
			 $(".index-input").keyup(function() {
				 	var curNumbering = crtInputId.substring(8);
				 	var indexTitle = $("#indexText"+curNumbering).val();
				 	console.log("순서 : "+curNumbering+"목차 제목 : " + indexTitle);
					$('#indexContentText'+curNumbering).val(indexTitle);
				});
				
	 });
	 
	
	 $("#btnMinus").click(function(){
		 var curNumbering = crtInputId.substring(8);
		 
			$("#"+crtInputId).remove();
			$("#contentIndex"+curNumbering).remove();
			
			if(numbering != 1)
				$("#indexText"+(curNumbering-1)).focus();				
			else
				$("#btnMinus").attr("disabled",true);
			
			if(curNumbering == (numbering-1)){
				numbering = numbering-1;
			}
			else{
				for(var i = 1; i <= numbering; i++){
					if(i > curNumbering){
						$("#indexDiv"+i).attr("id","indexDiv"+(i-1));
						$("#indexSpan"+i).attr("id","indexSpan"+(i-1));
						$("#indexText"+i).attr("id","indexText"+(i-1));
						
						$("#contentIndex"+i).attr("id","contentIndex"+(i-1));
						$("#indexContentSpan"+i).attr("id","indexContentSpan"+(i-1));
						$("#indexContentText"+i).attr("id","indexContentText"+(i-1));
						
						$("#indexSpan"+(i-1)).text((i-1)+". ");
						$("#indexContentSpan"+(i-1)).text((i-1)+". ");
					}
				}
				numbering = numbering - 1;
			}
	 });
		 
	 $("#btnLeft").click(function(){
		 $("#indexDiv"+numbering)
	 });
	 
	 $("#btnRight").click(function(){
		 alert(1);
	 });
	 
		
	});	
});

function moveSearchMain() {
	location.href="/common/searchPage";
}
</script>
</html>