<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�������_saveFinish</title>
<style type="text/css">
.noBorder {
    border: none;
}
</style>
</head>
<body>
	<!-- Navbar -->
	<jsp:include page="../layout/navbar.jsp"></jsp:include>
	<div class="container">
		<div class="alert alert-info" role="alert">
			<span style="font-size:15pt"><b style="font-size:20pt">${title}</b> �� ���� ������ �ۼ��� �Ϸ�Ǿ����ϴ�. </span>
		</div>
		<div class="text-right">
			<span style="margin-top:15px">
			<b style="font-size:12pt">�̸�����</b></span>
			<button type="button" class="btn btn-default noBorder" id="btnCreate" onclick="create('${title}');"><i class="fas fa-eye grayscale"></i></button>
			<b style="font-size:12pt">&nbsp;&nbsp;���</b></span>
			<button type="button" class="btn btn-default noBorder" id="btnCreate" onclick="create('${title}');"><i class="fas fa-users grayscale"></i></button>
		</div>
	</div>
</body>
</html>