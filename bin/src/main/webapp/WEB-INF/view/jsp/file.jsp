<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../jsp/layout/navbar.jsp"></jsp:include>

<!-- Upload file form -->
<form id="upload-file-form">
  <label for="upload-file-input">Upload your file:</label>
  <input id="upload-file-input" type="file" name="file" accept="*" />
</form>
</body>
<script>

//bind the on-change event
$(document).ready(function() {
  $("#upload-file-input").on("change", uploadFile);
});

/**
 * Upload the file sending it via Ajax at the Spring Boot server.
 */
function uploadFile() {
  $.ajax({
    url: "/attachments/upload",
    type: "POST",
    data: new FormData($("#upload-file-form")[0]),
    enctype: 'multipart/form-data',
    processData: false,
    contentType: false,
    cache: false,
    success: function () {
      // Handle upload success
      // ...
    },
    error: function () {
      // Handle upload error
      // ...
    }
  });
} // function uploadFile
</script>
</html>