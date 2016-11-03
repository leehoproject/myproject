<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글쓰기</title>
<content tag="local_script">
<link rel="stylesheet" href="resources/bootstrap-3.3.7-dist/css/itschool.css">
<link rel="stylesheet" href="resources/bootstrap-3.3.7-dist/css/bootstrap.css">
<link rel="stylesheet" href="resources/bootstrap-3.3.7-dist/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="resources/bootstrap-3.3.7-dist/css/font-awesome.min.css">
<script src="resources/js/jquery-3.1.1.min.js"></script>
<script src="resources/js/parsley.min.js"></script>
<script src="resources/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
	<script type="text/javascript">		
		$(document).ready(function(){
			$('#confirm').click(function(event) {
				var no = $('#no').val();
				$.ajax({
					type : 'POST',
					data : "no="+ no,
					dataType : 'json',
					url : 'noconfirm',
					success : function(data){
						if(no==""){
							alert("사번를 입력하세요");
							return;
						}
						if(data==0){
							alert("사용가능한 사번 입니다.");
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
					alert("사번 중복 체크를 하세요!")
					return;
				}
				$('#salaryinsertform').submit();
			});		
		});
	</script>
</content>
</head>
<body>
	<form id="salaryinsertform" name="salaryinsertform" class="form-horizontal" enctype="multipart/form-data" action="salaryinsertform" method="POST" role="form" data-parsley-validate="true">
	<div class="col-sm-3"></div>
	<div class="col-sm-6" style="border:1px solid #dddddd;">
		
		<div class="row" style="border-bottom:1px solid #eeeeee;  background-color:#ff4848 ">
			<div class="col-sm-4" ></div>
			<div class="col-sm-4" style="text-align:center;" >
				<font face="Arial Black" color="#ffffff" size="6">정보입력</font>
			</div>
			<div class="col-sm-4" ></div>
		</div>
		
		<div class="row">
			<div class="col-sm-9">
					<div class="input-group" style="margin-top: 10px;">
							<span class="input-group-addon">사번</span>
							<input id="no" name="no" class="form-control"
							required="" maxlength="10" data-parsley-error-message="Please insert your id"
							data-parsley-errors-container="div[id='validateId']"/>
							<span class="input-group-btn">
								<button id="confirm" type="button" class="btn btn-success">중복검사</button>
								<input type="hidden" id="check" value="no"/>
							</span>	
					</div>
							<div id="validateId" style="color:#ff0000;"></div>
			</div>
		</div>
		
		<div class="row">
			<div class="col-sm-5">
				<div class="input-group"  style="margin-top: 10px;">
					<span class="input-group-addon">이름</span>
					<input class="form-control" id="name" name="name" maxlength="20"/>
				</div>
			</div>
		</div>
		
		<div class="row">
			<div class="col-sm-4">
				<div class="input-group"  style="margin-top: 10px;">
					<span class="input-group-addon">부서</span>
						<select id="dept" name="dept" class="form-control">
							<option>흥부</option>
							<option>놀부</option>
							<option>부부</option>
							<option>유부</option>
							<option>기부</option>
						</select>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="col-sm-5">
				<div class="input-group"  style="margin-top: 10px;">
					<span class="input-group-addon">배우자</span>
					<div class="form-control">
						<input type="radio" id="partner" name="partner" value="1" >유
						<input type="radio" id="partner" name="partner" value="0" checked="checked">무
					</div>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="col-sm-8">
				<div class="input-group"  style="margin-top: 10px;">
					<span class="input-group-addon">부양자20</span>
					<select id="dependent20" name="dependent20" class="form-control">
						<c:forEach var="a" begin="1" end="99" step="1">
								<option>${a}</option>
						</c:forEach>
					</select>
					<span class="input-group-addon">부양자60</span>
					<select id="dependent60" name="dependent60" class="form-control">
						<c:forEach var="a" begin="1" end="99" step="1">
								<option>${a}</option>
						</c:forEach>
					</select>
				</div>
			</div>
		</div>
		


		<div class="row">
			<div class="col-sm-6">
				<div class="input-group"  style="margin-top: 10px;">
					<span class="input-group-addon">기본금</span>
					<input class="form-control" id="base" name="base" maxlength="11"/>
				</div>
			</div>
		</div>	
		
		<div class="row">
			<div class="col-sm-6">
				<div class="input-group"  style="margin-top: 10px;">
					<span class="input-group-addon">수당1</span>
					<input class="form-control" id="extrapay1" name="extrapay1" maxlength="11"/>
				</div>
			</div>
		</div>	
		
		<div class="row">
			<div class="col-sm-6">
				<div class="input-group"  style="margin-top: 10px; margin-bottom: 10px;">
					<span class="input-group-addon">수당2</span>
					<input class="form-control" id="extrapay2" name="extrapay2" maxlength="11"/>
				</div>
			</div>
		</div>	
		<div class="row">
			<div class="col-sm-6">
				<div class="input-group"  style="margin-top: 10px; margin-bottom: 10px;">
					<span class="input-group-addon">국민연금</span>
					<input class="form-control" id="insurance" name="insurance" maxlength="11"/>
				</div>
			</div>
		</div>	
	</div>
	
	<div class="row">
		<div class="col-sm-4"></div>
		<div class="col-sm-6" style="margin-top: 5px; margin-bottom: 3px">
			<div class="col-sm-4" >
				<button Type="button" id="save" name="save" class="btn btn-default" style="width:100%;">저장</button>
			</div>
			<div class="col-sm-4">	
				<button Type="button" id="cancel" onclick="location.href='salary'" class="btn btn-default" style="width:100%;">취소</button>
			</div>
		</div>
	</div>
	

		<div class="col-sm-3"></div>
	</form>
</body>
</html>