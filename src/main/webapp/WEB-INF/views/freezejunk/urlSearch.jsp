<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FREEZEJUNK</title>
<link rel="stylesheet" href="${contextPath }/resources/freezejunk/freezejunkStyle.css"/>
</head>
<body>
	<jsp:include page="../default/header.jsp"/>
	<div class="wrap">
		<form action="" method="post" id="form">
			<div class="head-box">
				<div class="head-text1">유튜브 URL을 입력해주세요 !</div>
				<div class="head-text2">해당 영상의 스팸 댓글 삭제, 스팸계정 차단 등 전체적인 서비스를 지원해드립니다</div>
			</div>
			<div class="search-box">
				<input type="text" class="search" name="url" placeholder="URL 입력"/>
				<span class="search-img-box"><img src="${contextPath }/resources/image/search.png" width="30px"/></span>
			</div>
		</form>
	</div>
	<jsp:include page="../default/footer.jsp"/>
<script src="${contextPath }/resources/freezejunk/freezejunkScript.js"></script>
</body>
</html>