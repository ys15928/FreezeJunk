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
	.wrap1{width: 100%; background-color: white;}
	.header{display: flex; justify-content: space-between;}
	nav ul {list-style: none; display: flex; justify-content: flex-end;}
	nav ul li { margin: 0 3px; padding: 10px 10px;}
	nav ul li a { text-decoration: none; color: black; font-weight: bold; font-size: 15px; }
	.ab:hover { color: #6E94CC; padding-bottom: 3px; border-bottom: 1px solid #6E94CC; transition: all 0.25s;}
	.ad:hover { color: gray; padding-bottom: 3px; border-bottom: 1px solid gray;}
	
</style>
</head>
<body>
	<div class="wrap1" style="width: 1180px; margin: auto; background: white; display: flex; justify-content: space-between; align-items: center;">
		<nav>
			<ul>
				<li><a href="main"><img style="height: 50px;" src="${contextPath }/resources/login/logo.png"></a></li>
			</ul>
		</nav>
	<div>
		<div>
			<nav style="">
				<ul>
				<c:if test="${sessionScope.loginUser.id == null }">
					<li><a href="../login" class="ad" style="font-size: 10px;">로그인</a></li>
					<span style="margin-top: 10px;">|</span>
				</c:if>
				<c:if test="${sessionScope.loginUser.id != null }">
					<li><a href="#" class="ad" style="font-size: 10px;">${loginUser.name }님 환영합니다.</a></li>
					<span style="margin-top: 10px;">|</span>
				</c:if>
				<c:if test="${sessionScope.loginUser.id == null }">
					<li><a href="../membership" class="ad" style="font-size: 10px;">회원가입</a></li>
				</c:if>
				<c:if test="${sessionScope.loginUser.id != null }">
					<li><a href="logout" class="ad" style="font-size: 10px;">로그아웃</a></li>
				</c:if>
				</ul>
			</nav>
		</div>
		<div>
			<nav style="">
				<ul>
					<li><a href="#" class="ab">키워드 추천</a></li>
					<li><a href="suggestion-3" class="ab">건의사항</a></li>
					<li><a href="#" class="ab">마이페이지</a></li>
			<!-- 	<c:if test="${sessionScope.login.id eq '3333'}">
						<li><a href="memberList" class="ab">MemberList</a></li>
					</c:if>	 -->
				</ul>
			</nav>
		</div>
	</div>
	</div>
	<hr style="border: 1px solid gainsboro;">
	<!--<div class="logout log">
			<a href="logout" class="a">logout</a>
		</div>  -->	


</body>
</html>