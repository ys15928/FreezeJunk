<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>" />

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>FREEZEJUNK</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

</head>
<body>
	<form action='junkResult' method="post">
		== Input URL==<br> 
		<input type="text" name="url" id="url"
			size="50px"> 
		<input type='submit' value='Freeze'>
	</form>
</body>

</html>