<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글쓰기</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="resources/bootstrap-3.3.7-dist/css/itschool.css">
<link rel="stylesheet" href="resources/bootstrap-3.3.7-dist/css/bootstrap.css">
<link rel="stylesheet" href="resources/bootstrap-3.3.7-dist/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="resources/bootstrap-3.3.7-dist/css/font-awesome.min.css">
<script src="resources/js/jquery-3.1.1.min.js"></script>
<script src="resources/js/parsley.min.js"></script>
<script src="resources/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>
	<form id="insert_form" name="insert_form" class="form-horizontal"action="index" method="GET" role="form" data-parsley-validate="true">
	<div class="col-sm-3"></div>
	<div class="col-sm-6" style="border:1px solid #dddddd;">
		
		
		<div class="alert alert-danger fade in" style="margin-top: 10px;">
  			<strong>no!</strong> 로그인 후 입장 가능합니다.
		</div>
		

	<div class="row">
		<div class="col-sm-5"></div>
		<div class="col-sm-4" style="margin-top: 5px; margin-bottom: 3px">
			<div class="col-sm-6" >
				<button Type="submit" id="save" class="btn btn-default" style="width:100%;">확인</button>
			</div>
		</div>
	</div>
	
	<div class="col-sm-3"></div>
	</form>
</body>
</html>