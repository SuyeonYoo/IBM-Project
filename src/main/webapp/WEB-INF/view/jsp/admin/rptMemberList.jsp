<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>블루팁스</title>
<script src="/lib/jquery/jquery.min.js"></script>
<script type="text/javascript">

function changeSts(memId){
	
	if(!confirm("회원상태를 정상으로 복구하시겠습니까?")){
		return false;
	}else{
	
		$.ajax({
	        url : "/admin/changeSts",
	        type : 'POST',
	        data : {
	        	memberId : memId
	        },
	        success: function(data){
	        	if(data == "1"){
		        	$("#alertModal").find(".modal-body").text("회원 상태를 정상적으로 변경하였습니다.");
					$("#alertModal").modal();
					
					$("#modalClose").on("click", function(){	
						window.location.reload(true);
					}); 
	        	}
	        },
	        error:function(request,status,error){
	            console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	            $("#alertModal").find(".modal-body").text("회원 상태를 정상적으로 변경하지 못했습니다.");
				$("#alertModal").modal();
	        }
    	});
		
	}
	
}

</script>
</head>
<body style="font-family: 'nanumsquareB', sans-serif;">

<!-- Navbar -->
<jsp:include page="../layout/navbar.jsp"></jsp:include>

<div class="container">
<br>
	<p style="font-size:25px;font-weight:bold;font-color:#000099">신고회원 목록</p><br>
			<c:choose>
				<c:when test="${not empty requestScope.result }">
	<table class="table table-hover">
	    <thead>
	      <tr>
	        <th>회원ID</th>
	        <th>권한</th>
	        <th>복구</th>
	      </tr>
	    </thead>
	    <tbody>
					<c:forEach items="${requestScope.result }" var ="list">
						<tr>
							<td>${list.memberId }</td>
							<td>${list.authority }</td>
							<td><a href="#" onclick="changeSts('${list.memberId}')">정상으로 복구하기</a></td>
						</tr>
					</c:forEach>
		</tbody>
	</table>
				</c:when>
				<c:otherwise>
					신고된 회원이 없습니다.	
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
	          <button type="button" class="btn btn-default" data-dismiss="modal" id="modalClose">확인</button>
	        </div>
	      </div>
	    </div>
	</div>
	
</body>
</html>