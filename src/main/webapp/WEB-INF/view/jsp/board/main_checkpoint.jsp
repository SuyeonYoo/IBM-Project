<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>블루팁스</title>

</head>
<body style="font-family: 'nanumsquareB', sans-serif;">
	<!-- Navbar -->
	<jsp:include page="../layout/navbar.jsp"></jsp:include>
	<jsp:include page="../common/sidebar.jsp"></jsp:include>
	
	<div class="container">
	<c:if test="${result.title} eq null" >
		검색결과가 없습니다.
	</c:if>
	<!-- 본문 -->
		<div class="col-xs-10 box">
			<div class="row">
				<!-- 제목 -->
				<div class="col-xs-6 text-left">
					<span id="bTitle" style="font-size:32pt">체크포인트</span>
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
					<span>dbyun@kr.ibm.com</span>
				</div>
			</div>
			
			<!-- 목차  --> 
			<div class="row">
				<div class="col-xs-6" style="border:1px solid #ccc;">
					<p style="padding-top: 10px;">1. 체크포인트가 뭐예요?</p>
					<p style="padding-top: 10px;">2. 체크포인트 작성은 어떤 언어로 해야하나요?</p>
					<p style="padding-top: 10px;">3. 체크포인트 예시문장이 있나요?</p>
					<p style="padding-top: 10px;">4. 2018 체크포인트 안내메일</p>
				</div>
			</div>
			
			<!-- 컨텐츠 --> 
			<div class="row" id="realCnts" style="padding-top: 10px; padding-bottom: 10px;">
				<div class="col-xs-12" style="padding-top: 20px;">
					<h3 style="border-bottom: 1px solid #ccc;">1. 체크포인트가 뭐예요?</h3>
					<p><blockquote><mark style="font-size: 14pt;">Checkpoint 계절이 돌아왔네요.</mark><br/>
						이미 한 번 해보신 분들도 있을텐데요, 처음 해보시는 분들도 당황하지 마시고 아래 가이드에 따라 차근차근 해보시기 바랍니다.<br/><br/>
						<footer>GBS 김덕중 실장님</footer>
						</blockquote>
						<mark style="font-size: 14pt;">Checkpoint란?</mark><br/>
						IBMer가 매년 입력해야 하는 프로젝트, 비즈니스, 개인 목표로 승진이나 연봉인상에 Utilization과 함께 고려되는 중요한 기준이에요.
					</p>
				</div>
				
				<div class="col-xs-12" style="padding-top: 10px; padding-bottom: 10px;">
					<h3 style="border-bottom: 1px solid #ccc;">2. 체크포인트 작성은 어떤 언어로 해야하나요?</h3>
					<p><mark style="font-size: 14pt;">영어</mark>로 작성하셔야 되요<br/><br/></p>
					<img src="/img/englishOnly.jpg"></img>
				</div>
				
				<div class="col-xs-12" style="padding-top: 10px; padding-bottom: 10px;">
					<h3 style="border-bottom: 1px solid #ccc;">3. 체크포인트 예시문장이 있나요?</h3>
					<p class="bg-info" style="text-align:center; font-size: 12pt;">개발자</p>
					<ul>
						<li>Progress my capability from ‘entry’ to ‘foundation’ level in JAVA Application Development skills by 6/1/18</li>
						<li>Provide technical expertise to my project team in support of the Werner Distribution system go-live on 12/31/18</li>
						<li>Try to study Watson Conversation API</li>
					</ul>
					<p class="bg-success" style="text-align:center; font-size: 12pt;">컨설턴트</p>
					<ul>
						<li>Advance from ‘entry’ to ‘foundation’ level in Banking industry skills by 6/1/18</li>
						<li>Deliver the fraud analytics value proposition solution for Maybank by 31 Mar 2018</li>
						<li>Engage global CoCs expertise to invite industry thought leaders in presenting IBM’s POV in future of commerce in Retail Industry</li>
						<li>Achieve 94% annual chargeable utilization for 2018</li>
					</ul>
				</div>
				
				<div class="col-xs-12" style="padding-top: 10px; padding-bottom: 10px;">
					<h3 style="border-bottom: 1px solid #ccc;">4. 2018 체크포인트 안내메일</h3>
					<p>IBM Checkpoint | 2018년 목표를 3/31일까지 입력하십시요.</p>
					<p>Checkpoint는 IBM의 성과관리 체계에서 조직과 팀의 우선순위 및 목표에 기반하는 개인화된 목표를 Checkpoint Tracker를 통해 설정한 후, 목표의 진척 상황을 지속적/정기적으로 업데이트 할 수 있고, 관리자들은 직원들이 목표를 달성할 수 있도록 지속적인 피드백과 코칭을 해야 합니다.</p>
					<br/>
					<mark style="font-size: 14pt;">목표설정의 기본원칙</mark>
					<ul>
						<li>여러분의 목표는 조직/팀의 우선순위에 기반하지만 궁극적으로는 자신의 업무와 연관된 개인화된 목표여야 하며, 반복 가능하며 지속 가능한 목표여야 합니다.</li>
						<li>각각의 목표는 구체적이고 측정 가능해야 하며 자신의 업무/스킬 입장에서 성취 가능한 수준이면서 한정된 기간 내 완료할 수 있어야 합니다.</li>
					</ul><br/>
					<p>좀 더 자세한 안내가 필요하세요? 관련 링크로 이동합니다 ! </p>
					<ul>
						<li><a href="https://apps.na.collabserv.com/wikis/home?lang=en-us#!/wiki/W90186f2fd1ef_44f7_b772_29ad854480e0/page/Business%20Unit%20Guidance">Business Unit별 목표 설정 가이드</a></li>
						<li><a href="http://learn.atlanta.ibm.com/la/topics/goal-management/">Leadership Academy - Goal Management 안내</a></li>
					</ul>
				</div>
			</div>
			
		</div>
		
		<!-- 오른쪽 페이지 -->
		<div class="col-xs-2">
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
	        <div class="form-group" style="font-size:15pt;">
				<label for="newPostTitle">게시글 신고</label>
			</div>
	      </div>
	      <div class="modal-body">
			<div class="form-group" class="input-group mb-3">
				<!-- 	  <label for="newPostContents">신고 사유&nbsp;&nbsp;</label> -->
				<select id="reason" name="reason" class="form-control">
					<option style="display:none">신고 사유를 선택해주세요.</option>
					<option value="1">부적절한 콘텐츠를 포함하고 있어요.</option>
					<option value="2">사실과 다른 콘텐츠를 포함하고 있어요.</option>
					<option value="3">블루팁스와 어울리지 않는 주제의 콘텐츠예요.</option>						  
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
	
	<div class="btn-chat">
		<button type="button" class="btn btn-primary btn-circle btn-xl" onclick="openNav()">ㅊ</button>
	</div>	
</body>
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