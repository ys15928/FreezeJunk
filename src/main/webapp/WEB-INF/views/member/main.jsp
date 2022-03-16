<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FREEZEJUNK</title>
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
				<div class="remainmargin15">안녕하세요.</div>
				<div class="remainmargin15">
					FreezeJunk는 유튜브 영상의 댓글을 보다 쉽고 편하게 관리할 수 있게 도와주는 사이트입니다.<br> <br>영상의
					url과 키워드 또는 스팸에 등록할 계정 등을 입력하여 <br> <br>영상에 불필요한 댓글과 스팸
					계정 차단, 카피봇 계정을 차단할 수 있습니다.<br>
					<br>
				</div>
				<div>
					서비스를 사용하기 전 사용방법 및 주의사항을 <span class="remainspan">꼭!!!</span> 읽어주시기
					바랍니다.
				</div>
				<div class="remainmargin15">많은 관심과 사랑 부탁드립니다. 감사합니다.</div>
				<div class="remainmargin15">- FreezeJunk -</div>
			</div>
		</div>

		<jsp:include page="../default/footer.jsp" />
	</div>
</body>
</html>