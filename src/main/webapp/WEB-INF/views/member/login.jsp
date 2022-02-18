<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<style type="text/css">
a {	text-decoration: none; }
button:hover { cursor: pointer; }

#login-form {display: flex; justify-content: center; height: 132px;}

.login-input-box {	display: grid;	height: 145px;}

.login-input-box>input {width: 320px; height: 40px;	border: 1px solid white;	border-radius: 4px;	color:gray;}

.login-input-box>input:last-child {	margin-top: 10px; }


#login-btn { width: 326px; height: 40px; border: 1px solid #368AFF; border-radius: 4px; 
			background-color: #368AFF; color: white; font-size: 17px; font-weight: bold;}

#login-btn:hover { cursor: pointer; }

.login-option {	font-size: 12px; color: gray; }

.ml-15 { margin-left: 15px; }

.login{ color: gray; font-size: 27px;	margin-bottom: 40px; font-weight: bold;}
.login-comment {	font-weight: bold;	color: red;	visibility: hidden; font-size: 5px; text-align: left; margin-bottom: 9px;}
</style>
</head>
<body style="width: 1920px; overflow-x: hidden; background-color: black;">

<div style="">
	<div style="text-align: center; background-color: black;width: 563px;
    height: 301px;
    margin: auto;
    margin-top: 270px;
    border-radius: 20px;">
    <div style="height: 30px;"></div>
		<div class="login">
			<a href="${contextPath }/main"><img style="height: 60px;" src="${contextPath }/resources/login/logoblack.png"></a>
		</div>
		<!--  <form action="login/1" method="post" id="login-form"> -->
		<div id="login-form">
			<div class="login-input-box">
				<input type="text" id="logId" name="id" placeholder="아이디" />
				<input type="password" id="logPwd" name="pwd" placeholder="비밀번호" />
				<span class="login-comment" id="login-comment">아이디 또는 비밀번호를 확인해 주세요.</span>
			</div>
		</div>
		<div class="login-btn-box">
				<button type="button" onclick="login();" id="login-btn">로그인</button>
			</div>
			
		<div style="margin-top: 20px; display: flex; justify-content: center;">
		<div >
		<a href="idpwsearch">
			<span class="login-option">아이디/비밀번호 찾기</span>
		</a>
		</div>
		<span style="color:gray; margin-left:15px;">|</span>
		<div>
		<a href="membership">
			 <span class="login-option ml-15">회원가입</span>
		</a>
		</div>
		</div>
		</div>
	</div>

<script src="${contextPath }/resources/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
var blank_pattern1 = /^\s+|\s+$/g; // 공백만 있을 경우
var regType1 = /^[A-Za-z0-9+]*$/;
var regType2 = /^[A-Za-z0-9ㄱ-ㅎ|ㅏ-ㅣ|가-힣+]*$/;
function login() {
	if(document.getElementById("logId").value == "" || document.getElementById("logId").value.replace(blank_pattern1, '') == "") {
	//	alert("아이디를 입력해 주세요.");
		document.getElementById("login-comment").innerText = "아이디를 입력해 주세요.";
		$("#login-comment").css("visibility", "visible");
		document.getElementById("logId").focus();
		return;
	}
	if(document.getElementById("logId").value.length > 12 || 4 > document.getElementById("logId").value.length) {
	//	alert("아이디는 4~12자 사이로 입력해 주세요.");
		document.getElementById("login-comment").innerText = "아이디는 4~12자 사이로 입력해 주세요.";
		$("#login-comment").css("visibility", "visible");
		document.getElementById("logId").focus();
		return;
	}
	if(!(regType1.test(document.getElementById("logId").value))) {
	//	alert("아이디에 한글, 특수문자는 입력하실 수 없습니다.");
		document.getElementById("login-comment").innerText = "아이디에 한글, 특수문자는 입력하실 수 없습니다.";
		$("#login-comment").css("visibility", "visible");
		document.getElementById("logId").focus();
		return;
	}
	if(document.getElementById("logPwd").value == "") {
	//	alert("비밀번호를 입력해 주세요.");
		document.getElementById("login-comment").innerText = "비밀번호를 입력해 주세요.";
		$("#login-comment").css("visibility", "visible");
		document.getElementById("logPwd").focus();
		return;
	}
	if(document.getElementById("logPwd").value.length > 16 || document.getElementById("logPwd").value.length < 8) {
	//	alert("비밀번호는 8~16사 사이로 입력해 주세요.");
		document.getElementById("login-comment").innerText = "비밀번호는 8~16사 사이로 입력해 주세요.";
		$("#login-comment").css("visibility", "visible");
		document.getElementById("logPwd").focus();
		return;
	}
	// document.getElementById("login-form").submit();
	
	var logId = document.getElementById("logId").value;
	var logPwd = document.getElementById("logPwd").value;
	var form = {id:logId, pwd:logPwd};
	$.ajax({
		url: "loginChk", type: "post", data: JSON.stringify(form), dataType: "json", contentType : "application/json; charset=utf-8",
		success: function(map) {
			if(map.login == 0) {
				// alert("아이디 또는 비밀번호를 확인해 주세요.");
				document.getElementById("login-comment").innerText = "아이디 또는 비밀번호를 확인해 주세요.";
				$("#login-comment").css("visibility", "visible");
			} else if(map.login == 1) {
				$("#login-comment").css("visibility", "hidden");
			//	alert("로그인 성공");
				location.href="main";
			} else{
				alert("1")
			}
		}, error : function() {
			alert("에러 발생");
		}
	});
}

</script>
</body>
</html>