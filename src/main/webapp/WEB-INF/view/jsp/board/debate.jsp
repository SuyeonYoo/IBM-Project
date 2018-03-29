<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="/css/debate.css">
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
					<div class="col-xs-6 text-left">
						<span id="bTitle" style="font-size:32pt">토론 : IBM</span>
					</div>
		
		
			<div class="col-sm-6 col-sm-offset-3 frame">
	            <ul class="ul-debate" id="chatBox"></ul>
	            <div>
	                <div class="msj-rta macro" style="margin:auto">                        
	                    <div class="text text-r" style="background:whitesmoke !important">
	                        <input class="mytext" placeholder="Type a message"/>
	                    </div> 
	                </div>
	            </div>
	        </div>        
	    </div>
    </div>

		
		
		
	
	
</body>
<script>
var me = {};

var you = {};

function formatAMPM(date) {
    var hours = date.getHours();
    var minutes = date.getMinutes();
    var ampm = hours >= 12 ? 'PM' : 'AM';
    hours = hours % 12;
    hours = hours ? hours : 12; // the hour '0' should be '12'
    minutes = minutes < 10 ? '0'+minutes : minutes;
    var strTime = hours + ':' + minutes + ' ' + ampm;
    return strTime;
}            

//-- No use time. It is a javaScript effect.
function insertChat(who, text, time){
    var control = "";
    var date = formatAMPM(new Date());
    
    if (who == "me"){
        
        control = '<li style="width:100%">' +
                        '<div class="msj macro">' +
                            '<div class="text text-l">' +
                                '<p>'+ text +'</p>' +
                                '<p><small>'+date+'</small></p>' +
                            '</div>' +
                        '</div>' +
                    '</li>';                    
    }else{
        control = '<li style="width:100%;">' +
                        '<div class="msj-rta macro">' +
                            '<div class="text text-r">' +
                                '<p>'+text+'</p>' +
                                '<p><small>'+date+'</small></p>' +
                            '</div>' +
                        '<div class="avatar" style="padding:0px 0px 0px 10px !important"></div>' +                                
                  '</li>';
    }
    setTimeout(
        function(){                        
            $("#chatBox").append(control);

        }, time);
    

}
function resetChat(){
    $("ul").empty();
}

$(".mytext").on("keyup", function(e){
    if (e.which == 13){
        var text = $(this).val();
        if (text !== ""){
            insertChat("me", text);              
            $(this).val('');
        }
    }
});


insertChat("me", "IBM과 애플이 협력하던 시절에 IBM은 I Bought Macintosh(나 맥 샀어!)의 약자라고 농담삼아 말했대", 0);  
insertChat("you", "재밌네요ㅋㅋㅋ", 1500);
insertChat("me", "실제로 IBM은 PowerPC를 맥에 납품했대", 3500);
insertChat("you", "오 정말ㅋㅋㅋ?",7000);
insertChat("me", "애플은 IBM에 업무용 파워맥을 꽤 팔았다고 해요", 9500);
insertChat("you", "그렇구나ㅋㅋㅋ", 12000);
insertChat("me", "EPH잘하고있어요??", 13500);
insertChat("you", "네 그렇습니다", 16000);
insertChat("me", "오 기대해볼게요 ", 17500);
insertChat("you", "네 알겠습니다", 19000);



</script> 
</html>