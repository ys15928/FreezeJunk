<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="<%=request.getContextPath() %>"/>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.join-wrap {display: flex;	justify-content: center; }

.join-header {	text-align: center;	font-size: 24px; color: black; margin-bottom: 15px; font-weight: bold;}

.join-box {	width: 1000px; height: 600px;}

.freeze{ text-align: center;    font-size: 30px;    color: white;    padding-bottom: 10px;    margin-bottom: 25px; }

.input{ background-color: white; width: 300px; height: 25px; border: 1px solid white; border-bottom: 2px solid gainsboro; }

.th{ color:black; }

.chkbtn{ border: none; border-bottom: 1px solid black; height: 30px; margin-left: 10px; background-color: white; font-weight: bold; }

.memberbtn{ 
border: 1px solid white; width: 313px; height: 40px; border-radius: 4px; margin-top: 10px; background-color: #368AFF; font-weight: bold;
color: white; font-size: 15px;}

.trnum{ height: 15px; }

.member-comment{ font-size: 10px; color: red; font-weight: bold; visibility: hidden;}

</style>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body style="background-color: black; width: 1920px; overflow-x: hidden;">

<div style="height: 800px;">
	<div class="join-box" id="join-member" style="margin: auto; margin-top: 0px;">
			<form action="memberSuc" method="post" id="form">
				
				<div style="background-color: white; padding: 33px 8px; border-radius: 10px; width: 770px; margin: auto; margin-top:100px;">
				
				<div class="join-header">
				<a href="${contextPath }/main"><img style="height: 60px;" src="${contextPath }/resources/login/logo.png"></a>
				</div>
				
				<table style="margin:auto; text-align:left; margin-left: 225px;">
				
					<tr style="height: 45px;">
					<th class="th">아이디</th>
					</tr>
					<tr>
					<th><input class="input" type="text" name="id" id="id" onchange="memberIdChange();" placeholder="아이디"/>
					<input type="hidden" value="" id="idcheck"/>
								<input type="hidden" value="" id="idCk"/>
					</th>
					<td>
					<button class="chkbtn" type="button" onclick="idCheck();">중복확인</button>
					</td>
					</tr>
					<tr class="trnum">
					<td><div class="member-comment" id="id-comment">아이디를 입력해주세요.</div>			
					</td>
									
					</tr>
					<tr style="height: 45px;">
					<th class="th">비밀번호</th>
					</tr>
					<tr>
					<th><input class="input" type="password" name="pwd" id="pwd" placeholder="비밀번호"/></th>
					<td></td>
					</tr>
					<tr class="trnum"><td><div class="member-comment" id="pwd-comment">비밀번호를 입력해주세요.</div></td></tr>
					
					
					<tr style="height: 45px;">
					<th class="th">비밀번호 확인</th>
					</tr>
					<tr>
					<th><input class="input" type="password" id="repwd" placeholder="비밀번호 확인"/></th>
					<td></td>
					</tr>
					<tr class="trnum"><td><div class="member-comment" id="repwd-comment">비밀번호를 입력해주세요.</div></td></tr>
					
					
					<tr style="height: 45px;">
					<th class="th">이름</th>
					</tr>
					<tr>
					<th><input class="input" type="text" name="name" id="name" placeholder="이름"/></th>
					<td></td>
					</tr>
					<tr class="trnum"><td><div class="member-comment" id="name-comment">이름을 입력해주세요.</div></td></tr>
					
					
					<tr style="height: 45px;">
					<th class="th">이메일</th>
					</tr>
					<tr>
					<th><input class="input" type="text" onchange="emailChange();" name="email" id="email" placeholder="이메일"/></th>
					<td><button class="chkbtn" type="button" onclick="emailCheck();">중복확인</button></td>
					</tr>
					<tr class="trnum">
					<td>	
						<div class="member-comment" id="email-comment">이메일을 입력해주세요.</div>
								<input type="hidden" id="emailcheck" value=""/>
								<input type="hidden" id="emailCk" value=""/>
					</td>
					</tr>
					
					
					<tr style="height: 45px;">
					<th class="th">인증번호</th>
					</tr>
					<tr>
					<th><input class="input" type="text" name="emailnum" id="emailnum" placeholder="인증번호"/></th>
					<td><button class="chkbtn" type="button" onclick="emailgoNum();">인증번호 전송</button></td>
					</tr>
					<tr class="trnum">
					<td><div class="member-comment" id="email-num-comment">인증번호 입력해주세요.</div></td>
					</tr>
					
					
					
					<tr>
					<td colspan="2">
					<button type="button" class="memberbtn" onclick="register();">회원가입</button>
					</td>
					<td></td>
					</tr>
					
				</table>
			</form>
		</div>
	</div>


		
	<script src="${contextPath }/resources/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
var blank_pattern1 = /^\s+|\s+$/g; // 공백만 있을 경우
var regType1 = /^[A-Za-z0-9+]*$/;
var regType2 = /^[A-Za-z0-9ㄱ-ㅎ|ㅏ-ㅣ|가-힣+]*$/;
var reg_email = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
function idCheck() {
	if(document.getElementById("id").value == "" || document.getElementById("id").value.replace(blank_pattern1, '') == "") {
			//alert("아이디를 입력해 주세요.");
			document.getElementById("id-comment").innerText = "아이디를 입력해 주세요.";
			$("#id-comment").css("visibility", "visible");
			document.getElementById("id").focus();
			return;
		}
		
		if(document.getElementById("id").value.length > 8 || 4 > document.getElementById("id").value.length) {
			document.getElementById("id-comment").innerText = "아이디는 4~8글자 사이로 입력해 주세요.";
			$("#id-comment").css("visibility", "visible");
			document.getElementById("id").focus();
			return;
		} 
		if(!(regType1.test(document.getElementById("id").value))) {
			document.getElementById("id-comment").innerText = "아이디에 한글, 특수문자는 입력하실 수 없습니다.";
			$("#id-comment").css("visibility", "visible");
			document.getElementById("id").focus();
			return;
		}
		var id= document.getElementById("id").value
		var form={id:id}
		$.ajax({
			url: "idcheck", type: "post", data: JSON.stringify(form), dataType: "json", contentType : "application/json; charset=utf-8",
			success: function(map){
				if (map.idcheck!= null){
				//	alert("중복된 ID입니다.");
					document.getElementById("id-comment").innerText = "중복된 ID입니다.";
					$("#id-comment").css("visibility", "visible");
				}else{
				//	alert("사용 가능한 ID입니다.");
					document.getElementById("id-comment").innerText = "사용 가능한 ID입니다.";
					$("#id-comment").css("visibility", "visible");
					$("#id-comment").css("color", "blue");
					document.getElementById("idcheck").value = document.getElementById("id").value
					document.getElementById("idCk").value = "1";
				}
			}, error: function(){
				alert("error")
			}
			
		})
}

function memberIdChange() {
	document.getElementById("id-comment").innerText = "ID 중복확인을 진행해 주세요.";
	$("#id-comment").css("visibility", "visible");
	$("#id-comment").css("color", "red");
	document.getElementById("idCk").value = "";
}

function emailCheck() {
		if(document.getElementById("email").value == "" || document.getElementById("email").value.replace(blank_pattern1, '') == "") {
			document.getElementById("email-comment").innerText = "이메일을 입력해 주세요.";
			$("#email-comment").css("visibility", "visible");
			document.getElementById("email").focus();
			return;
		}
		
		if(!(reg_email.test(document.getElementById("email").value))) {
			document.getElementById("email-comment").innerText = "이메일 형식에 맞게 입력해 주세요.";
			$("#email-comment").css("visibility", "visible");
			document.getElementById("email").focus();
			return;
		}
		
		
		if(document.getElementById("email").value.length > 30 || 10 > document.getElementById("email").value.length) {
			document.getElementById("email-comment").innerText = "이메일은 10~30글자 사이로 입력해 주세요.";
			$("#email-comment").css("visibility", "visible");
			document.getElementById("email").focus();
			return;
		}
		
		var email= document.getElementById("email").value
		var form={email:email}
		$.ajax({
			url: "emailcheck", type: "post", data: JSON.stringify(form), dataType: "json", contentType : "application/json; charset=utf-8",
			success: function(map){
				if (map.emailcheck!= null){
			//		alert("중복된 이메일입니다.");
					document.getElementById("email-comment").innerText = "중복된 이메일입니다.";
					$("#email-comment").css("visibility", "visible");
				}else{
			//		alert("사용 가능한 이메일입니다.");
					document.getElementById("email-comment").innerText = "사용 가능한 이메일입니다.";
					$("#email-comment").css("visibility", "visible");
					$("#email-comment").css("color", "blue");
					document.getElementById("emailcheck").value = document.getElementById("email").value
					document.getElementById("emailCk").value = "1";
				}
			}, error: function(){
				alert("error")
			}
			
		})
}
var certifiedNum = null;

function emailgoNum(){
	
	var email= document.getElementById("email").value
	if(document.getElementById("email").value == ""){
		document.getElementById("email-num-comment").innerText = "이메일을 올바르게 입력하세요";
		$("#email-num-comment").css("visibility", "visible");
		return;
	}
	var form={email:email}
	$.ajax({
		url: "emailgoNum", type: "post", data: JSON.stringify(form), dataType: "json", contentType : "application/json; charset=utf-8",
		success: function(map){
				document.getElementById("email-num-comment").innerText = "인증번호를 입력하세요";
				$("#email-num-comment").css("visibility", "visible");
				certifiedNum = map.certified
		}, error: function(){
			alert("error")
		}
})
}

function emailChange() {
	document.getElementById("email-comment").innerText = "이메일 중복확인을 진행해 주세요.";
	$("#email-comment").css("visibility", "visible");
	$("#email-comment").css("color", "red");
	document.getElementById("emailCk").value = "";
}	



function register() {
	if(document.getElementById("idCk").value != "1") {
		document.getElementById("id-comment").innerText = "ID 중복확인을 진행해 주세요.";
		$("#id-comment").css("visibility", "visible");
		$("#id-comment").css("color", "red");
		document.getElementById("id").focus();
		return;
	}
	if(document.getElementById("pwd").value == "") {
		document.getElementById("pwd-comment").innerText = "비밀번호를 입력해 주세요.";
		$("#pwd-comment").css("visibility", "visible");
		$("#pwd-comment").css("color", "red");
		document.getElementById("pwd").focus();
		return;
	}
	if(document.getElementById("pwd").value.length > 16 || document.getElementById("pwd").value.length < 8) {
		document.getElementById("pwd-comment").innerText = "비밀번호는 8~16자 사이로 주세요.";
		$("#pwd-comment").css("visibility", "visible");
		$("#pwd-comment").css("color", "red");
		document.getElementById("pwd").focus();
		return;
	}
	$("#pwd-comment").css("visibility", "hidden");
	if(document.getElementById("pwd").value != document.getElementById("repwd").value) {
		document.getElementById("repwd-comment").innerText = "비밀번호가 일치하지 않습니다.";
		$("#repwd-comment").css("visibility", "visible");
		$("#repwd-comment").css("color", "red");
		document.getElementById("repwd").focus();
		return;
	}
	$("#repwd-comment").css("visibility", "hidden");
	if(document.getElementById("name").value == "" || document.getElementById("name").value.replace(blank_pattern1, '') == "") {
		document.getElementById("name-comment").innerText = "이름을 입력해 주세요.";
		$("#name-comment").css("visibility", "visible");
		$("#name-comment").css("color", "red");
		document.getElementById("name").focus();
		return;
	}
	if(document.getElementById("name").value.length > 10 || 2 > document.getElementById("name").value.length) {
		document.getElementById("name-comment").innerText = "이름은 2 ~ 10자 사이로 입력해 주세요.";
		$("#name-comment").css("visibility", "visible");
		$("#name-comment").css("color", "red");
		document.getElementById("name").focus();
		return;
	}
	if(!(regType2.test(document.getElementById("name").value))) {
		document.getElementById("name-comment").innerText = "이름에 특수문자는 입력하실 수 없습니다.";
		$("#name-comment").css("visibility", "visible");
		$("#name-comment").css("color", "red");
		document.getElementById("name").focus();
		return;
	}
	$("#name-comment").css("visibility", "hidden");
	if(document.getElementById("emailCk").value == "") {
		document.getElementById("email-comment").innerText = "이메일 중복확인을 진행해 주세요.";
		$("#email-comment").css("visibility", "visible");
		$("#email-comment").css("color", "red");
		document.getElementById("email").focus();
		return;
	}
	if(document.getElementById("emailnum").value != certifiedNum){
		document.getElementById("email-num-comment").innerText = "인증번호를 올바르게 입력하세요.";
		$("#email-comment").css("visibility", "visible");
		$("#email-num-comment").css("color", "red");
		document.getElementById("emailnum").focus();
		return;
	}
	$("#email-num-comment").css("visibility", "hidden");
	document.getElementById("form").submit();
}
</script>	
	
</body>
</html>