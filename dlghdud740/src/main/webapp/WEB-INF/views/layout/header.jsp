<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" type="text/css" href="resources/ghdud740/assets/css/bootstrap.min.css">
		<link rel="stylesheet" href="resources/ghdud740/assets/font-awesome/css/font-awesome.min.css">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link href="https://fonts.googleapis.com/css?family=Istok+Web" rel="stylesheet">
		<link href="https://fonts.googleapis.com/css?family=Roboto:400,400i,700" rel="stylesheet">
		<link rel="stylesheet" href="resources/ghdud740/assets/css/magnific-popup.css">
		<link rel="stylesheet" type="text/css" href="resources/ghdud740/assets/css/main.css">
		<script src="resources/ghdud740/assets/js/jquery-3.1.0.min.js"></script>
		<script src="resources/ghdud740/assets/js/bootstrap.min.js"></script>
		<script src="resources/ghdud740/assets/js/jquery.magnific-popup.min.js"></script>
		<script src="resources/ghdud740/assets/js/script.js"></script>
</head>
<body>
<body>
<nav class="navbar navbar-default">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
					<span class="icon-bar"></span> 
					<span class="icon-bar"></span> 
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="index.html"><span class="fa fa-home"></span>HOME</a>
			</div>
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav">
					<li ><a href="list">리스트</a></li>
					<li ><a href="board_list">게시판</a></li>
					<li ><a href="salary">관리</a></li>
					<li ><a href="salarycreate">월급여생성</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<c:choose>
						<c:when test="${sessionid ==null}">
							<li><a href="register"><span class="fa fa-user"></span>회원가입</a></li>
							<li><a href="login"><span class="fa fa-sign-in"></span>로그인</a></li>						
						</c:when>
						<c:otherwise>
							<li><a href="member_update_form?id=${sessionid}"><span class="fa fa-user"></span>회원수정</a></li>
							<li><a href="logout"><span class="fa fa-sign-out"></span>로그아웃</a></li>
						</c:otherwise>
					</c:choose>		
				</ul>
			</div>
		</div>
	</nav>
</body>
</body>
</html>