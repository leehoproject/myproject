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
</content>
</head>
<body>
	<form id="salaryupdateform" name="salaryupdateform" class="form-horizontal" enctype="multipart/form-data" action="salaryupdateform" method="POST" role="form" data-parsley-validate="true">
	<div class="col-sm-3"></div>
	<div class="col-sm-6" style="border:1px solid #dddddd;">
		<div class="row" style="border-bottom:1px solid #eeeeee;  background-color:#cccccc ">
			<div class="col-sm-4" ></div>
			<div class="col-sm-4" style="text-align:center;" >
				<font face="Arial Black" color="#ffffff" size="6">정보수정</font>
			</div>
			<div class="col-sm-4" ></div>
		</div>
	
		<div class="row">
			<div class="col-sm-5">
				<div class="input-group"  style="margin-top: 10px;">
					<span class="input-group-addon">사번</span>
					<input class="form-control" id="no" name="no" readonly="readonly" value="${salary.getNo()}"/>
				</div>
			</div>
		</div>
	
		<div class="row">
			<div class="col-sm-5">
				<div class="input-group"  style="margin-top: 10px;">
					<span class="input-group-addon">이름</span>
					<input class="form-control" id="name" name="name" readonly="readonly" value="${salary.getName()}"/>
				</div>
			</div>
		</div>
		
		<div class="row">
			<div class="col-sm-4">
				<div class="input-group"  style="margin-top: 10px;">
					<span class="input-group-addon">부서</span>
						<select id="dept" name="dept" class="form-control">
							<option <c:if test="${salary.dept=='흥부'}">selected</c:if>>흥부</option>
							<option <c:if test="${salary.dept=='놀부'}">selected</c:if>>놀부</option>
							<option <c:if test="${salary.dept=='부부'}">selected</c:if>>부부</option>
							<option <c:if test="${salary.dept=='유부'}">selected</c:if>>유부</option>
							<option <c:if test="${salary.dept=='기부'}">selected</c:if>>기부</option>
						</select>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="col-sm-4">
				<div class="input-group"  style="margin-top: 10px;">
					<span class="input-group-addon">배우자</span>
					<div class="form-control">
					<center>
						<input type="radio" id="partner" name="partner" value="1" ${salary.partner=='1'?'checked':''}>유
						<input type="radio" id="partner" name="partner" value="0"<c:if test="${salary.getPartner()=='0'}"> checked="checked"</c:if>>무
					</center>
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
								<option <c:if test="${salary.getDependent20()==a}">selected</c:if>>${a}</option>
						</c:forEach>	
					</select>
					<span class="input-group-addon">부양자60</span>
					<select id="dependent60" name="dependent60" class="form-control">
						<c:forEach var="a" begin="1" end="99" step="1">
								<option  <c:if test="${salary.getDependent60()==a}">selected</c:if>>${a}</option>
						</c:forEach>
					</select>
				</div>
			</div>
		</div>
		


		<div class="row">
			<div class="col-sm-6">
				<div class="input-group"  style="margin-top: 10px;">
					<span class="input-group-addon">기본금</span>
					<input class="form-control" id="base" name="base" value="${salary.getBase()}" maxlength="11"/>
				</div>
			</div>
		</div>	
		
		<div class="row">
			<div class="col-sm-6">
				<div class="input-group"  style="margin-top: 10px;">
					<span class="input-group-addon">수당1</span>
					<input class="form-control" id="extrapay1" name="extrapay1" value="${salary.getExtrapay1()}" maxlength="11"/>
				</div>
			</div>
		</div>	
		
		<div class="row">
			<div class="col-sm-6">
				<div class="input-group"  style="margin-top: 10px; margin-bottom: 10px;">
					<span class="input-group-addon">수당2</span>
					<input class="form-control" id="extrapay2" name="extrapay2" value="${salary.getExtrapay2()}" maxlength="11"/>
				</div>
			</div>
		</div>	
	</div>
	
	<div class="row">
		<div class="col-sm-4"></div>
		<div class="col-sm-5" style="margin-top: 5px; margin-bottom: 3px">
			<div class="col-sm-4" >
				<button Type="submit" id="update" class="btn btn-default" style="width:100%;">수정</button>
			</div>
			<div class="col-sm-4" >
				<button Type="button" id="delete" onclick="location.href='salary_delete_rs?no=${salary.getNo()}'" class="btn btn-default" style="width:100%;">삭제</button>
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