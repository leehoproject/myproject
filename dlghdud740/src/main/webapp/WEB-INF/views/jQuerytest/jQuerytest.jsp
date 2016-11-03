<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<content tag="local_script">
	<link rel="stylesheet" href="resources/bootstrap-3.3.7-dist/css/itschool.css">
	<link rel="stylesheet" href="resources/bootstrap-3.3.7-dist/css/bootstrap.css">
	<link rel="stylesheet" href="resources/bootstrap-3.3.7-dist/css/bootstrap-theme.min.css">
	<link rel="stylesheet" href="resources/bootstrap-3.3.7-dist/css/font-awesome.min.css">
	<script src="resources/js/jquery-3.1.1.min.js"></script>
	<script src="resources/js/parsley.min.js"></script>
	<script src="resources/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
	<script type="text/javascript">
		
		function doReset(){                         //페이지가 시작될때 input안에있는값들을 공백으로 바꿔줌
			document.insert_form.id.value = "";
			document.insert_form.password.value = "";
			document.insert_form.repassword.value = "";	
		}
		
		$(document).ready(function(){
			$('#photo').change(function(event) {
				var tmppath = URL.createObjectURL(event.target.files[0]);
				$('#image').attr('src',tmppath);
			
			});
			$('#confirm').click(function(event) {
				var id = $('#id').val();
				$.ajax({
					type : 'POST',
					data : "id="+ id,
					dataType : 'json',
					url : 'idconfirm',
					success : function(data){
						if(id==""){
							alert("id를 입력하세요");
							return;
						}
						if(data==0){
							alert("사용가능한 아이디 입니다.");
							$('#check').attr('value','yes');
						} else {
							alert("중복");
							return;
						}
						return false;
					}
				});
			});
			
			$('#save').click(function(event) {
				if($('#check').val()=='no'){
					alert("아이디 중복 체크를 하세요!")
					return;
				}
				$('#insert_form').submit();
			});
			
// 			$("#ulphone1 li").click(function(){
// 				$('#phone1').attr('value',$(this).text());
// 			});
		});
	</script>
</content>
	
<body onload="doReset();">
	<form id="insert_form" name="insert_form" class="form-horizontal" enctype="multipart/form-data" action="memberInsert" method="POST" role="form" data-parsley-validate="true">
		<div class="con-new5" style="border-top:6px solid #eeeeee; border-bottom:6px solid #eeeeee;">
			<font class="margin1" size="10" color="#000000" face="Arial Black" style="margin:0 auto;">hi</font>
		</div>
		
		<div class="col-sm-3"></div>
		<div class="col-sm-6">
			<div class="class">
				<div class="row">
					<div class="margin-top">
						<div class="col-sm-9">
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-user"></i></span>
								<input id="id" name="id" class="form-control" placeholder="아이디"
								required="" type="email"  data-parsley-type="email" data-parsley-error-message="Please insert your email id"
								data-parsley-errors-container="div[id='validateId']"/>
								<span class="input-group-btn">
									<button id="confirm" type="button" class="btn btn-success">중복검사</button>
									<input type="hidden" id="check" value="no"/>
								</span>	
							</div>
							<div id="validateId" style="color:#ff0000;"></div>
						</div>
					</div>
				</div>
				
				<div class="row">
					<div class="margin-top">
						<div class="col-sm-12">
							<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-unlock-alt"></i></span>
									<input name="password" id="password" class="form-control" placeholder="비밀번호"
									required="true" data-parsley-error-message="Please insert your password"
									data-parsley-errors-container="div[id='validatePassword']"/>
									<span class="input-group-addon"><i class="fa fa-unlock"></i></span>
									<input name="repassword" id="repassword" class="form-control" placeholder="비밀번호확인"
									required="true" data-parsley-error-message="Please check Password and Repassword"
									data-parsley-equalto="#password" data-parsley-errors-container="div[id='validateRepassword']"/>
							</div>
						</div>
					</div>
				</div>	
				<div id="validatePassword" style="color:#ff0000;"></div>
				<div id="validateRepassword" style="color:#ff0000;"></div>
			
				<div class="row">
					<div class="margin-top">
						<div class="col-sm-6">
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-user-plus"></i></span>
								<input id="name" name="name" class="form-control" placeholder="이름"/>
							</div>
						</div>
					</div>
				</div>	
				
				<div class="row" >	
					<div class="margin-top">	
						<div class="col-sm-12">
							<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-phone"></i></span>
									<select id="phone1" name="phone1" class="form-control">
										<option>010</option>
										<option>011</option>
										<option>012</option>
										<option>017</option>
										<option>018</option>
									</select>
									<span class="input-group-addon">-</span>
									<input id="phone2" name="phone2" class="form-control"/>
									<span class="input-group-addon">-</span>
									<input id="phone3" name="phone3" class="form-control"/>
							</div>
						</div>
					</div>
				</div>
				
				<div class="row">
					<div class="margin-top">
						<div class="col-sm-9">
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-map-marker"></i></span>
								<input id="zipcode" name="zipcode" class="form-control" placeholder="우편번호" >
								<span class="input-group-btn">
									<button type="button" class="btn btn-success">우편번호 검색</button>
								</span>	
							</div>
						</div>
					</div>
				</div>
				
				<div class="class">
					<div class="margin2">
						<input id="addr1" name="addr1" class="form-control" placeholder="주소 1"/>
					</div>
				</div>		
				<div class="class">
					<div class="margin2">
						<input id="addr2" name="addr2" class="form-control" placeholder="주소 2"/>
					</div>
				</div>		
				
				<div class="class">
					<div class="con-new3">
						<div class="input-group">
							<span class="input-group-addon"><i class="fa fa-credit-card"></i></span>
							<input id="cardno" name="cardno" class="form-control" placeholder="카드번호"/>
						</div>
					</div>
				</div>	
				
				<div class="row">
					<div class="con-new3">
						<div class="col-sm-6">
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-picture-o"></i></span>
								<img id="image" name="image" class="form-control" src="resources\jpg\itschool.jpg"">
							</div>	
						</div>
					</div>
				</div>
				
				<div class="row">
					<div class="con-new4">
						<div class="col-sm-1">
							<input type="file" id="photo" name="imgfile"/>
						</div>
					</div>
				</div>
				
				<div class="row">
					<div class="con-new3" style="border-top:6px solid #eeeeee; height:500px;">
						<div class="col-sm-6">
							<button id="save" type="button" class="btn btn-primary" style="width:100%;">가입</button>
						</div>
						<div class="col-sm-6">
							<button id="cancel" type="button" class="btn btn-danger" style="width:100%;">취소</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<div class="col-sm-3"></div>
		
	</form>
</body>
</html>