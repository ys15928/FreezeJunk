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
			카피봇 차단 설명 <br>
		</div>
		<div>
			인기순 댓글 에서 최대 상위 500개의 댓글들 중 같은 댓글을 찾아 <br>그 중 더 늦게 작성된 댓글들을 삭제하고
			해당 계정을 차단합니다.<br> <br> <br> * 본인 pc의 기본 브라우저에 유튜브 채널의
			계정이 로그인 되어있어야 합니다. <br> <br> 1. 동영상의 URL 입력<br> 2. <img
				src="${contextPath }/resources/image/logo_light_smallest.png" /> 클릭<br>
			3. 유튜브 댓글 수정 및 유튜브 계정 보기 권한 승인<br> 4. 처리 완료 창을 닫고 처리결과 확인 <br>
			<br> 댓글이 과하게 많은 경우 할당량의 문제가 발생할 수 있기 때문에<br> 시간순이 아닌 인기순으로
			댓글들을 크롤링합니다.<br>(모든 댓글에 대해 삭제를 진행 하는 것이 아닙니다.)<br> <br>
			삭제될 댓글이 없는 경우 권한 부여 창이 뜨지 않습니다.<br> 쿠키가 차단되어 있는 브라우저의 경우 로그인
			과정에서 에러가 발생합니다.<br> 쿠키를 허용해 주세요.<br> <a
				href="https://support.google.com/accounts/answer/61416?hl=ko&co=GENIE.Platform%3DDesktop&oco=0"
				style="color: #368AFF" target="_blank">쿠키허용 방법 보기</a>
		</div>
		<div class="modalfooter">
			<button type="button" class="modalbtn" id="cl" onclick="cl()">닫기</button>
		</div>
	</div>

	<jsp:include page="../default/header.jsp" />
	<div class="container">
		<div class="wrapcopy">
			<form action="./" method="post" id="form">
				<div class="form-box">
					<div class="head-box">
						<div class="head-text1">유튜브 URL을 입력해주세요 !</div>
						<br>
						<div class="head-text2">해당 영상의 인기댓글 최대 상위 500개 중 댓글을 복사한 봇의
							계정을 차단하고 댓글을 삭제해드립니다</div>
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
							placeholder="&nbsp; URL 입력" /> <span class="search-img-box">
							<img src="${contextPath }/resources/image/logo_light_small.png"
							onmouseover="this.src='${contextPath }/resources/image/logo_dark_small.png'"
							onmouseout="this.src='${contextPath }/resources/image/logo_light_small.png'"
							onclick="loginsession();" />
						</span>
					</div>
				</div>
			</form>

			<br> <br>
			<p align="center">
				<iframe width="560" height="315"
					src="https://www.youtube.com/embed/q00DbRKVJrY"
					title="YouTube video player" frameborder="0"
					allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
					allowfullscreen></iframe>
			</p>
		</div>

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
				copyCommentFreeze(channelId);
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