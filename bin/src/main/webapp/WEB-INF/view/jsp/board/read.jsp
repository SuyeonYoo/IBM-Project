<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- CSS -->
<link rel="stylesheet" type="text/css" href="/css/board/read.css">
</head>
<body>
	<!-- read post form -->
	<form id="readPostForm" action="#" method="post">
		<!-- read post Modal -->
		<div class="modal fade" id="readPostModal" role="dialog">
		  <div class="modal-dialog">
		    <!-- Modal content-->
		    <div class="modal-content">
		      <div class="modal-header">
		        <div class="text-right samll">
		        	<i class="fa fa-file-text-o"></i>
		        	<span id="readPostNumber" class="small"></span> |
		        	<i class="fa fa-user-circle-o"></i>
		        	<span id="readPostAuthor" class="small"></span> |
		        	<i class="fa fa-clock-o"></i>
		        	<span id="readPostRegDate" class="small"></span> |
		        	<i class="fa fa-check-circle-o"></i>
		        	<span id="readPostModDate" class="small"></span>
		        </div>
		        <div class="form-group">
							<label for="readPostTitle">Title:</label>
	  					<input readonly type="text" class="form-control" id="readPostTitle" name="title">
						</div>
		      </div>
		      <div class="modal-body">
						<div class="form-group">
						  <label for="readPostContents">Contents:</label>
						  <textarea readonly class="form-control" rows="10" id="readPostContents" name="contents"></textarea>
						</div> 
						<div class="form-group">
							<label>Attachment:</label>
							<div id="readAttachment"></div> 
						</div>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
		      </div>
		    </div>
		  </div>
		</div>
	</form>
</body>
</html>