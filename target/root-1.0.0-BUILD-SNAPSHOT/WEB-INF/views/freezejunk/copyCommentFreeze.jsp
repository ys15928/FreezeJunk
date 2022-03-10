<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FREEZEJUNK</title>
<link rel="stylesheet"
	href="${contextPath }/resources/freezejunk/freezejunkStyle.css" />
</head>
<body>

	<div class="modalcenter modalwrap" id="insmodal">
		<div class="modalheader">
			<카피봇 차단> <br>
		</div>
		<div>
			인기순 댓글 에서 최대 상위 500개의 댓글들 중 같은 댓글을 찾아 그 중 더 늦게 작성된 댓글들을 삭제합니다.<br>
			<br> <br> * 본인 pc의 기본 브라우저에 유튜브 채널의 계정이 로그인 되어있어야 합니다. <br>
			<br> 1. 동영상의 URL 입력<br> 3. 돋보기(Search) 버튼을 클릭<br> 4.
			유튜브 댓글 수정 권한 부여 승인<br> 5. 처리 완료 창을 닫고 처리결과 확인 <br> <br>
			댓글이 과하게 많은 경우 할당량의 문제가 발생할 수 있기 때문에 시간순이 아닌 인기순으로 댓글들을 크롤링합니다.<br>(모든
			댓글에 대해 삭제를 진행 하는 것이 아닙니다.)<br> 삭제될 댓글이 없는 경우 권한 부여 창이 뜨지 않습니다.<br>
		</div>
		<div class="modalfooter">
			<button type="button" class="modalbtn" id="cl" onclick="cl()">확인</button>
		</div>
	</div>

	<div class="container">
		<jsp:include page="../default/header.jsp" />
		<div class="wrapcopy">
			<form action="./" method="post" id="form">
				<div class="head-box">
					<div class="head-text1">유튜브 URL을 입력해주세요 !</div>
					<div class="head-text2">해당 영상의 인기댓글 최대 상위 500개 중 댓글을 복사한 봇의 계정을
						차단하고 댓글을 삭제해드립니다</div>
				</div>

				<div class="inswrap">
					<div>
						사용 전 설명서 <span class="insspan">필독</span> 부탁드립니다.
					</div>
					<div>
						<button type="button" onclick="instruction()" id="ins"
							class="insbtn">설명서</button>
					</div>
				</div>

				<div class="search-box">
					<input type="text" class="search" id="videoUrl" name="videoUrl"
						placeholder="URL 입력" /> <span class="search-img-box"><img
						src="${contextPath }/resources/image/search_white.png"
						onclick="copyCommentFreeze();" /></span>
				</div>

			</form>
			<div class="video">
				<video controls
					poster="${contextPath }/resources/login/logoblack.png">
					<source src="${contextPath}/resources/freezejunk/jeju.mp4"
						type="video/mp4">
					<strong>Your browser does not support the video tag.</strong>
				</video>
			</div>
		</div>

		<div id='mask'
			style='position: absolute; z-index: 5000; background-color: #000000; display: none;'></div>
		<div id='loadingImg'>
			<img src='${contextPath }/resources/image/Spinner.gif'
				style='position: absolute; left: 50%; top: 50%; transform: translate(-50%, -50%); display: block;' />
		</div>
		<jsp:include page="../default/footer.jsp" />
	</div>
	
	<script src="${contextPath }/resources/jquery-3.6.0.min.js"></script>
	<script src="https://apis.google.com/js/api.js"></script>
	<script src="${contextPath }/resources/freezejunk/obfuscated.js"></script>
</body>
</html>