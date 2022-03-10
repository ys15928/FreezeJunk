<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FREEZEJUNK</title>
<link rel="stylesheet"
	href="${contextPath }/resources/default/mainStyle.css" />
</head>
<body>
<div class="container">
	<jsp:include page="../default/header.jsp" />
	이창을 닫아주세요

	<jsp:include page="../default/footer.jsp" />
</div>
</body>
</html>