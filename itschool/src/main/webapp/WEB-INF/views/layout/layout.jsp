<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/page" prefix="page" %>
<!DOCTYPE HTML>
<html>
	<head>
		<title>HI</title>	
	</head>
	<body>
		<page:applyDecorator name="header"/>
        <decorator:body />
		<page:applyDecorator name="footer"/>
		<decorator:getProperty property="page.local_script"></decorator:getProperty>	

	</body>
</html>