<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글쓰기</title>
<link rel="stylesheet" href="resources/bootstrap-3.3.7-dist/css/itschool.css">
<link rel="stylesheet" href="resources/bootstrap-3.3.7-dist/css/bootstrap.css">
<link rel="stylesheet" href="resources/bootstrap-3.3.7-dist/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="resources/bootstrap-3.3.7-dist/css/font-awesome.min.css">
<script src="resources/js/jquery-3.1.1.min.js"></script>
<script src="resources/js/parsley.min.js"></script>
<script src="resources/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>
	<form id="insert_form" name="insert_form" class="form-horizontal"action="loginup" method="POST" role="form" data-parsley-validate="true">
	<div class="col-sm-3"></div>
	<div class="col-sm-6" style="border:1px solid #dddddd;">
		
		<div class="row" style="border-bottom:1px solid #eeeeee;  background-color:#cccccc ">
			<div class="col-sm-4" ></div>
			<div class="col-sm-4" style="text-align:center;" >
				<font face="Arial Black" color="#ffffff" size="6">로그인</font>
			</div>
			<div class="col-sm-4" ></div>
		</div>
		
		<div class="row" style="border-bottom:1px solid #eeeeee;">
			<div class="col-sm-9" style="margin-top: 5px;">
				<div class="col-sm-9">
					<div class="input-group">
						<input autofocus class="form-control" id="id" name="id" placeholder="이메일"
						type="email"  data-parsley-type="email" required="" data-parsley-error-message="Please insert your email id"
						data-parsley-errors-container="div[id='validateemail']"/>
					</div>
					<div id="validateemail" style="color:#ff0000;"></div>
				</div>
			</div>
		</div>
		
		
		<div class="row" style="border-bottom:1px solid #eeeeee;">
			<div class="col-sm-9" style="margin-top: 5px;">
				<div class="col-sm-9">
					<div class="input-group">
						<input class="form-control" id="password" name="password" placeholder="패스워드"
						required="" data-parsley-error-message="Please insert your email"
						data-parsley-errors-container="div[id='validateemail']"/>
					</div>
				</div>
			</div>
		</div>		
	</div>
	
	<div class="row">
		<div class="col-sm-5"></div>
		<div class="col-sm-4" style="margin-top: 5px; margin-bottom: 3px">
			<div class="col-sm-6" >
				<button Type="submit" id="save" class="btn btn-default" style="width:100%;">로그인</button>
			</div>
			<div class="col-sm-6">	
				<button Type="button" id="cancel" class="btn btn-default" style="width:100%;">취소</button>
			</div>
		</div>
	</div>
	
	<div class="col-sm-3"></div>
	</form>
</body>
</html>