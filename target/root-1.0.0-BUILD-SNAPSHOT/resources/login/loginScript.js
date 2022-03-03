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
			if(map.login == 0 || map.login == 2) {
				// alert("아이디 또는 비밀번호를 확인해 주세요.");
				document.getElementById("login-comment").innerText = "아이디 또는 비밀번호를 확인해 주세요.";
				$("#login-comment").css("visibility", "visible");
			} else if(map.login == 1) {
				$("#login-comment").css("visibility", "hidden");
			//	alert("로그인 성공");
				location.href="main";
			} else{
				alert("에러 발생");
			}
		}, error : function() {
			alert("에러 발생");
		}
	});
}
