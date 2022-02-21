<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <c:set var="contextPath" value="<%=request.getContextPath() %>"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header</title>
<style type="text/css">
	*{margin: 0;}
	.wrap1{width: 100%; background-color: black;}
	.header{display: flex; justify-content: space-between;}
	nav ul {list-style: none; display: flex; justify-content: flex-end;}
	nav ul li { margin: 0 3px; padding: 10px 10px;}
	nav ul li a { text-decoration: none; color: white; font-weight: bold; font-size: 15px; }
	.ab:hover { color: #BDBDBD; padding-bottom: 3px; border-bottom: 1px solid #BDBDBD; transition: all 0.25s;}
	.ad:hover { color: gray; padding-bottom: 3px; font-weight: bold;}
	.li{ background-color: black;}
	.li:hover{ background-color: #353535; }
	
</style>
</head>
<body style="width: 1920px; overflow-x: hidden; background-color: black;">
	<div class="wrap1" style="width: 1180px; margin: auto; background: black; display: flex; justify-content: space-between; align-items: center;">
		<nav>
			<ul>
				<li><a href="${contextPath }/main"><img style="height: 50px;" src="${contextPath }/resources/login/logoblack.png"></a></li>
			</ul>
		</nav>
	<div>
		<div>
			<nav style="">
				<ul>
				<c:if test="${sessionScope.loginUser.id == null }">
					<li><a href="${contextPath }/login" class="ad" style="font-size: 10px;">로그인</a></li>
					<span style="margin-top: 10px; color:white;">|</span>
				</c:if>
				<c:if test="${sessionScope.loginUser.id != null }">
					<li><a href="${contextPath }/mypage" class="ad" style="font-size: 10px;">${loginUser.name }님 환영합니다</a></li>
					<span style="margin-top: 10px; color:white;">|</span>
				</c:if>
				<c:if test="${sessionScope.loginUser.id == null }">
					<li><a href="${contextPath }/membership" class="ad" style="font-size: 10px;">회원가입</a></li>
				</c:if>
				<c:if test="${sessionScope.loginUser.id != null }">
					<li><a href="${contextPath }/main/logout" class="ad" style="font-size: 10px;">로그아웃</a></li>
				</c:if>
				</ul>
			</nav>
		</div>
		<div>
			<nav style="">
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
	<hr style="border: 1px solid #353535;">
</body>
</html>