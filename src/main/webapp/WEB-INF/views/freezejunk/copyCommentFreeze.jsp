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
<body style="width: 1920px; overflow-x: hidden; background-color: black;">
<div class="container">
	<jsp:include page="../default/header.jsp"/>
	<div class="wrap" style="margin-top: 130px;">
		<form action="copyCommentFreezeResult" method="post" id="form">
			<div class="head-box">
				<div class="head-text1">유튜브 URL을 입력해주세요 !</div>
				<div class="head-text2">해당 영상의 인기댓글 상위 200개 중 댓글을 복사한 봇의 계정을 차단하고 댓글을 삭제해드립니다</div>
			</div>
			<div class="search-box">
				<input type="text" class="search" id="videoUrl" name="videoUrl" placeholder="URL 입력"/>
				<span class="search-img-box"><img src="${contextPath }/resources/image/search_white.png" width="30px" onclick="videoUrlCheck();"/></span>
			</div>
		</form>
		<div style="margin-top: 15px;">
		  <video controls poster="${contextPath }/resources/login/logoblack.png">
     		 <source src="${contextPath}/resources/freezejunk/jeju.mp4" type="video/mp4">
     		 <strong>Your browser does not support the video tag.</strong>
   		 </video>  
   		 </div>
	</div>
	<jsp:include page="../default/footer.jsp"/>
	</div>
<script src="${contextPath }/resources/jquery-3.6.0.min.js"></script>
<script src="${contextPath }/resources/freezejunk/freezejunkScript.js?ver=2"></script>
</body>
</html>