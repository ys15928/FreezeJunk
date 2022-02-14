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
<script src="https://apis.google.com/js/api.js"></script>
</head>
<body>
	<form action='keywordFreezeResult' method="post">
		== Input Viedo URL==<br> 
		<input type="text" name="videoUrl" id="videoUrl"
			size="50px"> <br><br>  
			
		== Input Keyowrds==<br>
		<textarea name="keywords" id="keywords" rows="5" cols="50"> </textarea>
		<input type='submit' value='Freeze'>
	</form><br><br>
	
</body>
</html>