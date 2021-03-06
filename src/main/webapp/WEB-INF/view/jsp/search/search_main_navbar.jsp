<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>블루팁스</title>
<jsp:include page="../layout/library2.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="/css/search/search_main.css">
<script type="text/javascript">
	var member_id = "<%=(String)session.getAttribute("member_id")%>";
</script>
</head>
<body>
<!-- navbar -->
<nav class="navbar bg-white">
	<div class="container-fluid text-right">
		<ul class="nav navbar-nav navbar-right">
     		<li class="dropdown">
       			<a class="dropdown-toggle" data-toggle="dropdown"><i class="fas fa-user grayscale"></i>&nbsp;</a>
       			<ul class="dropdown-menu">
       				<li class="dropdown-header">환영합니다 :)<br><%=(String)session.getAttribute("member_id")%></li>
				    <li class="divider"></li>
      				<li><a href="#">로그아웃</a></li>
			    </ul>
       		</li>
     	</ul>
   	</div>
</nav>

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
        	<button type="button" class="btn btn-default" data-dismiss="modal" id="btnAlertModalClose">Close</button>
        	<input type="hidden" id="alertEventType" value=""/>
        </div>
      </div>
    </div>
</div>
</body>
</html>