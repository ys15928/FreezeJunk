<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<c:set var="contextPath" value="<%=request.getContextPath() %>"/>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">

	.input{ width: 430px; height: 50px; font-weight: bold;
    font-size: 18px; color: white; background-color: black; border: none; border-bottom: 1px solid white; }
    
	.btn{ width: 438px; height: 50px; color: white; font-weight: bold; font-size: 20px; border: none; border-radius: 5px;} 
	.btn1{ background-color: #368AFF; }
	.btn2{ background-color: #FF4848; }
	
	.comment{ visibility: hidden; color:red; font-weight: bold; font-size: 10px; }
		
	.th{ text-align: left; height: 33px; color: #BDBDBD; }
	.my{ text-align: center; font-size: 30px; font-weight: bold; color: white; }
	.wrap{width: 1903px; height: 815px; background-color: black; margin-top: 72px; }
	
	.email-modal {position: fixed; top: 50%; left: 50%;	-webkit-transform: translate(-50%, -50%);
		-moz-transform: translate(-50%, -50%);-ms-transform: translate(-50%, -50%);-o-transform: translate(-50%, -50%);
		transform: translate(-50%, -50%);
		display: none; background-color: white; width: 600px; height: 300px; border-radius: 6px; color: black; }
	
	.xbtn{ border: none; color: white; background: #FF4848; width: 71px; height: 22px; border-radius: 2px; font-weight: bold;}
	
</style>
<meta charset="UTF-8">
<title>마이페이지</title>
</head>
<body style="width: 1920px; overflow-x: hidden; background-color: black;">
<jsp:include page="../default/header.jsp"/>
<div class="wrap">
<div class="my">회원정보</div>
<div style="display: flex; justify-content: center; margin-top: 15px; ">
<form action="myupdate" method="post" id="modi">
	<table >
		<tr><th class="th">아이디</th></tr>
		<tr><td class="td"><input type="text" id="id" name="id" class="input" value="${loginUser.id }" readonly="readonly"></td></tr>
		<tr><td><div class="comment">비밀번호를 입력해 주세요.</div></td></tr>
		<tr><th class="th">비밀번호</th></tr>
		<tr><td class="td"><input type="password" id="pwd" name="pwd" class="input" placeholder="비밀번호"></td></tr>
		<tr><td><div class="comment" id="pwd-comment">비밀번호를 입력해 주세요.</div></td></tr>
		<tr><th class="th">비밀번호 확인</th></tr>
		<tr><td class="td"><input type="password" id="repwd" name="repwd" class="input" placeholder="비밀번호 확인"></td></tr>
		<tr><td><div class="comment" id="repwd-comment">비밀번호가 일치하지 않습니다.</div></td></tr>
		<tr><th class="th">이름</th></tr>
		<tr><td class="td"><input type="text" id="name" name="name" class="input" value="${loginUser.name }"></td></tr>
		<tr><td><div class="comment" id="name-comment">이름을 입력해 주세요.</div></td></tr>
		<tr><th class="th">이메일</th></tr>
		<tr><td class="td"><input type="text" id="email" name="email" class="input" value="${loginUser.email }" readonly="readonly"></td></tr>
		<tr><td><div class="comment">비밀번호를 입력해 주세요.</div></td></tr>
		<tr><td><button type="button" class="btn btn1" onClick="modify()">회원정보수정</button></td></tr>
		<tr><td><div style="font-size: 5px; height: 2px;"></div></td></tr>
		<tr><td><button type="button" class="btn btn2" onClick="emaildel()">회원탈퇴</button></td></tr>
	</table>
	</form>
</div>
</div>

<div style="" id="email-modal" class="email-modal">
<form action="iddelete" method="post" id="modal-form">
<div style="display: flex; justify-content: space-between; align-items: center; margin-top: 8px;">
<div><img style="width: 180px; height: 50px;" src="${contextPath }/resources/login/logo.png"></div>
<div><img style="width: 30px; height: 38px; margin-right: 10px;" src="${contextPath}/resources/login/ba.png" onclick="modalExit()"></div>
</div>
<div style="margin-top: 40px; text-align: center; font-weight: bold;">
<div>등록된 회원 이메일로 인증번호를 보냈습니다.<br>인증번호를 입력하시고 탈퇴 버튼을 누르면 탈퇴가 완료됩니다.</div><br>
<div style="display: flex; justify-content: center; align-items: center;">
<div style="display: flex; align-items: center;">
<div style="font-size: 20px; color:#368AFF;; font-weight: bold;">인증번호 : &nbsp;</div>
<input style="height: 17px; margin-left: 5px;border: none; background-color: white; border-bottom: 1px solid black;" type="text" name="certified" id="certified"/>&nbsp;&nbsp;</div>
<div style="display: flex; justify-content: center; align-items: center;">
<div><span id="time"></span>&nbsp;&nbsp;</div>
<div><button type="button" class="xbtn" onclick="iddelete()">탈퇴하기</button></div>
</div>
</div>
<div><br>*인증번호를 받지 못했다면 이메일주소를 확인하세요.</div>
<div>*또는 관리자에게 문의 바랍니다.</div>
</div>
</form>
</div>

<jsp:include page="../default/footer.jsp"/>
<script src="${contextPath }/resources/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
var blank_pattern1 = /^\s+|\s+$/g; // 공백만 있을 경우
var regType1 = /^[A-Za-z0-9+]*$/;


function modalExit() {
	$("#email-modal").css('display', 'none');
	clearInterval(tid);
	certifiedExit();
	document.getElementById("time").innerHTML = "";
}

var SetTime = 180; 
function msg_time() {   // 1초씩 카운트 
    m = Math.floor(SetTime / 60) + " : " + (SetTime % 60); // 남은 시간 계산         
    document.getElementById("time").innerHTML = m;     // div 영역에 보여줌                  
    SetTime--;                  // 1초씩 감소
    if (SetTime < 0) {          // 시간이 종료 되었으면..        
        clearInterval(tid);     // 타이머 해제
    }       
}
function timeChange() {
	SetTime = 180;
}
function TimerStart() {
	timeChange();
	tid=setInterval('msg_time()',1000);
}

var certifiedNum = "";
function emaildel() {
	if(confirm("정말로 탈퇴하시겠습니까?")) {
		$.ajax({
			url : "emaildel",
			type : "GET",
			dataType : "json",
			success : function(list) {
				$("#email-modal").css('display', 'block');
				certifiedNum = list[0];
				TimerStart();
			}, error : function() {
				alert("문제 발생");
			}
		})
	}
}

function iddelete() {
	if(SetTime < 0) {
		alert("인증 시간이 지났습니다. 창 종료후 다시 진행해주세요.");
		return;
	}
	if(document.getElementById("certified").value == "" || document.getElementById("certified").value.replace(blank_pattern1, '') == "") {
		alert("인증번호를 입력해 주세요.");
		document.getElementById("certified").focus();
		return;
	}
	if(document.getElementById("certified").value != certifiedNum) {
		alert("인증번호가 틀립니다.");
		return;
	}
	document.getElementById("modal-form").submit();
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