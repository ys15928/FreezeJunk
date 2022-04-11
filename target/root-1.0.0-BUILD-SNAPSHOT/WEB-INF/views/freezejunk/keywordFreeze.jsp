<%@page import="com.care.root.member.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image⁄x-icon"
	href="${contextPath }/resources/login/icon.png">
<title>FreezeJunk</title>
<link rel="stylesheet"
	href="${contextPath }/resources/freezejunk/freezejunkStyle.css" />

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap"
	rel="stylesheet">

</head>
<body>
	<div class="modalcenter modalwrap" id="insmodal">
		<div class="modalheader">
			키워드 삭제 설명 <br>
		</div>
		<div>
			기존 Youtube Studio에서는 차단된 단어를 설정할 경우 차단 설정 이후의 댓글은<br> 보이지 않게 되지만
			기존에 달았던 댓글은 삭제되지 않습니다.<br> 댓글 삭제를 원할 경우 직접 하나씩 삭제를 해야합니다. <br>
			<br> FreezeJunk를 이용할 경우, 키워드를 입력(여러 개 입력 가능)하고,<br> 인기순
			댓글에서 키워드를 포함하는 댓글들을 모두 삭제합니다.<br>(차단된 단어 설정을 해주지는 않습니다.) <br>
			<br> * 본인 pc의 기본 브라우저에 유튜브 채널의 계정이 로그인 되어있어야 합니다. <br> <br>
			1. 동영상의 URL 입력<br> 2. 삭제하고자 하는 키워드를 입력(입력한 키워드가 여러 개일 경우 쉼표로 구분)<br>
			3. <img src="${contextPath }/resources/image/logo_light_smallest.png"/> 클릭<br> 4. 유튜브 댓글 수정 및 유튜브 계정 보기 권한 승인<br> 5. 처리 완료 창을
			닫고 처리결과 확인 <br> <br> <span class="modalspan">쉼표 구분과
				키워드 설정 실수에 의한 댓글 삭제는 책임지지 않습니다.</span><br> 댓글이 과하게 많은 경우 할당량의 문제가 발생할
			수 있기 때문에<br> 시간순이 아닌 인기순으로 댓글들을 크롤링합니다.<br>(모든 댓글에 대해 삭제를
			진행 하는 것이 아닙니다.)<br> <br> 삭제될 댓글이 없는 경우 권한 부여 창이 뜨지 않습니다.<br>
			쿠키가 차단되어 있는 브라우저의 경우 로그인 과정에서 에러가 발생합니다.<br> 쿠키를 허용해 주세요.<br>
			<a
				href="https://support.google.com/accounts/answer/61416?hl=ko&co=GENIE.Platform%3DDesktop&oco=0"
				style="color: #368AFF" target="_blank">쿠키허용 방법 보기</a>
		</div>
		<div class="modalfooter">
			<button type="button" class="modalbtn" id="cl" onclick="cl()">닫기</button>
		</div>
	</div>

	<jsp:include page="../default/header.jsp" />
	<div class="container">
		<div class="wrap">
			<form action="./" method="post" id="form">
				<div class="form-box">
					<div class="head-box">
						<div class="head-text1">유튜브 URL과 삭제하고자 하는 키워드를 입력 해주세요!</div>
						<br>
						<div class="head-text2">해당 영상의 댓글들 중 입력하신 키워드를 포함하는 댓글들을 삭제해
							드립니다.</div>
					</div>

					<div class="inswrap">
						<div>
							사용 전 설명서를 클릭하여 <span class="insspan">필독</span> 부탁드립니다.
						</div>
						<div>
							<button type="button" onclick="instruction()" id="ins"
								class="insbtn">설명서 보기</button>
						</div>
					</div>
					<br> <br>

					<div class="search-box">
						<input type="text" class="search" id="videoUrl" name="videoUrl"
							placeholder="&nbsp; URL 입력" /> 
							<span class="search-img-box">
								<img src="${contextPath }/resources/image/logo_light_small.png"
								onmouseover="this.src='${contextPath }/resources/image/logo_dark_small.png'"
								onmouseout="this.src='${contextPath }/resources/image/logo_light_small.png'"
								onclick="loginsession();" />
							</span>
					</div>

					<div class="keywords-box">
						<textarea name="keywords" class="keywords-search" id="keywords"
							placeholder="&nbsp; 키워드 입력(여러 개를 입력할 경우 쉼표로 구분해 주세요.)"></textarea>
					</div>
				</div>
			</form>

			<br> <br>
			<p align="center">
				<iframe width="560" height="315"
					src="https://www.youtube.com/embed/D6Pq3Gpv_d0"
					title="YouTube video player" frameborder="0"
					allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
					allowfullscreen></iframe>
			</p>
		</div>
		<br> <br>

		<div id='mask'
			style='position: absolute; z-index: 5000; background-color: #000000; display: none;'></div>
		<div id='loadingImg'>
			<img src='${contextPath }/resources/image/Spinner.gif'
				style='position: absolute; left: 50%; top: 50%; transform: translate(-50%, -50%); display: block;' />
		</div>
	</div>

	<jsp:include page="../default/footer.jsp" />

	<script type="text/javascript">
	<%MemberDTO dto = (MemberDTO) session.getAttribute("loginUser");

// ctrl+shift+f로 라인 정리시 var session = uid 뒤 작은따옴표와 세미콜론 줄바뀜 되어 실행 안되는 현상 생김
String uid = null;
if (dto != null) {
	uid = dto.getId();
}%>
	const session = '<%=uid%>';
	const channelId = "${loginUser.channelid }";
	
		function loginsession() {
			if (session != "null") {
				keywordFreeze(channelId);
			} else {
				alert("로그인 후 이용해주세요.")
				location.href = "${contextPath}/login";
			}
		}
	</script>

	<script src="https://apis.google.com/js/api.js"></script>
	<script src="${contextPath }/resources/freezejunk/obfuscated.js"></script>
	<script src="${contextPath }/resources/jquery-3.6.0.min.js"></script>
</body>
</html>