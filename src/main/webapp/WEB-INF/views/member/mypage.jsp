<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<c:set var="contextPath" value="<%=request.getContextPath() %>"/>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">

	.input{ width:500px; height: 50px; }
	.btn{ width:500px; height: 50px; }
	.comment{ visibility: hidden; color:red; font-weight: bold; font-size: 10px; }
</style>
<meta charset="UTF-8">
<title>마이페이지</title>
</head>
<body style="width: 1920px; overflow-x: hidden;">
<jsp:include page="../default/header.jsp"/>

<div style="display: flex; margin-top: 129px; justify-content: center; height: 500px;">
<form action="myupdate" method="post" id="modi">
	<table border="1px">
		<tr><th>아이디</th></tr>
		<tr><td><input type="text" id="id" name="id" class="input" value="${loginUser.id }" readonly="readonly"></td></tr>
		<tr><td><div class="comment">비밀번호를 입력해 주세요.</div></td></tr>
		<tr><th>비밀번호</th></tr>
		<tr><td><input type="text" id="pwd" name="pwd" class="input" placeholder="비밀번호"></td></tr>
		<tr><td><div class="comment" id="pwd-comment">비밀번호를 입력해 주세요.</div></td></tr>
		<tr><th>비밀번호 확인</th></tr>
		<tr><td><input type="text" id="repwd" name="repwd" class="input" placeholder="비밀번호 확인"></td></tr>
		<tr><td><div class="comment" id="repwd-comment">비밀번호가 일치하지 않습니다.</div></td></tr>
		<tr><th>이름</th></tr>
		<tr><td><input type="text" id="name" name="name" class="input" value="${loginUser.name }"></td></tr>
		<tr><td><div class="comment" id="name-comment">이름을 입력해 주세요.</div></td></tr>
		<tr><th>이메일</th></tr>
		<tr><td><input type="text" id="email" name="email" class="input" value="${loginUser.email }" readonly="readonly"></td></tr>
		<tr><td><div class="comment">비밀번호를 입력해 주세요.</div></td></tr>
		<tr><td><button type="button" class="btn" onClick="modify()">회원정보수정</button></td></tr>
		<tr><td><button type="button" class="btn" onClick="emaildel()">회원탈퇴</button></td></tr>
	</table>
	</form>
</div>

<div style="" id="email-modal">
<div>로고</div>
<div>등록된 회원 이메일로 인증번호를 보냈습니다.<br>인증번호를 입력하시고 탈퇴 버튼을 누르면 탈퇴가 완료됩니다.</div><br>
<div style="display: flex;">
<div>인증번호 : <input type="text" id="" name=""></div>
<div><span id="time">&nbsp;&nbsp;3 : 0&nbsp;&nbsp;</span><button type="button" onclick="iddelete()">탈퇴하기</button></div>
</div>
<div><br>*인증번호를 받지 못했다면 이메일주소를 확인하세요.</div>
<div>*또는 관리자에게 문의 바랍니다.</div>
</div>

<jsp:include page="../default/footer.jsp"/>
<script src="${contextPath }/resources/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
var blank_pattern1 = /^\s+|\s+$/g; // 공백만 있을 경우
var regType1 = /^[A-Za-z0-9+]*$/;

var certifiedNum = "";
function iddelete(){
	if(confirm("회원탈퇴를 진행하시겠습니까?")){
		$.ajax({
			url : "iddelete", type : "GET", dataType : "json",
			success : function(list){
				$("#email-modal").css('display', 'block');
				certifiedNum = list[0];
				TimerStart();
			}, error : function(){
				alert("문제 발생");
			}
		})
	}
}

function modify(){
	if(document.getElementById("pwd").value == "" || document.getElementById("pwd").value.replace(blank_pattern1, '') == "") {
		document.getElementById("pwd-comment").innerText = "비밀번호를 입력해 주세요.";
		$("#pwd-comment").css("visibility", "visible");
		document.getElementById("pwd").focus();
		return;
	}
	if(document.getElementById("pwd").value.length > 16 || 8 > document.getElementById("pwd").value.length) {
		document.getElementById("pwd-comment").innerText = "비밀번호는 8~16자 사이로 입력해 주세요.";
		$("#pwd-comment").css("visibility", "visible");
		document.getElementById("pwd").focus();
		return;
	}else{
		document.getElementById("pwd-comment").innerText = "올바르게 입력하셨습니다.";
		$("#pwd-comment").css("visibility", "visible");
		$("#pwd-comment").css("color", "blue");
	}
	
	if(document.getElementById("pwd").value != document.getElementById("repwd").value) {
		document.getElementById("repwd-comment").innerText = "비밀번호가 일치하지 않습니다.";
		$("#repwd-comment").css("visibility", "visible");
		document.getElementById("repwd").focus();
		return;
	}else{
		document.getElementById("repwd-comment").innerText = "비밀번호가 일치합니다.";
		$("#repwd-comment").css("visibility", "visible");
		$("#repwd-comment").css("color", "blue");
	}
	
	if(document.getElementById("name").value == "" || document.getElementById("name").value.replace(blank_pattern1, '') == "") {
		document.getElementById("name-comment").innerText = "이름을 입력해 주세요.";
		$("#name-comment").css("visibility", "visible");
		document.getElementById("name").focus();
		return;
	}
	if(document.getElementById("name").value.length > 12 || 2 > document.getElementById("name").value.length) {
		document.getElementById("name-comment").innerText = "이름을 2~12자 사이로 입력해 주세요.";
		$("#name-comment").css("visibility", "visible");
		document.getElementById("name").focus();
		return;
	}
	document.getElementById("modi").submit()
}
</script>
</body>
</html>