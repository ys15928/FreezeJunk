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
<link rel="stylesheet"
	href="${contextPath }/resources/login/mypageStyle.css" />

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap"
	rel="stylesheet">

</head>
<body>
	<div class="container">
		<jsp:include page="../default/header.jsp" />
		<div class="mywrap">
			<div class="my">회원정보</div>
			<div class="myw">
				<form action="myupdate" method="post" id="modi">
					<table>
						<tr>
							<th class="myth2">아이디</th>
						</tr>
						<tr>
							<td><input type="text" id="id" name="id" class="input2"
								value="${loginUser.id }" readonly="readonly"></td>
						</tr>
						<tr>
							<td><div class="comment"></div></td>
						</tr>
						<tr>
							<th class="myth1">비밀번호</th>
						</tr>
						<tr>
							<td><input type="password" id="pwd" name="pwd" class="input1"
								placeholder="비밀번호"></td>
						</tr>
						<tr>
							<td><div class="comment" id="pwd-comment">비밀번호를 입력해
									주세요.</div></td>
						</tr>
						<tr>
							<th class="myth1">비밀번호 확인</th>
						</tr>
						<tr>
							<td><input type="password" id="repwd" name="repwd"
								class="input1" placeholder="비밀번호 확인"></td>
						</tr>
						<tr>
							<td><div class="comment" id="repwd-comment">비밀번호가 일치하지
									않습니다.</div></td>
						</tr>

						<tr>
							<th class="myth2">유튜브 채널 ID</th>
						</tr>
						<tr>
							<td><input type="text" id="channelid" name="channelid" class="input2"
								value="${loginUser.channelid }" readonly="readonly"></td>
						</tr>
						<tr>
							<td><div class="comment"></div></td>
						</tr>

						<tr>
							<th class="myth1">닉네임</th>
						</tr>
						<tr>
							<td><input type="text" id="name" name="name" class="input1"
								value="${loginUser.name }"></td>
						</tr>
						<tr>
							<td><div class="comment" id="name-comment">닉네임을 입력해
									주세요.</div></td>
						</tr>
						<tr>
							<th class="myth2">이메일</th>
						</tr>
						<tr>
							<td><input type="text" id="email" name="email" class="input2"
								value="${loginUser.email }" readonly="readonly"></td>
						</tr>
						<tr>
							<td><div class="comment"></div></td>
						</tr>
						<tr>
							<td><button type="button" class="btn btn1"
									onClick="modify()">회원정보수정</button></td>
						</tr>
						<tr>
							<td><div class="myhe"></div></td>
						</tr>
						<tr>
							<td><button type="button" class="btn btn2"
									onClick="emaildel()">회원탈퇴</button></td>
						</tr>
					</table>
				</form>
			</div>
		</div>

		<form action="iddelete" method="post" id="exiddelete" class="iddelete">
		</form>

		<!--  
<div id="email-modal" class="email-modal">
<form action="iddelete" method="post" id="modal-form">
<div class="mymodalwrap">
<div><img class="myimglogo" src="${contextPath }/resources/login/logo.png"></div>
<div><img class="myimg" src="${contextPath}/resources/login/ba.png" onclick="modalExit()"></div>
</div>
<div class="mymodhea">
<div>등록된 회원 이메일로 인증번호를 보냈습니다.<br>인증번호를 입력하시고 탈퇴 버튼을 누르면 탈퇴가 완료됩니다.</div><br>
<div class="mymodal1">
<div class="mymodal2">
<div class="mymodalnum">인증번호 : &nbsp;</div>
<input class="mymodalinput" type="text" name="certified" id="certified"/>&nbsp;&nbsp;</div>
<div class="mymodaltime">
<div><span id="time"></span>&nbsp;&nbsp;</div>
<div><button type="button" class="xbtn" onclick="iddelete()">탈퇴하기</button></div>
</div>
</div>
<div class="comment" id="chk-comment">인증번호입력해주세요.</div>
<div><br>*인증번호를 받지 못했다면 이메일주소를 확인하세요.</div>
<div>*또는 관리자에게 문의 바랍니다.</div>
</div>
</form>
</div>
-->

		<jsp:include page="../default/footer.jsp" />
	</div>
	<script src="${contextPath }/resources/jquery-3.6.0.min.js"></script>
	<script src="${contextPath }/resources/login/mypageScript.js"></script>
</body>
</html>