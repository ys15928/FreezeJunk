<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
<style type="text/css">
a {	text-decoration: none; }
button:hover { cursor: pointer; }

#login-form {display: flex; justify-content: center; height: 132px;}

.login-input-box {	display: grid;	height: 145px;}

.login-input-box>input {width: 300px; height: 40px;	border: 1px solid white;	border-radius: 8px;	font-size: 15px; color:gray;}

.login-input-box>input:last-child {	margin-top: 10px; }

.login-btn-box { margin-left: 20px; }

#login-btn { width: 100px; height: 102px; border: 1px solid white; border-radius: 14px; 
			background-color: #fff; color: gray; font-size: 17px; font-weight: bold;}

#login-btn:hover { cursor: pointer; }

.login-option {	font-size: 12px; color: gray; }

.ml-15 { margin-left: 15px; }

.login-comment { color: gray; font-size: 27px;	margin-bottom: 40px; font-weight: bold;}
.login-input-comment {	font-weight: bold;	color: red;	visibility: hidden; }
</style>
</head>
<body>
<jsp:include page="../default/header.jsp"/>
	<div style="text-align: center; background-color: #EAEAEA;width: 563px;
    height: 301px;
    margin: auto;
    margin-top: 270px;
    border-radius: 20px;">
    <div style="height: 30px;"></div>
		<div class="login-comment">
			로그인
		</div>
		<!--  <form action="login/1" method="post" id="login-form"> -->
		<div id="login-form">
			<div class="login-input-box">
				<input type="text" id="login-id" name="id" placeholder="아이디" />
				<input type="password" id="login-pwd" name="pwd" placeholder="비밀번호" />
				<span class="login-input-comment" id="login-input-comment">아이디 또는 비밀번호를 확인해 주세요.</span>
			</div>
			<div class="login-btn-box">
				<button type="button" onclick="login();" id="login-btn">로그인</button>
			</div>
		<!-- </form> -->
		</div>
		<a href="#">
			<span class="login-option">아이디/비밀번호 찾기</span>
		</a>
		<a href="membership">
			 <span class="login-option ml-15">회원가입</span>
		</a>
		
	</div>
	<div style="height: 95px;"></div>
	<jsp:include page="../default/footer.jsp"/>
<script src="${contextPath }/resources/jquery-3.6.0.min.js"></script>
<script src="${contextPath }/resources/member/js/memberScript.js?ver=10"></script>
</body>
</html>