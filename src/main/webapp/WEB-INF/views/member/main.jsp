<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image⁄x-icon"
	href="${contextPath }/resources/login/logo.png">
<title>FreezeJunk</title>
<link rel="stylesheet"
	href="${contextPath }/resources/default/mainStyle.css" />
</head>
<body>
	<div class="container">
		<jsp:include page="../default/header.jsp" />
		<div class="remain">
			<div class="remaincenter">
				<div>
					<img src="${contextPath }/resources/login/logo.png"
						class="remainimgsize">
				</div>

				<div class="remainmargin15">
					FreezeJunk는 유튜브 영상의 댓글을 보다 쉽고 편하게 관리할 수 있게 도와주는 사이트입니다.<br> <br>
					영상의 url과 키워드 또는 스팸에 등록할 계정 등을 입력하여 <br> <br> 영상의 댓글 삭제와
					스팸 계정 차단, 카피봇 계정을 차단할 수 있습니다.<br> <br>
				</div>
				<div>
					서비스를 사용하기 전 사용방법 및 주의사항을 <span class="remainspan">꼭!!!</span> 읽어주시기
					바랍니다.
				</div>
			</div>
		</div>

		<div class="remain">
			<div class="remaincenter_keyword">
				<div class="remainmargin15">
					키워드 삭제 <br> <br> 유튜브 동영상의 URL과 키워드들을 입력하여 <br> <br>
					해당 동영상의 인기순 댓글에서 키워드를 포함하는 댓글들을 모두 삭제합니다.<br> <br>
					<div class="video">
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
			<div class="remaincenter_keyword">
				<div class="remainmargin15">
					스팸 계정 차단 <br> <br> 유튜브 동영상의 URL과 키워드들을 입력하여 <br> <br>
					해당 동영상의 인기순 댓글에서 키워드를 포함하는 댓글들을 모두 삭제합니다.<br> <br>
				</div>
			</div>
		</div>

		<div class="remain">
			<div class="remaincenter_keyword">
				<div class="remainmargin15">
					카피봇 차단 <br> <br> 유튜브 동영상의 URL을 입력하여 <br> <br>
					해당 동영상의 인기순 댓글에서 키워드를 포함하는 댓글들을 모두 삭제합니다.<br> <br>
				</div>
			</div>
		</div>

		<jsp:include page="../default/footer.jsp" />
	</div>
</body>
</html>