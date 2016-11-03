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
		    $('#allchk').click(function(){
		    	if($(this).is(':checked')){
		    		$("input[name=unitchk]").prop("checked",true);
		    	} else {
		    		$("input[name=unitchk]").prop("checked",false);
		    	}
		    });
		    $('#write').click(function(){
			    var url = "board_detail";
			    $(location).attr('href',url);	
		    });
		    $('#selectdel').click(function(){
		    	var checked = $("input[name=unitchk]:checked").length;
		    	var saveids = new Array();
		    	if(checked==0){
		    		alert("삭제 항목을 선택해주세요.");
		    		return;
		    	} else {
		    		var returnValue = confirm("삭제하시겠습니까?");
		    		if(returnValue){
		    			$('#unitchk:checked').each(function(index){
			    			saveids[index] = $(this).val(); 
			    		});
			    		
			    		var url = "boardselectdelete?saveids="+saveids;
			    		$(location).attr('href',url);	
		    		} else {
		    			return;
		    		}
		    	}
		    });
		} );
	</script>
<body>
	<form class="form-horizontal" action="boardPageList" method="post" enctype="multipart/form-data" role="form">
	  <div class="contatiner"  style="height: 650px;backtround-color:#fff">
			<div class="row" style="margin-top:10px"></div>	
		    <span class="text-success text-center" ><h1><i class="fa fa-pencil-square-o" aria-hidden="true"></i> Board List</h1></span>
		    <br><br>
			<div class="row">
				<div class="col-md-offset-2 col-md-8 text-center" style="margin-top:10px;background-color:#ccc;">
					<span class="col-md-2" > 글번호 </span>
					<span class="col-md-3" style=" border:1px solid #fff;"> 제목 </span>
					<span class="col-md-2" style=" border:1px solid #fff;"> 글쓴이 </span>
					<span class="col-md-3" style=" border:1px solid #fff;"> 날짜 </span>
					<span class="col-md-1" >조회</span>
					<span class="col-md-1" >파일</span>
				</div>
			</div>
			<c:forEach var="board" items="${boards}" >
				<div class="row">
					<div class="col-md-offset-2 col-md-8 text-center" style="background-color:#eeeeee">
						<span class="col-md-2" style=" border:1px solid #fff; height:40px;padding:2px">
						<c:if test="${board.b_step ==0}">${board.b_ref}</c:if></span>
						<span class="col-md-3" style=" border:1px solid #fff;height:40px;padding:2px; text-align:left;">
						<c:if test="${board.b_step ==1}"><i class="fa fa-hand-o-right" aria-hidden="true"></i></c:if>
						<a href="board_update_form?b_seq=${board.b_seq}">${board.b_title}</a>
						</span>	
						<span class="col-md-2" style=" border:1px solid #fff;height:40px;padding:2px">${board.b_name}</span>
						<span class="col-md-3" style=" border:1px solid #fff;height:40px;padding:2px">${board.b_date}</span>
						<span class="col-md-1" style=" border:1px solid #fff; height:40px;padding:2px">${board.b_hit}</span>
						<span class="col-md-1" style=" border:1px solid #fff; height:40px;padding:2px">
						<c:if test="${board.b_attach != null}">
							<a href="boarddownload?b_attach=${board.b_attach}"><i class="fa fa-file" aria-hidden="true"></i></a>
						</c:if>
						</span>
					</div>
				</div>
			</c:forEach>
	    <div class="row">
				<div class="col-md-offset-2 col-md-8 resultMessage text-center" style="margin-top:10px">
					<c:forEach var="page" items="${pages}">
					
					<span><a href="boardpageselect?page=${page}">[${page}]</a> </span>
					</c:forEach>
				</div>
			</div>
			
			<div class="row">
				<div class="col-md-offset-2 col-md-8 resultMessage text-center" style="margin-top:10px">
					<span class="col-md-2">
						<select name="Selectbox">
							<option value="b_title" <c:if test="${boardpaging.getSelectbox() =='b_title'}">selected</c:if>>제목</option>
							<option value="b_name" <c:if test="${boardpaging.getSelectbox() =='b_name'}">selected</c:if>>글쓴이</option>
							<option value="b_content" <c:if test="${boardpaging.getSelectbox() =='b_content'}">selected</c:if>>내용</option>
						</select>
					</span>
					<span class="col-md-3">
						<input type="text" id="find" name="find" value="${boardpaging.getFind()}" />
					</span>
					<span class="col-md-3">
						<i class="fa fa-search" aria-hidden="true"></i>
						<button  type="submit" class="btn btn-success resultButton"> 검색</button>
					</span>
					<span class="col-md-offset-2 col-md-2">
						<i class="fa fa-pencil" aria-hidden="true"></i>
						<button  id="write" type="button" onclick="location.href='board_detail'"  class="btn btn-info resultButton"> 글쓰기</button>
					</span>
				</div>
			</div>
		</div> 
   </form> 
</body>
</html>