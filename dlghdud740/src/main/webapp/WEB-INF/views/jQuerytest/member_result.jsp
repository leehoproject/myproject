<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="resources/bootstrap-3.3.7-dist/css/itschool.css">
<link rel="stylesheet" href="resources/bootstrap-3.3.7-dist/css/bootstrap.css">
<link rel="stylesheet" href="resources/bootstrap-3.3.7-dist/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="resources/bootstrap-3.3.7-dist/css/font-awesome.min.css">
<script src="resources/js/jquery-3.1.1.min.js"></script>
<script src="resources/js/parsley.min.js"></script>
<script src="resources/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>
<form action="index" method="GET">
<div class="container">
	<div class="col-sm-4"></div>
	<div class="col-sm-4" style="border:3px solid #00C6ED; border-radius: 4px;">
		<div class="row" style="text-align:center; margin-top: 10px;">
			<font size="6" color="#f0ad4e" style="font-family:inherit; font-weight:bold;">Result Page</font>
		</div>
		<div class="row" style="height:150px; text-align:center; ">
			<div style="margin-top: 50px;">
				<font size="4" style=" font-family:fantasy; font-weight:600; color:#555555">
				${msg}
				</font>
			</div>
		</div>
		<div class="row" style="margin-bottom: 10px;">
			<center><button Type="submit" id="ok" class="btn btn-warning" >확인</button></center>
		</div>
	</div>
	<div class="col-sm-4"></div>
</div>
</form>
</body>
</html>