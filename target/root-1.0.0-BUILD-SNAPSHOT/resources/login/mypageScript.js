var blank_pattern1 = /^\s+|\s+$/g; // 공백만 있을 경우
var regType1 = /^[A-Za-z0-9+]*$/;

/*
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
*/

/*
var certifiedNum = "";
function emaildel() {
	if(confirm("정말로 탈퇴하시겠습니까?")) {
		$.ajax({
			url : "emaildel",
			type : "GET",
			dataType : "json",
			success : function(list) {
			//	$("#email-modal").css('display', 'block');
				certifiedNum = list[0];
			//	TimerStart();
				
			}, error : function() {
				alert("문제 발생");
			}
		})
	}
}*/

function emaildel(){
	if(confirm("정말로 탈퇴하시겠습니까?")){
		document.getElementById("exiddelete").submit();
	}
}

function iddelete() {
/*	if(SetTime < 0) {
	//	alert("인증 시간이 지났습니다. 창 종료후 다시 진행해주세요.");
		document.getElementById("chk-comment").innerText = "인증 시간이 지났습니다. 창 종료후 다시 진행해주세요.";
		$("#chk-comment").css("visibility", "visible");
		return;
	}
	if(document.getElementById("certified").value == "" || document.getElementById("certified").value.replace(blank_pattern1, '') == "") {
	//	alert("인증번호를 입력해 주세요.");
		document.getElementById("chk-comment").innerText = "인증번호를 입력해 주세요.";
		$("#chk-comment").css("visibility", "visible");
		document.getElementById("certified").focus();
		return;
	}
	if(document.getElementById("certified").value != certifiedNum) {
	//	alert("인증번호가 틀립니다.");
		document.getElementById("chk-comment").innerText = "인증번호가 틀립니다.";
		$("#chk-comment").css("visibility", "visible");
		return;
	}*/
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
	}
	
	else{
		document.getElementById("pwd-comment").innerText = "올바르게 입력하셨습니다.";
		$("#pwd-comment").css("visibility", "visible");
		$("#pwd-comment").css("color", "#368AFF");
	}
	
	if(document.getElementById("pwd").value != document.getElementById("repwd").value) {
		document.getElementById("repwd-comment").innerText = "비밀번호가 일치하지 않습니다.";
		$("#repwd-comment").css("visibility", "visible");
		document.getElementById("repwd").focus();
		
		return;
	}
	
	else{
		document.getElementById("repwd-comment").innerText = "비밀번호가 일치합니다.";
		$("#repwd-comment").css("visibility", "visible");
		$("#repwd-comment").css("color", "#368AFF");
	}
	
	if(document.getElementById("name").value == "" || document.getElementById("name").value.replace(blank_pattern1, '') == "") {
		document.getElementById("name-comment").innerText = "닉네임을 입력해 주세요.";
		$("#name-comment").css("visibility", "visible");
		document.getElementById("name").focus();
		
		return;
	}
	
	if(document.getElementById("name").value.length > 12 || 2 > document.getElementById("name").value.length) {
		document.getElementById("name-comment").innerText = "닉네임을 2~12자 사이로 입력해 주세요.";
		$("#name-comment").css("visibility", "visible");
		document.getElementById("name").focus();
		
		return;
	}
	
	document.getElementById("modi").submit()
}