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

	<jsp:include page="../default/header.jsp" />
	<div class="remain">
		<div class="remaincenter">
			<div>
				<img src="${contextPath }/resources/login/logo.png"
					class="remainimgsize">
			</div>
			<div class="remainmargin15">안녕하세요. 관리자 프리즈입니다.</div>
			<div class="remainmargin15">
				저희 FreezeJunk는 유튜브분들의 영상관리를 보다 쉽고 편하게 관리할 수 있게 도와주는 사이트입니다.<br>
				<br> FreezeJunk는 영상의 불필요한 댓글과 스팸 계정 차단, 카피봇 계정을 자동 차단할 수 있습니다.<br>
				<br> 현재 FreezeJunk는 정식 서비스에 앞서 베타서비스로 먼저 출시되었습니다.<br>
				<br>
			</div>
			<div>
				서비스 사용 전 사용방법 및 주의사항을 <span class="remainspan">꼭!!!</span> 읽어주시기
				바랍니다.
			</div>
			<div class="remainmargin15">많은 관심과 사랑 부탁드립니다. 감사합니다.</div>
			<div class="remainmargin15">- 프리즈 -</div>
		</div>
	</div>

	<jsp:include page="../default/footer.jsp" />
</body>
</html>