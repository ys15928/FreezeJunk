<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>" />
<!DOCTYPE html>
<html>
<head>
<meta name="naver-site-verification" content="f7ece45a4f55594768823cfd58a9f1a6567b3dec" />
<meta property="og:type" content="website"> 
<meta property="og:title" content="FreezeJunk">
<meta property="og:description" content="FreezeJunk는 유튜버의 댓글 관리를 돕는 웹사이트입니다. 영상의 댓글 삭제와 스팸& 카피봇 계정 차단이 가능합니다.">
<meta property="og:url" content="https://freezejunk.com/main">

<meta charset="UTF-8">
<link rel="shortcut icon" type="image⁄x-icon"
	href="${contextPath }/resources/login/icon.png">
<title>FreezeJunk</title>
<meta name="description" content="FreezeJunk는 유튜버의 댓글 관리를 돕는 웹사이트입니다. 영상의 댓글 삭제와 스팸& 카피봇 계정 차단이 가능합니다.">
<link rel="stylesheet"
	href="${contextPath }/resources/default/mainStyle.css?ver=2" />
</head>

<body>
	<div class="container">
		<jsp:include page="../default/header.jsp" />
		<div class="remain">
			<div class="remaincenter_main">
				<div class="remaincenter_main_content">
					<h1>유튜브 댓글을 보다 쉽고 편하게 효율적으로 관리하세요</h1>
					<br>
					<h2>영상의 URL과 키워드 또는 스팸에 등록할 계정으로</h2>
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
						<a href="${contextPath }/main/keywordFreeze"
							style="text-decoration: none; color: #368AFF"> 키워드 삭제 > </a>
					</h2>
					<br>
					<h3>유튜브 동영상의 URL과 키워드들을 입력하여</h3>
					<br>
					<h3>해당 동영상의 인기순 댓글에서 키워드를 포함하는 댓글들을 모두 삭제합니다.</h3>
					<br> <br>

					<div align="left">
						<video controls
							poster="${contextPath }/resources/login/logoblack.png">
							<source src="${contextPath}/resources/freezejunk/keyword.mp4"
								type="video/mp4">
							<strong>This is a video that is not supported by the web
								browser.</strong>
						</video>
					</div>
				</div>
			</div>
		</div>

		<div class="remain">
			<div class="remaincenter_B">
				<div class="remaincenter_B_content">
					<h2>
						<a href="${contextPath }/main/accountFreeze"
							style="text-decoration: none; color: #368AFF"> < 스팸 계정 차단 </a>
					</h2>
					<br>
					<h3>유튜브 동영상의 URL과 차단하고자 하는 계정의 댓글을 드래그하여</h3>
					<br>
					<h3>해당 동영상의 인기순 댓글에서 해당 계정의 댓글들을 모두 삭제 및 차단합니다.</h3>
					<br> <br>

					<div align="right">
						<video controls
							poster="${contextPath }/resources/login/logoblack.png">
							<source src="${contextPath}/resources/freezejunk/account.mp4"
								type="video/mp4">
							<strong>This is a video that is not supported by the web
								browser.</strong>
						</video>
					</div>
				</div>
			</div>
		</div>


		<div class="remain">
			<div class="remaincenter_A">
				<div class="remaincenter_A_content">
					<h2>
						<a href="${contextPath }/main/copyCommentFreeze"
							style="text-decoration: none; color: #368AFF"> 카피봇 차단 > </a>
					</h2>
					<br>
					<h3>유튜브 동영상의 URL을 입력하여</h3>
					<br>
					<h3>해당 영상의 인기순 상위 500개 중 댓글을 카피한 봇의 계정을 차단하고 댓글을 삭제합니다.</h3>
					<br> <br>

					<div align="left">
						<video controls
							poster="${contextPath }/resources/login/logoblack.png">
							<source src="${contextPath}/resources/freezejunk/copycomment.mp4"
								type="video/mp4">
							<strong>This is a video that is not supported by the web
								browser.</strong>
						</video>
					</div>
					<br>
					<h4>** FreezeJunk는 구글 계정의 로그인 정보를 저장하지 않습니다.</h4>
					<br>
				</div>
			</div>
		</div>
		<jsp:include page="../default/footer.jsp" />
	</div>
</body>
</html>