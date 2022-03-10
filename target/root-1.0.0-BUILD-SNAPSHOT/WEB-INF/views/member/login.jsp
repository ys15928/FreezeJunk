<%@page import="com.care.root.member.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FreezeJunk</title>
<link rel="stylesheet"
	href="${contextPath }/resources/login/loginStyle.css" />
</head>
<body>

<<<<<<< HEAD
<c:if test="${loginUser != null }">
	<script>
		alert("이미 로그인 된 상태입니다.");
		location.href="main";
	</script>
</c:if>
=======
	<c:if test="${loginUser != null }">
		<script>
			alert("이미 로그인 된 상태입니다.");
			location.href = "main";
		</script>
	</c:if>
>>>>>>> 41b1885e8cb0782bc0a8244588ddb870eef7e22c

	<div class="mainlogin">
		<div class="mainheader">
			<div class="mainheight30"></div>
			<div class="login">
				<a href="${contextPath }/first"><img class="mainheight60"
					src="${contextPath }/resources/login/logoblack.png"></a>
			</div>
			<div id="login-form">
				<div class="login-input-box">
					<input type="text" id="logId" name="id" placeholder="아이디" /> <input
						type="password" id="logPwd" name="pwd" placeholder="비밀번호" /> <span
						class="login-comment" id="login-comment">아이디 또는 비밀번호를 확인해
						주세요.</span>
				</div>
			</div>
			<div class="login-btn-box">
				<button type="button" onclick="login();" id="login-btn">로그인</button>
			</div>

			<div class="idpw_search">
				<div>
					<a href="idpwsearch"> <span class="login-option">아이디/비밀번호
							찾기</span>
					</a>
				</div>
				<span class="margin-l_co">|</span>
				<div>
					<a href="membership"> <span class="login-option ml-15">회원가입</span>
					</a>
				</div>
			</div>
		</div>
	</div>

	<script src="${contextPath }/resources/jquery-3.6.0.min.js"></script>
	<script src="${contextPath }/resources/login/loginScript.js"></script>
</body>
</html>