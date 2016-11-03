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
		    $("#example_filter").append("<button Type='button' id='selectdel' class='btn btn-info' style='margin-left:350px;'>선택삭제</button>");
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
			    		
			    		var url = "memberselectdelete?saveids="+saveids;
			    		$(location).attr('href',url);	
		    		} else {
		    			return;
		    		}
		    	}
		    });
		} );
	</script>
</content>	
<body>
	<table id="example" class="uk-table uk-table-hover uk-table-striped" cellspacing="0" width="100%">
        <thead>
            <tr>
                <th>Id</th>
                <th>Password</th>
                <th>Name</th>
                <th>Email</th>
                <th>PhoneNUM</th>
                <th>photo</th>
                <th style="text-align: center !important"><input Type="checkbox" id="allchk"></th>
            </tr>
        </thead>
        <tfoot>
            <tr>
                <th>Id</th>
                <th>Password</th>
                <th>Name</th>
                <th>Email</th>
                <th>PhoneNUM</th>
                <th>photo</th>
            </tr>
        </tfoot>
        <tbody>
          <c:forEach var="member" items="${members}">
            <tr>
                <td><a href="member_update_form?id=${member.id}">${member.id}</a></td>
                <td>${member.password}</td>
                <td>${member.name}</td>
                <td>${member.email}</td>
                <td>${member.phone1}-${member.phone2}-${member.phone3}</td>
                <td><img src="${member.photo}" width="40" height="40"></td>
                <th style="text-align: center !important"><input Type="checkbox" id="unitchk" name="unitchk" value="${member.id}"></th>
            </tr>
       	  </c:forEach>
        </tbody>
    </table>
</body>
</html>