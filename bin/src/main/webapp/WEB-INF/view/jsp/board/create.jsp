<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- new post form -->
	<form id="newPostForm" action="/board/create" method="post" enctype="multipart/form-data">
		<!-- new post Modal -->
		<div class="modal fade" id="newPostModal" role="dialog">
		  <div class="modal-dialog">
		    <!-- Modal content-->
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal">&times;</button>
		        <div class="form-group">
							<label for="newPostTitle">Title:</label>
	  					<input type="text" class="form-control" id="newPostTitle" name="title">
						</div>
		      </div>
		      <div class="modal-body">
						<div class="form-group">
						  <label for="newPostContents">Contents:</label>
						  <textarea class="form-control" rows="10" id="newPostContents" name="contents"></textarea>
						</div>
							<jsp:include page="../layout/fileUploadForm.jsp"></jsp:include>
		      </div>
		      <div class="modal-footer">
		      	<button type="submit" class="btn btn-success">submit</button>
		        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
		      </div>
		    </div>
		  </div>
		</div>
	</form>
</body>
</html>