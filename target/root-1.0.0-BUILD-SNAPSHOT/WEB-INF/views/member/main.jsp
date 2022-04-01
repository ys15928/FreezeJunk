<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>" />
<!DOCTYPE html>
<html>
<head>
<meta name="naver-site-verification"
	content="f7ece45a4f55594768823cfd58a9f1a6567b3dec" />
<meta property="og:type" content="website">
<meta property="og:title" content="프리즈정크">
<meta property="og:description"
	content="영상의 댓글 삭제와 스팸 & 카피봇 계정 차단이 가능합니다. 댓글을 보다 쉽고 효율적으로 관리하세요.">
<meta property="og:url" content="https://freezejunk.com/">
<link rel="canonical" href="https://freezejunk.com/">

<meta charset="UTF-8">
<link rel="shortcut icon" type="image⁄x-icon"
	href="${contextPath }/resources/login/icon.png">
<title>FreezeJunk</title>
<meta name="description"
	content="FreezeJunk는 유튜버의 댓글 관리를 돕는 웹사이트입니다. 보다 쉽고 효율적으로 댓글을 관리하세요.">
<meta name="keywords" content="유튜브, 댓글관리, 카피봇, 댓글봇, 댓글삭제, 계정차단">
<link rel="stylesheet"
	href="${contextPath }/resources/default/mainStyle.css?ver=2" />

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap"
	rel="stylesheet">

</head>

<body>
	<jsp:include page="../default/header.jsp" />
	<div class="container">
		<div class="remain">
			<div class="remaincenter_main">
				<div class="remaincenter_main_content">
					<br>
					<h1>유튜브 댓글을 보다 쉽고 편하게 효율적으로 관리하세요</h1>
					<br>
					<h2>영상의 URL과 키워드 또는 스팸에 등록할 계정을 입력해</h2>
					<br>
					<h2>영상의 댓글 삭제와 스팸 계정 차단, 카피봇 계정 차단까지</h2>
					<br> <br>
				</div>
			</div>
		</div>

		<div class="remain">
			<div class="remaincenter_A">
				<div class="remaincenter_A_content">
					<h2>
						<a href="${contextPath }/keywordFreeze"
							style="text-decoration: none; color: #368AFF"> 키워드 삭제 > </a>
					</h2>
					<br>
					<h3>유튜브 동영상의 URL과 키워드들을 입력하여</h3>
					<br>
					<h3>해당 동영상의 인기순 댓글에서 키워드를 포함하는 댓글들을 모두 삭제합니다.</h3>
					<br> <br>

					<iframe width="560" height="315"
						src="https://www.youtube.com/embed/D6Pq3Gpv_d0"
						title="YouTube video player" frameborder="0"
						allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
						allowfullscreen></iframe>
					<br> <br>
				</div>
			</div>
		</div>

		<div class="remain">
			<div class="remaincenter_B">
				<div class="remaincenter_B_content">
					<h2>
						<a href="${contextPath }/accountFreeze"
							style="text-decoration: none; color: #368AFF"> < 스팸 계정 차단 </a>
					</h2>
					<br>
					<h3>유튜브 동영상의 URL과 차단하고자 하는 계정의 댓글을 드래그하여</h3>
					<br>
					<h3>해당 동영상의 인기순 댓글에서 해당 계정의 댓글들을 모두 삭제 및 차단합니다.</h3>
					<br> <br>

					<iframe width="560" height="315"
						src="https://www.youtube.com/embed/WTkdCEMALbI"
						title="YouTube video player" frameborder="0"
						allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
						allowfullscreen></iframe>
					<br> <br>
				</div>
			</div>
		</div>

		<div class="remain">
			<div class="remaincenter_A">
				<div class="remaincenter_A_content">
					<h2>
						<a href="${contextPath }/copyCommentFreeze"
							style="text-decoration: none; color: #368AFF"> 카피봇 차단 > </a>
					</h2>
					<br>
					<h3>유튜브 동영상의 URL을 입력하여</h3>
					<br>
					<h3>해당 영상의 인기순 상위 500개 중 댓글을 카피한 봇의 계정을 차단하고 댓글을 삭제합니다.</h3>
					<br> <br>

					<iframe width="560" height="315"
						src="https://www.youtube.com/embed/q00DbRKVJrY"
						title="YouTube video player" frameborder="0"
						allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
						allowfullscreen></iframe>
					<br> <br>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../default/footer.jsp" />
</body>
</html>