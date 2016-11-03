<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		$(document).ready(function(){
			$('#photo').change(function(event) {
				var tmppath = URL.createObjectURL(event.target.files[0]);
				$('#image').attr('src',tmppath);
			
			});

			$('#save').click(function(event) {
		
				$('#update_form').submit();
			});
		});
	</script>
</content>
<body onload="doReset();">
	<form id="update_form" name="update_form" class="form-horizontal" enctype="multipart/form-data" action="memberupdate" method="GET" role="form" data-parsley-validate="true">
		<div class="col-sm-3"></div>
		<div class="col-sm-6">
			<div class="class">
				<div class="row">
					<div class="margin-top">
						<div class="col-sm-6">
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-user"></i></span>
								<input id="id" name="id" class="form-control" value="${member.getId()}" readonly="readonly"/>
								<span class="input-group-btn">
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
									<input name="password" id="password" value="${member.getPassword()}" class="form-control"/>
									<span class="input-group-addon"><i class="fa fa-unlock"></i></span>
									<input name="repassword" id="repassword" value="${member.getPassword()}" class="form-control" />
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
								<input id="name" name="name" class="form-control" value="${member.getName()}"/>
							</div>
						</div>
					</div>
				</div>	
				
				<div class="row" >	
					<div class="margin-top">	
						<div class="col-sm-12">
							<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-phone"></i></span>
									<select id="phone1" name="phone1"  value="${member.getPhone1()}" class="form-control">
										<option value="010" <c:if test="${member.phone1=='010'}">selected</c:if>>010</option>
										<option value="011" <c:if test="${member.phone1=='011'}">selected</c:if>>011</option>
										<option value="012" <c:if test="${member.phone1=='012'}">selected</c:if>>016</option>
										<option value="017" <c:if test="${member.phone1=='017'}">selected</c:if>>017</option>
										<option value="018" <c:if test="${member.phone1=='018'}">selected</c:if>>018</option>
									</select>
									<span class="input-group-addon">-</span>
									<input id="phone2" name="phone2"  value="${member.getPhone2()}" class="form-control"/>
									<span class="input-group-addon">-</span>
									<input id="phone3" name="phone3"  value="${member.getPhone3()}" class="form-control"/>
							</div>
						</div>
					</div>
				</div>
				
				<div class="row">
					<div class="margin-top">
						<div class="col-sm-9">
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-map-marker"></i></span>
								<input id="zipcode" name="zipcode" class="form-control"  value="${member.getZipcode()}"/>
								<span class="input-group-btn">
									<button type="button" class="btn btn-success">우편번호 검색</button>
								</span>	
							</div>
						</div>
					</div>
				</div>
				
				<div class="class">
					<div class="con-new3">
						<div class="input-group">
							<span class="input-group-addon"><i class="fa fa-envelope"></i></span>
							<input id="addr1" name="addr1" class="form-control"  value="${member.getAddr1()}"/>
						</div>
					</div>
				</div>		
				<div class="class">
					<div class="con-new3">
						<div class="input-group">
							<span class="input-group-addon"><i class="fa fa-envelope"></i></span>
							<input id="addr2" name="addr2" class="form-control"  value="${member.getAddr2()}"/>
						</div>
					</div>
				</div>		

				<div class="class">
					<div class="con-new3">
						<div class="input-group">
							<span class="input-group-addon"><i class="fa fa-credit-card"></i></span>
							<input id="cardno" name="cardno" class="form-control"  value="${member.getCardno()}"/>
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
							<input type="file" id="photo" name="photo"  value="${member.getPhoto()}"/>
						</div>
					</div>
				</div>
				
				<div class="row">
					<div class="con-new3" style="border-top:6px solid #eeeeee; height:500px;">
						<div class="col-sm-4">
							<button id="save" type="button" class="btn btn-primary" style="width:100%;">저장</button>
						</div>
						<div class="col-sm-4">
							<button id="delete" type="button" onclick="location.href='memberdeleteyn?id=${member.id}'" class="btn btn-danger" style="width:100%;">삭제</button>
						</div>
						<div class="col-sm-4">
							<button id="cancel" type="button" onclick="location.href='list'" class="btn btn-danger" style="width:100%;">취소</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<div class="col-sm-3"></div>
		
	</form>
</body>
</html>