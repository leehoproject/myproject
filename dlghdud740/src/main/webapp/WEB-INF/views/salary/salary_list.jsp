<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
	<link rel="stylesheet" href="resources/bootstrap-3.3.7-dist/css/dataTables.uikit.min.css">
	<link rel="stylesheet" href="resources/bootstrap-3.3.7-dist/css/uikit.min.css">
	<script src="resources/js/jquery-3.1.1.js"></script>
	<script src="resources/bootstrap-3.3.7-dist/js/jquery.dataTables.min.js"></script>
	<script src="resources/bootstrap-3.3.7-dist/js/dataTables.uikit.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$('#example').DataTable();
		    $('#write').click(function(){
			    var url = "board_detail";
			    $(location).attr('href',url);	
		    });
		} );
	</script>
<body>
	<form class="form-horizontal" action="salaryPageList" method="post" enctype="multipart/form-data" role="form">
	  <div class="contatiner"  style="height: 650px;backtround-color:#fff">
			<div class="row" style="margin-top:10px"></div>	
		    <span class="text-success text-center" ><h1><i class="fa fa-user" aria-hidden="true"></i>사원정보</h1></span>
		    <br><br>
			<div class="row">
				<div class="col-md-12 text-center" style="margin-top:10px;background-color:#ccc;">
					<span class="col-md-1" style=" border:1px solid #fff;"> 이름 </span>
					<span class="col-md-1" style=" border:1px solid #fff;"> 부서 </span>
					<span class="col-md-1" style=" border:1px solid #fff;"> 배우자 </span>
					<span class="col-md-1" style=" border:1px solid #fff;">부양20</span>
					<span class="col-md-1" style=" border:1px solid #fff;">부양60</span>
					<span class="col-md-2" style=" border:1px solid #fff;">기본급</span>
					<span class="col-md-2" style=" border:1px solid #fff;">수당1</span>
					<span class="col-md-2" style=" border:1px solid #fff;">수당2</span>
					<span class="col-md-1" style=" border:1px solid #fff;">총액</span>
				</div>
			</div>
			<c:forEach var="salarys" items="${salarys}" >
				<div class="row">
					<div class="col-md-12 text-center" style="background-color:#eeeeee">
						<span class="col-md-1" style=" border:1px solid #fff;height:40px;padding:2px; text-align:left;">
						<a href="salary_form?no=${salarys.no}">${salarys.name}</a>
						</span>	
						<span class="col-md-1" style=" border:1px solid #fff;height:40px;padding:2px">${salarys.dept}</span>
						<span class="col-md-1" style=" border:1px solid #fff;height:40px;padding:2px">
						<c:if test="${salarys.partner =='1'}">유</c:if>
						<c:if test="${salarys.partner =='0'}">무</c:if>
						</span>
						<span class="col-md-1" style=" border:1px solid #fff; height:40px;padding:2px">${salarys.dependent20}</span>
						<span class="col-md-1" style=" border:1px solid #fff; height:40px;padding:2px">${salarys.dependent60}</span>
						<span class="col-md-2" style=" border:1px solid #fff; height:40px;padding:2px">${salarys.base}</span>
						<span class="col-md-2" style=" border:1px solid #fff; height:40px;padding:2px">${salarys.extrapay1}</span>
						<span class="col-md-2" style=" border:1px solid #fff; height:40px;padding:2px">${salarys.extrapay2}</span>
						<span class="col-md-1" style=" border:1px solid #fff; height:40px;padding:2px">${salarys.base+salarys.extrapay1+salarys.extrapay2}</span>
					</div>
				</div>
			</c:forEach>
	    <div class="row">
				<div class="col-md-offset-1 col-md-10 resultMessage text-center" style="margin-top:10px">
					<c:forEach var="page" items="${pages}">
					
					<span><a href="salarypageselect?page=${page}">[${page}]</a> </span>
					</c:forEach>
				</div>
			</div>
			
			<div class="row">
				<div class="col-md-offset-1 col-md-7 resultMessage text-center" style="margin-top:10px">
					<span class="col-md-2">
						<select name="Selectbox">
							<option value="name" <c:if test="${salarypaging.getSelectbox() =='name'}">selected</c:if>>이름</option>
							<option value="dept" <c:if test="${salarypaging.getSelectbox() =='dept'}">selected</c:if>>부서</option>
							<option value="no" <c:if test="${salarypaging.getSelectbox() =='no'}">selected</c:if>>사번</option>
						</select>
					</span>
					<span class="col-md-3">
						<input type="text" id="find" name="find" value="${salarypaging.getFind()}" />
					</span>
					<span class="col-md-3">
						<i class="fa fa-search" aria-hidden="true"></i>
						<button  type="submit" class="btn btn-success resultButton"> 검색</button>
					</span>
				</div>
			</div>
		</div> 
   </form> 
</body>
</html>