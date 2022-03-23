<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image⁄x-icon"
	href="${contextPath }/resources/login/icon.png">
<title>FreezeJunk</title>
<style type="text/css"></style>
<link rel="stylesheet"
	href="${contextPath }/resources/login/membershipStyle.css" />

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap"
	rel="stylesheet">

</head>
<body>
	<jsp:include page="../default/header.jsp" />
	<c:if test="${loginUser != null }">
		<script>
			alert("이미 로그인 된 상태입니다.");
			location.href = "main";
		</script>
	</c:if>

	<div class="memberlogin">
		<div class="join-box" id="join-member">
			<form action="memberSuc" method="post" id="form">
				<div class="memberwrap1">
					<div class="mainheight100"></div>
					<div class="join-header">
						<a href="${contextPath }/"><img class="imgheight"
							src="${contextPath }/resources/login/logo.png"></a>
					</div>

					<table class="membertable">
						<tr class="tr45">
							<th class="th">아이디</th>
						</tr>
						<tr>
							<th><input class="input" type="text" name="id" id="id"
								onchange="memberIdChange();" placeholder="아이디" /> <input
								type="hidden" value="" id="idcheck" /> <input type="hidden"
								value="" id="idCk" /></th>
							<td>
								<button class="chkbtn" type="button" onclick="idCheck();">중복확인</button>
							</td>
						</tr>
						<tr class="trnum">
							<td><div class="member-comment" id="id-comment">아이디를
									입력해주세요.</div></td>

						</tr>
						<tr class="tr45">
							<th class="th">비밀번호</th>
						</tr>
						<tr>
							<th><input class="input" type="password" name="pwd" id="pwd"
								placeholder="비밀번호" /></th>
							<td></td>
						</tr>
						<tr class="trnum">
							<td><div class="member-comment" id="pwd-comment">비밀번호를
									입력해주세요.</div></td>
						</tr>


						<tr class="tr45">
							<th class="th">비밀번호 확인</th>
						</tr>
						<tr>
							<th><input class="input" type="password" id="repwd"
								placeholder="비밀번호 확인" /></th>
							<td></td>
						</tr>
						<tr class="trnum">
							<td><div class="member-comment" id="repwd-comment">비밀번호를
									입력해주세요.</div></td>
						</tr>


						<tr class="tr45">
							<th class="th">이름</th>
						</tr>
						<tr>
							<th><input class="input" type="text" name="name" id="name"
								placeholder="이름" /></th>
							<td></td>
						</tr>
						<tr class="trnum">
							<td><div class="member-comment" id="name-comment">이름을
									입력해주세요.</div></td>
						</tr>


						<tr class="tr45">
							<th class="th">이메일</th>
						</tr>
						<tr>
							<th><input class="input" type="text"
								onchange="emailChange();" name="email" id="email"
								placeholder="이메일" /></th>
							<td><button class="chkbtn" type="button"
									onclick="emailCheck();">중복확인</button></td>
						</tr>
						<tr class="trnum">
							<td>
								<div class="member-comment" id="email-comment">이메일을
									입력해주세요.</div> <input type="hidden" id="emailcheck" value="" /> <input
								type="hidden" id="emailCk" value="" />
							</td>
						</tr>


						<!-- 	<tr class="tr45">
					<th class="th">인증번호</th>
					</tr>
					<tr>
					<th><input class="input" type="text" name="emailnum" id="emailnum" placeholder="인증번호"/></th>
					<td><button class="chkbtn" type="button" onclick="emailgoNum();">인증번호 전송</button></td>
					</tr>
					<tr class="trnum">
					<td><div class="member-comment" id="email-num-comment">인증번호 입력해주세요.</div></td>
					</tr>
			 -->

						<tr>
							<td colspan="2">
								<button type="button" class="memberbtn" onclick="register();">회원가입</button>
							</td>
							<td></td>
						</tr>

					</table>
				</div>
			</form>
		</div>
	</div>
	<jsp:include page="../default/footer.jsp" />

	<script src="${contextPath }/resources/jquery-3.6.0.min.js"></script>
	<script src="${contextPath }/resources/login/membershipScript.js"></script>

</body>
</html>