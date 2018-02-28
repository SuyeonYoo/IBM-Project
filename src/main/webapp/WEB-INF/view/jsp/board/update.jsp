<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- CSS -->
<link rel="stylesheet" type="text/css" href="/css/board/update.css">
</head>
<body>
	<!-- update post form -->
	<form id="updatePostForm" action="#" method="post">
		<!-- update post Modal -->
		<div class="modal fade" id="updatePostModal" role="dialog">
		  <div class="modal-dialog">
		    <!-- Modal content-->
		    <!-- Modal content-->
		    <div class="modal-content">
		      <div class="modal-header">
		        <div class="text-right samll">
		        	<i class="fa fa-file-text-o"></i>
		        	<span id="updatePostNumber" class="small"></span> |
		        	<i class="fa fa-user-circle-o"></i>
		        	<span id="updatePostAuthor" class="small"></span> |
		        	<i class="fa fa-clock-o"></i>
		        	<span id="updatePostRegDate" class="small"></span> |
		        	<i class="fa fa-check-circle-o"></i>
		        	<span id="updatePostModDate" class="small"></span>
		        </div>
		        <div class="form-group">
							<label for="updatePostTitle">Title:</label>
	  					<input readonly type="text" class="form-control" id="updatePostTitle" name="title">
						</div>
		      </div>
		      <div class="modal-body">
						<div class="form-group">
						  <label for="updatePostContents">Contents:</label>
						  <textarea readonly class="form-control" rows="10" id="updatePostContents" name="contents"></textarea>
						</div> 
		      </div>
		      <div class="modal-footer">
		      	<button type="button" class="btn btn-success" onclick="updatePost()">submit</button>
		        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
		      </div>
		    </div>
		  </div>
		</div>
	</form>
</body>
</html>