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
	href="${contextPath }/resources/login/idpw_searchStyle.css" />

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap"
	rel="stylesheet">
</head>
<body>
	<c:if test="${loginUser != null }">
		<script>
			alert("이미 로그인 된 상태입니다.");
			location.href = "main";
		</script>
	</c:if>
	<jsp:include page="../default/header.jsp" />

	<div class="mainheight100"></div>
	<div class="checklogin">
		<div>
			<div>
				<div class="checkheader">
					<a href="${contextPath }/"><img class="checkimg"
						src="${contextPath }/resources/login/logo.png"></a>
					<p class="checkcolor">인증된 이메일만 정보 찾기가 가능합니다 :)</p>
				</div>
				<div class="checkidpw_chk">
					<div>
						<input type="button" class="searchbtn idsearchbtn" id="search_1"
							name="search_total1" onClick="search_check1();" value="아이디 찾기" />
					</div>
					<div>
						<input type="button" class="searchbtn pwsearchbtn" id="search_2"
							name="search_total2" onClick="search_check2();" value="비밀번호 찾기" />
					</div>
				</div>

				<div id="searchI" class="checksearchid">
					<div class="search">아이디 찾기</div>

					<div class="checkmargin20"></div>
					<div>
						<label class="label" for="inputName_1">이름</label>

						<div class="checkmargin10"></div>
						<input type="text" class="input" id="inputName_1"
							name="inputName_1" placeholder="ex) 프리즈">
					</div>

					<div class="checkmargin10"></div>
					<label class="label" for="inputEmail_1">이메일</label>

					<div class="checkmargin10"></div>
					<input type="text" class="input" id="inputEmail_1"
						name="inputEmail_1" placeholder="ex) E-mail@gmail.com">

					<div class="checkmargin25"></div>
					<div>
						<button id="searchBtn1" type="button" class="yesbtn"
							onclick="idSearch_click();">확인</button>
					</div>
				</div>

				<div id="searchP" class="checksearchpw">
					<div class="search">비밀번호 찾기</div>

					<div class="checkmargin20"></div>
					<div class="">
						<label class="label" for="inputId_2">아이디</label>

						<div class="checkmargin10"></div>
						<input type="text" class="input" id="inputId_2" name="inputId_2"
							placeholder="ex) freeze">

						<div class="checkmargin25"></div>
						<label class="label" for="inputEmail_2">이메일</label>

						<div class="checkmargin10"></div>
						<input type="email" class="input" id="inputEmail_2"
							name="inputEmail_2" placeholder="ex) E-mail@gmail.com">

						<div class="checkmargin25"></div>
						<div>
							<button id="searchBtn2" type="button" class="yesbtn" onclick="">확인</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div id="background_modal" class="idpwmodal1 checkloginmodal">
		<div class="chkmodalpull">
			<div>
				<br>
			</div>
			<div class="chkmodalsearch">
				<span id="id_value" class="chkmodalspan"></span>
			</div>

			<div class="checkmargin25"></div>
			<div>
				<br> <input type="button" id="clo" class="chkbtn"
					onclick="clo();" value="닫기" />

			</div>
		</div>
	</div>
	<div class="mainheight100"></div>

	<jsp:include page="../default/footer.jsp" />
	<script src="${contextPath }/resources/jquery-3.6.0.min.js"></script>
	<script src="${contextPath }/resources/login/idpw_searchScript.js"></script>
</body>
</html>