<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>블루팁스</title>
<link rel="stylesheet" type="text/css" href="/css/common/chatSidebar.css">
<script type="text/javascript">
	
	$(document).ready(function() {
		
		getFirstOutput();
	});
	
	//콜백설정
	var callback = {	
		getAnswerSuccess : function(data) {
			
			var appendHTML = "";
			appendHTML += "<div class='answer'>";
			appendHTML += data.answer;
			appendHTML += "</div>";
			
			$("#chatMain").append(appendHTML);	
		}
	}
	
	// 챗봇 첫번째 output 얻어오기 
	function getFirstOutput() {
		
		console.log("get first");
		
		$.ajax({
	        url : "/chatbot/getFirstOutput",
	        type : 'POST',
	        dataType: 'json',
	        data : {
	        	isFirst : "true",
	        },
	        success: function(data){
	        	callback.getAnswerSuccess(data);
	        }
    	});
	}
	
	// 질문 보여주기
	function showInput() {
		
		var question = $("#textInput").val();
		$("#textInput").val("");
		
		var appendHTML = "";
		appendHTML += "<div class='questionTop'>"
		appendHTML += "	<div class='question'>";
		appendHTML += "		<p>" + question + "</p>";
		appendHTML += "	</div>";
		appendHTML += "</div>";
		
		$("#chatMain").append(appendHTML);	
		
		getNext(question);
	}

	// 질문하고, 답변하기
	function getNext(question) {
		
		$.ajax({
	        url : "/chatbot/getNext",
	        type : 'POST',
	        data : {
	        	question : question
	        },
	        success: function(data){
	        	callback.getAnswerSuccess(data);
	        }
    	});
	}
	
</script>
</head>
<body>
	<div id="mySidenav" class="sidenav">
		<div>
			<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
			<div class="chat-title">대화하기</div>
		</div>
		<div class="chatMain" id="chatMain">
		</div>
		<label for="textInput" class="inputOutline">
        	<input id="textInput" class="" placeholder=" 궁금한게 뭐예요?" type="text" onkeypress="if(event.keyCode==13){showInput();}" style="width:100%">
        </label>
	</div>
</body>
</html>