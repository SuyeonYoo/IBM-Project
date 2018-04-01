<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>블루팁스</title>
<script>
	$( document ).ready(function() {
	
		$("#btn_ban").on("click", function(){
			
			$("#newPostModal").modal();
		});

		$("#modalBtnSubmit").on("click", function(){
		
			$.ajax({
		        url : "/board/ban",
		        type : 'POST',
		        data : {
		        	no : $("#no").val(),
		        	reason : $("#reason :selected").val(),
		        	id : $("#id").val()
		        },
		        success: function(data){
		        	if(data == "1"){
			        	$("#alertModal").find(".modal-body").text("해당 게시글을 관리자에게 신고하였습니다.");
						$("#alertModal").modal();
						
						$("#modalClose").on("click", function(){						
							location.reload();
						});
		        	}
		        },
		        error:function(request,status,error){
		            console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		            $("#alertModal").find(".modal-body").text("해당 게시글을 신고하는데 오류가 발생했습니다.");
					$("#alertModal").modal();
		        }
			});	
		});
	});	
</script> 
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
		  			<!-- <button type="button" class="btn btn-outline-secondary"><i class="fas fa-share"></i></button>
		  			<button type="button" class="btn btn-outline-secondary"><i class="fas fa-bookmark"></i></button>
		  			<button type="button" class="btn btn-outline-secondary"><i class="far fa-heart"></i></button> -->
		  			<button type="button" class="btn btn-outline-secondary" id="btn_ban"><i class="fas fa-ban"></i></button>
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
						 ${index.numbering}&nbsp;&nbsp;${index.title}<br>
					</c:forEach>
				</div>
			</div>
			
			<!-- 컨텐츠 --> 
			<div>
			</div>
			
		</div>
		
		<!-- 오른쪽 페이지 -->
		<div class="col-xs-3">
		</div>
	</div>
	
	<input type="hidden" name="no" value="${result.no}">
	<input type="hidden" name="id" value="<%=(String)session.getAttribute("member_id")%>">
	
	<!-- new post Modal -->
	<div class="modal fade" id="newPostModal" role="dialog">
	  <div class="modal-dialog">
	    <!-- Modal content-->
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	        <div class="form-group">
				<label for="newPostTitle">게시글 신고하기</label>
			</div>
	      </div>
	      <div class="modal-body">
					<div class="form-group">
					  <label for="newPostContents">신고 사유&nbsp;&nbsp;</label>
					  <select id="reason" name="reason">
					  	<option style="display:none">신고 사유를 선택해주세요.</option>
					  	<option value="1">신고사유1</option>
					  	<option value="2">신고사유2</option>
					  	<option value="3">신고사유3</option>						  
					  </select>
					</div>
	      </div>
	      <div class="modal-footer">
	      	<button type="submit" class="btn btn-success" id="modalBtnSubmit">확인</button>
	        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
	      </div>
	    </div>
	  </div>
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