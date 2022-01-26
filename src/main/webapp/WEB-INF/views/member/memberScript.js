var blank_pattern1 = /^\s+|\s+$/g; // 공백만 있을 경우
var regType1 = /^[A-Za-z0-9+]*$/;
var regType2 = /^[A-Za-z0-9ㄱ-ㅎ|ㅏ-ㅣ|가-힣+]*$/;
var reg_email = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/; // 이메일 체크


/* ------------------------ membership.jsp -------------------------------------- */
function next() {
	var check1_stat = document.getElementById('option1').checked;
	var check2_stat = document.getElementById('option2').checked;
	if(!(check1_stat)) {
		alert("약관에 동의해주세요.")
		return;
	}
	if(!(check2_stat)) {
		alert("약관에 동의해주세요.");
		return;
	}
	$("#join-box").css('display', 'none');
	$("#join-member").css("display", "block");
}

function memberBack() {
	$("#option1").prop("checked", false);
	$("#option2").prop("checked", false);
	$("#join-member").css("display", "none");
	$("#join-box").css('display', 'block');
}

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
					alert("중복된 ID입니다.");
					document.getElementById("id-comment").innerText = "중복된 ID입니다.";
					$("#id-comment").css("visibility", "visible");
				}else{
					alert("사용 가능한 ID입니다.");
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
					alert("중복된 이메일입니다.");
					document.getElementById("email-comment").innerText = "중복된 이메일입니다.";
					$("#email-comment").css("visibility", "visible");
				}else{
					alert("사용 가능한 이메일입니다.");
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
	if(document.getElementById("name").value.length > 6 || 2 > document.getElementById("name").value.length) {
		document.getElementById("name-comment").innerText = "이름은 2~6자 사이로 입력해 주세요.";
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
	if(document.getElementById("department").value == "") {
		$("#department-comment").css("visibility", "visible");
		$("#department-comment").css("color", "red");
		document.getElementById("department").focus();
		return;
	}
	$("#department-comment").css("visibility", "hidden");
	if(document.getElementById("emailCk").value == "") {
		document.getElementById("email-comment").innerText = "이메일 중복확인을 진행해 주세요.";
		$("#email-comment").css("visibility", "visible");
		$("#email-comment").css("color", "red");
		document.getElementById("email").focus();
		return;
	}
	$("#email-comment").css("visibility", "hidden");
	document.getElementById("form").submit();
}

/* --------------------------- login.jsp -------------------------------------------------------------------------- */
function login() {
	if(document.getElementById("login-id").value == "" || document.getElementById("login-id").value.replace(blank_pattern1, '') == "") {
		alert("아이디를 입력해 주세요.");
		document.getElementById("login-id").focus();
		return;
	}
	if(document.getElementById("login-id").value.length > 12 || 4 > document.getElementById("login-id").value.length) {
		alert("아이디는 4~12자 사이로 입력해 주세요.");
		document.getElementById("login-id").focus();
		return;
	}
	if(!(regType1.test(document.getElementById("login-id").value))) {
		alert("아이디에 한글, 특수문자는 입력하실 수 없습니다.");
		document.getElementById("login-id").focus();
		return;
	}
	if(document.getElementById("login-pwd").value == "") {
		alert("비밀번호를 입력해 주세요.");
		document.getElementById("login-pwd").focus();
		return;
	}
	if(document.getElementById("login-pwd").value.length > 16 || document.getElementById("login-pwd").value.length < 8) {
		alert("비밀번호는 8~16사 사이로 입력해 주세요.");
		document.getElementById("login-pwd").focus();
		return;
	}
	// document.getElementById("login-form").submit();
	
	var loginId = document.getElementById("login-id").value;
	var loginPwd = document.getElementById("login-pwd").value;
	var form = {id:loginId, pwd:loginPwd};
	$.ajax({
		url: "login/1", type: "post", data: JSON.stringify(form), dataType: "json", contentType : "application/json; charset=utf-8",
		success: function(map) {
			if(map.login == 0) {
				// alert("아이디 또는 비밀번호를 확인해 주세요.");
				$("#login-input-comment").css("visibility", "visible");
			} else if(map.login == 1) {
				$("#login-input-comment").css("visibility", "hidden");
				alert("가입 승인까지 기달려주세요 !");
			} else if(map.login == 2) {
				alert("로그인 되었습니다.");
				location.href="user/home";
			}else if(map.login == 3) {
				alert("관리가 계정 로그인입니다.");
				location.href="admin/userlist";
			} else {
				alert("에러 발생");
			}
		}, error : function() {
			alert("에러 발생");
		}
	});
}
