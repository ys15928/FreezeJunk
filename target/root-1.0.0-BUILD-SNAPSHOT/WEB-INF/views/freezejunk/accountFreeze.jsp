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
	<div class="wrap">
		<form action="accountFreezeResult" method="post" id="form">
			<div class="head-box">
				<div class="head-text1">유튜브 URL과 스팸계정을 입력해주세요 !</div>
				<div class="head-text2">해당 영상에서 스팸계정들이 작성한 계정을 차단하고 댓글을 삭제해드립니다</div>
			</div>
			<div class="search-box">
				<input type="text" class="search" id="videoUrl" name="videoUrl" placeholder="URL 입력"/>
				<span class="search-img-box"><img src="${contextPath }/resources/image/search_white.png" width="30px" onclick="userCheck();"/></span>
			</div>
			<div class="keywords-box">
				<textarea name="accounts" class="keywords-search" id="accounts" placeholder="차단 및 삭제하고자 한 영상의 댓글을 드래그하여 넣어주세요.(여러개일시 ,로 구분해주세요)"></textarea>
			</div>
		</form>
		<div>
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