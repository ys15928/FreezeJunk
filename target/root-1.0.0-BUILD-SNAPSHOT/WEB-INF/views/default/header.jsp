<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <c:set var="contextPath" value="<%=request.getContextPath() %>"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FreezeJunk</title>
<link rel="stylesheet" href="${contextPath }/resources/default/headerStyle.css"/>
</head>
<body>
	<div class="wrap1">
		<nav>
			<ul>
				<li><a href="${contextPath }/main"><img class="imgsize" src="${contextPath }/resources/login/logoblack.png"></a></li>
			</ul>
		</nav>
	<div>
		<div>
			<nav>
				<ul>
				<c:if test="${sessionScope.loginUser.id == null }">
					<li><a href="${contextPath }/login" class="ad adfont">로그인</a></li>
					<span class="margin10">|</span>
				</c:if>
				<c:if test="${sessionScope.loginUser.id != null }">
					<li><a href="${contextPath }/mypage" class="ad adfont">${loginUser.name }님 환영합니다</a></li>
					<span class="margin10">|</span>
				</c:if>
				<c:if test="${sessionScope.loginUser.id == null }">
					<li><a href="${contextPath }/membership" class="ad adfont">회원가입</a></li>
				</c:if>
				<c:if test="${sessionScope.loginUser.id != null }">
					<li><a href="${contextPath }/main/logout" class="ad adfont">로그아웃</a></li>
				</c:if>
				</ul>
			</nav>
		</div>
		<div>
			<nav>
				<ul>
					<li class="li"><a href="${contextPath }/main/keywordFreeze" class="ab">키워드 삭제</a></li>
					<li class="li"><a href="${contextPath }/main/accountFreeze" class="ab">스팸 계정 차단</a></li>
					<li class="li"><a href="${contextPath }/main/copyCommentFreeze" class="ab">카피봇 차단</a></li>
					<li class="li"><a href="${contextPath }/main/suggestion-3" class="ab">건의사항</a></li>
					<li class="li"><a href="${contextPath }/mypage" class="ab">마이페이지</a></li>
				<c:if test="${sessionScope.loginUser.id eq 'team03'}">
						<li class="li"><a href="${contextPath }/main/admin/admin-1" class="ab">회원목록</a></li>
					</c:if>
				</ul>
			</nav>
		</div>
	</div>
	</div>
	<hr>
</body>
</html>