<%@page import="com.care.root.member.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image⁄x-icon" href="${contextPath }/resources/login/logo.png">
<title>FreezeJunk</title>
<link rel="stylesheet"
	href="${contextPath }/resources/freezejunk/freezejunkStyle.css" />
</head>
<body>

	<div class="modalcenter modalwrap" id="insmodal">
		<div class="modalheader">
			<스팸계정 차단> <br>
		</div>
		<div>
			기존 Youtube Studio에서는 스팸 계정을 차단할 경우 차단 설정 이후의 댓글은 보이지 않게 되지만 기존에 달았던
			댓글은 삭제되는데 약 48시간이 소요됩니다.<br> 즉시 삭제를 원할 경우 유튜버가 직접 하나씩 삭제를 해야합니다.
			<br> <br> FreezeJunk를 이용할 경우, 댓글을 드래그 하여 입력하고, 여러 계정을 한꺼번에
			입력할 수 있으며, 계정 차단과 함께 해당 계정이 달았던 댓글들을 인기순 댓글에서 모두 삭제합니다. <br> <br>
			* 본인 pc의 기본 브라우저에 유튜브 채널의 계정이 로그인 되어있어야 합니다. <br> <br> 1.
			동영상의 URL 입력<br> 2. 삭제 및 차단하고자 하는 계정의 댓글을 드래그해 입력(여러 개를 입력할 경우
			쉼표로 구분)<br> 3. 돋보기(Search) 버튼을 클릭<br> 4. 유튜브 댓글 수정 권한 부여 승인<br>
			5. 처리 완료 창을 닫고 처리결과 확인 <br> <br> <span class="modalspan">쉼표
				구분과 키워드 설정 실수에 의한 댓글 삭제는 책임지지 않습니다.</span><br> 댓글이 과하게 많은 경우 할당량의 문제가
			발생할 수 있기 때문에 시간순이 아닌 인기순으로 댓글들을 크롤링합니다.<br>(모든 댓글에 대해 삭제를 진행 하는
			것이 아닙니다.)<br> 삭제될 댓글이 없는 경우 권한 부여 창이 뜨지 않습니다.<br>
			쿠키가 차단되어 있는 브라우저의 경우 로그인 과정에서 에러가 발생합니다. 쿠키를 허용해 주세요.<br>
			<a href="https://support.google.com/accounts/answer/61416?hl=ko&co=GENIE.Platform%3DDesktop&oco=0" 
				style="color: #368AFF" target="_blank">쿠키허용 방법 보기</a>

		</div>
		<div class="modalfooter">
			<button type="button" class="modalbtn" id="cl" onclick="cl()">확인</button>
		</div>
	</div>

	<div class="container">
		<jsp:include page="../default/header.jsp" />
		<div class="wrap">
			<form action="./" method="post" id="form">
				<div class="head-box">
					<div class="head-text1">유튜브 URL과 스팸계정을 입력해주세요 !</div>
					<div class="head-text2">해당 영상에서 스팸계정들이 작성한 계정을 차단하고 댓글을
						삭제해드립니다</div>
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
						onclick="loginsession();" /></span>
				</div>
				<div class="keywords-box">
					<textarea name="accounts" class="keywords-search" id="accounts"
						placeholder="차단 및 삭제하고자 한 영상의 댓글을 드래그하여 넣어주세요.(여러개일시 ,로 구분해주세요)"></textarea>
				</div>
			</form>
			<div class="video">
				<video controls
					poster="${contextPath }/resources/login/logoblack.png">
					<source src="${contextPath}/resources/freezejunk/account.mp4"
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
	<script type="text/javascript">
	<% MemberDTO dto = (MemberDTO)session.getAttribute("loginUser");
	   String uid = null;	
	   if(dto != null){
		   uid = dto.getId();
	   }
	%>
	var session = '<%= uid %>';
	function loginsession(){
		if(session != "null"){
			accountFreeze();
		}else{
			alert("로그인 후 이용해주세요.")
			location.href="${contextPath}/login";
		}
	}
	</script>
	<script src="https://apis.google.com/js/api.js"></script>
	<script src="${contextPath }/resources/freezejunk/obfuscated.js"></script>
</body>
</html>