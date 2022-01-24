<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="<%=request.getContextPath() %>"/>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.join-wrap {display: flex;	justify-content: center; }

.join-header {	text-align: center;	font-size: 24px; color: gray; margin-left: 320px;}

.join-box {	width: 1000px; height: 600px;}

.freeze{ text-align: center;    font-size: 30px;    color: white;    padding-bottom: 10px;    margin-bottom: 25px; }

.input{ background-color: white; width: 300px; height: 25px; border: 1px solid white; border-bottom: 2px solid red; }

.th{ color:gray; }

.chkbtn{ border: 1px solid red; height: 30px; border-radius: 15px; }

.memberbtn{ border: 1px solid red; width: 313px; margin-left: 50px; height: 40px; border-radius: 7px;}

.trnum{ height: 15px; }



</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body style="background-color: black;">
	<div class="join-box" id="join-member" style="margin: auto; margin-top: 0px;">
			<form action="membership" method="post" id="form">
				<div class="freeze">FreezeJunk</div>
				<div style="background-color: #EAEAEA; padding: 33px 8px; border-radius: 27px; width: 770px; margin: auto;">
				<div style="display: flex;  align-items: center;">
				<div><img style="width: 20px;" src="${contextPath }/resources/login/back.jpg"></div>
				<div class="join-header">회원가입</div>
				</div>
				<table border="1px" style="margin:auto; text-align:left;">
					<tr style="height: 45px;">
					<th class="th">아이디</th>
					</tr>
					
					<tr>
					<th><input class="input" type="text" name="id" id="id" onchange="memberIdChange();" placeholder="아이디"/></th>
					<td><button class="chkbtn" type="button" onclick="idCheck();">중복확인</button></td>
					</tr>
					
					<tr class="trnum"></tr>
					
					<tr style="height: 45px;">
					<th class="th">비밀번호</th>
					</tr>
					
					<tr>
					<th><input class="input" type="password" name="pwd" id="pwd" placeholder="비밀번호"/></th>
					<td></td>
					</tr>
					
					<tr class="trnum"></tr>
					
					<tr style="height: 45px;">
					<th class="th">비밀번호 확인</th>
					</tr>
					
					<tr>
					<th><input class="input" type="password" id="repwd" placeholder="비밀번호 확인"/></th>
					<td></td>
					</tr>
					
					<tr class="trnum"></tr>
					
					<tr style="height: 45px;">
					<th class="th">이름</th>
					</tr>
					
					<tr>
					<th><input class="input" type="text" name="name" id="name" placeholder="이름"/></th>
					<td></td>
					</tr>
					
					<tr class="trnum"></tr>
					
					<tr style="height: 45px;">
					<th class="th">이메일</th>
					</tr>
					
					<tr>
					<th><input class="input" type="text" onchange="emailChange();" name="email" id="email" placeholder="이메일"/></th>
					<td><button class="chkbtn" type="button" onclick="emailCheck();">중복확인</button></td>
					</tr>
					
					<tr class="trnum"></tr>
					
					<tr style="height: 45px;">
					<th class="th">인증번호</th>
					</tr>
					
					<tr>
					<th><input class="input" type="text" name="" id="" placeholder="인증번호"/></th>
					<td><button class="chkbtn" type="button" onclick="emailCheck();">인증번호 전송</button></td>
					</tr>
					
					<tr class="trnum"></tr>
					
					<tr>
					<td colspan="2">
					<button type="button" class="memberbtn" onclick="register();">회원가입</button>
					</td>
					<td></td>
					</tr>
					
				</table>
				
		<!--  		
				<div class="member-body">
					<div>
						<div class="member-input-box">
							<div class="member-input-flex">
								<div class="member-input-comment">아이디</div>
								<div class="member-input"><input type="text" name="id" id="id" onchange="memberIdChange();"/></div>
								<input type="hidden" value="" id="idcheck"/>
								<input type="hidden" value="" id="idCk"/>
							</div>
							<div class="member-input-check">
								<button type="button" onclick="idCheck();">중복확인</button>
							</div>
						</div>
						<div class="member-comment" id="id-comment">아이디를 입력해주세요.</div>
						
						
						<div class="member-input-box">
							<div class="member-input-comment">비밀번호</div>
							<div class="member-input"><input type="password" name="pwd" id="pwd"/></div>
						</div>
						<div class="member-comment" id="pwd-comment">비밀번호를 입력해주세요.</div>
						<div class="member-input-box">
							<div class="member-input-comment">비밀번호 확인</div>
							<div class="member-input"><input type="password" id="repwd"/></div>
						</div>
						<div class="member-comment" id="repwd-comment">비밀번호를 입력해주세요.</div>
						
						
						<div class="member-input-box">
							<div class="member-input-comment">이름</div>
							<div class="member-input"><input type="text" name="name" id="name"/></div>
						</div>
						<div class="member-comment" id="name-comment">이름을 입력해주세요.</div>
						
						
						<div class="member-input-box">
							<div class="member-input-flex">
								<div class="member-input-comment">이메일</div>
								<div class="member-input"><input type="text" onchange="emailChange();" name="email" id="email"/></div>
								<input type="hidden" id="emailcheck" value=""/>
								<input type="hidden" id="emailCk" value=""/>
							</div>
							<div class="member-input-check">
								<button type="button" onclick="emailCheck();">중복확인</button>
							</div>
						</div>
						<div class="member-comment" id="email-comment">이메일을 입력해주세요.</div>
						
						
						<div class="member-input-box">
							<div class="member-input-flex">
								<div class="member-input-comment">인증번호</div>
								<div class="member-input"><input type="text" name="" id=""/></div>
							</div>
							<div class="member-input-check">
								<button type="button" onclick="emailCheck();">인증번호 전송</button>
							</div>
						</div>
						<div class="member-comment" id="email-num-comment">인증번호 입력해주세요.</div>
					</div>
				</div>
				<div class="join-footer">
					<button type="button" onclick="memberBack();">이전</button>
					<button type="button" style="width: 261px; margin-left: 50px;"onclick="register();">회원가입</button>
				</div>
				 -->
			</form>
		</div>
	</div>
<script type="text/javascript">
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

</script>	
	
</body>
</html>