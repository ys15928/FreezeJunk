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
				<div class="head-text1">유튜브 URL과 스팸계정을 입력해주세요 !</div>
				<div class="head-text2">해당 영상에서 스팸계정들이 작성한 댓글 삭제 및 계정 차단을 해드립니다</div>
			</div>
			<div class="search-box">
				<input type="text" class="search" name="url" placeholder="URL 입력"/>
				<span class="search-img-box"><img src="${contextPath }/resources/image/search.png" width="30px"/></span>
			</div>
			<div class="keywords-box">
				<textarea name="user" class="keywords-search" placeholder="계정명 입력(계정이 여러개일시 ,로 구분)"></textarea>
			</div>
		</form>
	</div>
	<jsp:include page="../default/footer.jsp"/>
<script src="${contextPath }/resources/freezejunk/freezejunkScript.js"></script>
</body>
</html>