<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<content tag="local_script">
<title>글쓰기</title>
<link rel="stylesheet" href="resources/bootstrap-3.3.7-dist/css/itschool.css">
<link rel="stylesheet" href="resources/bootstrap-3.3.7-dist/css/bootstrap.css">
<link rel="stylesheet" href="resources/bootstrap-3.3.7-dist/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="resources/bootstrap-3.3.7-dist/css/font-awesome.min.css">
<script src="resources/js/jquery-3.1.1.min.js"></script>
<script src="resources/js/parsley.min.js"></script>
<script src="resources/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
	    $('#create').click(function(){
	    	var returnValue = confirm("확인이면 데이터소멸 후 생성됩니다!\n\n 생성하시겠습니까?");
	    	if(returnValue){
				$('#salarycreate_form').submit();
	    	} else {
	    		return;
	    	}
	    });
	});
</script>
</content>
</head>

<body>
	<form id="salarycreate_form" name="salarycreate_form" class="form-horizontal"action="salarycreateyn" method="POST" role="form" data-parsley-validate="true">
	<div class="col-sm-4"></div>
	<div class="col-sm-4" style="border:1px solid #dddddd;">
		<div class="row" style="border-bottom:1px solid #eeeeee;  background-color:#cccccc ">
			<div class="col-sm-3" ></div>
			<div class="col-sm-6" style="text-align:center;" >
				<font face="Arial Black" color="#ffffff" size="6">월 급여 생성</font>
			</div>
			<div class="col-sm-3" ></div>
		</div>
	
		<div class="row" >
			<div class="col-sm-offset-1 col-sm-10">
				<div class="input-group" style="width: 100%;">
					<div class="input-group"  style="margin-top: 10px; width: 100%;">
						<span class="input-group-addon" style="width: 50%;">처리 년도</span>
						<select id="yyyy" name="yyyy" class="form-control" style="text-align: center;">
							<c:forEach var="a" begin="1900" end="2016" step="1">
									<option <c:if test="${year==a}">selected</c:if>>${a}</option>
							</c:forEach>
						</select>
					</div>
				</div>
			</div>
		</div>
		<div class="row" >
			<div class="col-sm-offset-1 col-sm-10">
				<div class="input-group" style="width: 100%;">
					<div class="input-group"  style="margin-top: 10px; width: 100%;">
						<span class="input-group-addon" style="width: 50%;">처리 월</span>
						<select id="mm" name="mm" class="form-control" style="text-align: center;">
							<option>01</option>
							<option>02</option>
							<option>03</option>
							<option>04</option>
							<option>05</option>
							<option>06</option>
							<option>07</option>
							<option>08</option>
							<option>09</option>
							<option>10</option>
							<option>11</option>
							<option>12</option>
						</select>
					</div>
				</div>
			</div>
		</div>
		
		<div class="row" style="margin-top: 10px; margin-bottom: 10px">
			<div class="col-sm-offset-1 col-sm-5" >
				<button Type="button" id="create" name="create" class="btn btn-default" style="width:100%;">생성</button>
			</div>
			<div class="col-sm-5">	
				<button Type="button" id="cancel" onclick="location.href='salary'" class="btn btn-default" style="width:100%;">취소</button>
			</div>
		</div>
	</div>
	</div>
	<div class="col-sm-4"></div>
	</form>
</body>
</html>