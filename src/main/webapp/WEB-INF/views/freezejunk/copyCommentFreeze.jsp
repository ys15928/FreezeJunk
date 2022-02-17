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
		<form action="copyCommentFreezeResult" method="post" id="form">
			<div class="head-box">
				<div class="head-text1">유튜브 URL을 입력해주세요 !</div>
				<div class="head-text2">해당 영상의 인기댓글 상위 50개 중 댓글을 복사한 봇의 계정을 차단 및 댓글을 삭제해드립니다</div>
			</div>
			<div class="search-box">
				<input type="text" class="search" id="videoUrl" name="videoUrl" placeholder="URL 입력"/>
				<span class="search-img-box"><img src="${contextPath }/resources/image/search_white.png" width="30px" onclick="videoUrlCheck();"/></span>
			</div>
		</form>
	</div>
	<jsp:include page="../default/footer.jsp"/>
<script src="${contextPath }/resources/jquery-3.6.0.min.js"></script>
<script src="${contextPath }/resources/freezejunk/freezejunkScript.js?ver=2"></script>
</body>
</html>