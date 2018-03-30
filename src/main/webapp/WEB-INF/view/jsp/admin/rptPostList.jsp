<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>블루팁스</title>
<script src="/lib/jquery/jquery.min.js"></script>
<script type="text/javascript">

function changeSts(brdNo){
	
	if(!confirm("게시글 상태를 정상으로 복구하시겠습니까?")){
		return false;
	}else{
	
		$.ajax({
	        url : "/board/changeSts",
	        type : 'POST',
	        data : {
	        	brdNo : brdNo
	        },
	        success: function(data){
	        	if(data == "1"){
		        	$("#alertModal").find(".modal-body").text("게시글  상태를 정상적으로 변경하였습니다.");
					$("#alertModal").modal();
					
					$("#modalClose").on("click", function(){						
						location.reload();
					});
	        	}
	        },
	        error:function(request,status,error){
	            console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	            $("#alertModal").find(".modal-body").text("게시글 상태를 정상적으로 변경하지 못했습니다.");
				$("#alertModal").modal();
	        }
    	});
		
	}
	
}


</script>
</head>
<body>

<!-- Navbar -->
<jsp:include page="../layout/navbar.jsp"></jsp:include>

	
<div class="container">

	<h1>신고게시물목록</h1><br>
	<c:choose>
		<c:when test="${not empty requestScope.result }">
			<c:forEach items="${requestScope.result }" var ="list">
				<div style="border-style: ridge; width:260px; height:150px;">
				게시글 제목 : 
				<a href="#" onclick="/board/retrieveBrdDetail?brdNo=${list.brdNo}">${list.title }</a>
				<br/>
				요청자 : ${list.reqMemId }
				<br>
				신고내용 : ${list.inqContent }
				<br>
				신고시각 : ${list.inqDate }&nbsp;&nbsp;${list.inqTime }
				<br>
			<%-- 	상태 : 
				<c:if test="${list.inqSts eq 1}">
					완료
				</c:if>
				<c:if test="${list.inqSts eq 2}">
					대기
				</c:if> --%>
				<br>
				게시글no : ${list.brdNo }
				<br/>
				<a href="#" onclick="changeSts('${list.brdNo }')">정상으로 복구하기</a>
				<br>
			</div>
			<br>
			</c:forEach>
		</c:when>
		<c:otherwise>
			신고된 게시글이 없습니다.	
		</c:otherwise>
	</c:choose>
	
</div>

	<!-- Modal -->
	<div class="modal fade" id="alertModal" role="dialog">
	    <div class="modal-dialog modal-sm">
	      <div class="modal-content">
	        <div class="modal-header">
	          <button type="button" class="close" data-dismiss="modal">&times;</button>
	          <h4 class="modal-title">블루팁스</h4>
	        </div>
	        <div class="modal-body">
	          <p name="modalCnts">This is a small modal.</p>
	        </div>
	        <div class="modal-footer">
	          <button type="button" class="btn btn-default" data-dismiss="modal" id="modalClose">Close</button>
	        </div>
	      </div>
	    </div>
	</div>	

</body>
</html>