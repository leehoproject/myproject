<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<script type="text/javascript">
		$(document).ready(function() {
			$('#example').DataTable();
		    $('#cancel').click(function(){
			    var url = "board_detail";
			    $(location).attr('href',url);	
		    });
		});
</script>
<body>
	<form id="insert_form" name="insert_form" class="form-horizontal"action="boardupdate" method="POST" role="form">
	<div class="col-sm-3"></div>
	<div class="col-sm-6" style="border:1px solid #dddddd;">
		<div class="row" style="border-bottom:1px solid #eeeeee;  background-color:#cccccc ">
			<div class="col-sm-4" ></div>
			<div class="col-sm-4" style="text-align:center;" >
				<font face="Arial Black" color="#ffffff" size="6">게시판</font>
			</div>
			<div class="col-sm-4" ></div>
		</div>
		<input Type="hidden" id="b_seq" name="b_seq" value="${board.getB_seq()}"/>
		<div class="row" style="border-bottom:1px solid #eeeeee;">
			<div class="col-sm-9" style="margin-top: 3px;">
				<div class="col-sm-9">
					<div class="input-group">
						<span class="input-group-addon">아이디</span>
						<input class="form-control" id="b_id" name="b_id" value="${board.getB_id()}" readonly="readonly"/>
					</div>
				</div>
			</div>
		</div>
		
		<div class="row" style="border-bottom:1px solid #eeeeee;">
			<div class="col-sm-9" style="margin-top: 5px;">
				<div class="col-sm-9">
					<div class="input-group">
						<span class="input-group-addon">이름</span>
						<input class="form-control" id="b_name" name="b_name" value="${board.getB_name()}" readonly="readonly"/>
					</div>
				</div>
			</div>
		</div>
		
		<div class="row" style="border-bottom:1px solid #eeeeee;">
			<div class="col-sm-9" style="margin-top: 5px;">
				<div class="col-sm-9">
					<div class="input-group">
						<span class="input-group-addon">이메일</span>
						<input class="form-control" id="b_email" name="b_email" value="${board.getB_email()}" readonly="readonly"/>
					</div>
				</div>
			</div>
		</div>
		
		<div class="row">
			<div class="col-sm-9" style="margin-top: 5px;">
				<div class="col-sm-12">
					<div class="input-group">
						<span class="input-group-addon">제목</span>
						<input class="form-control" id="b_title" name="b_title" value="${board.getB_title()}"/>
					</div>
				</div>
			</div>
		</div>
		
		<div class="row">
			<div class="col-sm-12" style="height:300px; margin-top: 3px;">
				<div class="col-sm-12">
					<textarea class="form-control" rows="12" style="width:100%; resize: none;" id="b_content" name="b_content" >${board.getB_content()}</textarea>
				</div>
			</div>
		</div>
		

		
	</div>
	
	<div class="row">
		<div class="col-sm-5"></div>
		<div class="col-sm-4" style="margin-top: 5px; margin-bottom: 3px">
			<c:if test="${sessionid==board.getB_id() || sessionid == 'admin'}">
			<div class="col-sm-4" >
				<button Type="submit" id="save"  class="btn btn-default" style="width:100%;">수정</button>
			</div>
			<div class="col-sm-4">
				<button Type="button" id="cancel" onclick="location.href='boarddeleteyn?b_seq='+${board.getB_seq()}" class="btn btn-default" style="width:100%;">삭제</button>
			</div>
			</c:if>
			<div class="col-sm-4">	
				<button Type="button" id="reply" onclick="location.href='boardreply?b_seq='+${board.getB_seq()}" class="btn btn-default" style="width:100%;">답글</button>
			</div>
		</div>	
	</div>
	
	<div class="col-sm-3"></div>
	</form>
</body>
</html>