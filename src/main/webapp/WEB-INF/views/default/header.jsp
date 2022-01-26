<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header</title>
<style type="text/css">
	*{margin: 0;}
	.wrap{width: 100%; background-color: white;}
	.header{display: flex; justify-content: space-between;}
	nav ul {list-style: none; display: flex; justify-content: flex-end;}
	nav ul li { margin: 0 3px; padding: 10px 10px;}
	nav ul li a { text-decoration: none; color: black; font-family: ; font-size: 15px; }
	.ab:hover { color: #6E94CC; padding-bottom: 3px; border-bottom: 1px solid #6E94CC; transition: all 0.25s;}
	.ad:hover { color: gray; padding-bottom: 3px; border-bottom: 1px solid gray;}
	
</style>
</head>
<body>
	<div class="wrap" style="width: 1180px;
    margin: auto;
    background: red;
    display: flex;
    justify-content: space-between;
    align-items: center;">
		<nav>
			<ul>
				<li><a href="#" class="frezze" style="font-size: 25px;">FreezeJunk</a></li>
			</ul>
		</nav>
	<div>
		<div>
			<nav style="">
				<ul>
					<li><a href="#" class="ad" style="font-size: 10px;">로그인</a></li>
					<span style="margin-top: 10px;">|</span>
					<li><a href="membership" class="ad" style="font-size: 10px;">회원가입</a></li>
				</ul>
			</nav>
		</div>
		<div>
			<nav style="">
				<ul>
					<li><a href="#" class="ab">키워드 추천</a></li>
					<li><a href="#" class="ab">건의사항</a></li>
					<li><a href="#" class="ab">마이페이지</a></li>
			<!-- 	<c:if test="${sessionScope.loginUser.id eq '3333'}">
						<li><a href="memberList" class="ab">MemberList</a></li>
					</c:if>	 -->
				</ul>
			</nav>
		</div>
	</div>
	</div>
	<!--<div class="logout log">
			<a href="logout" class="a">logout</a>
		</div>  -->	


</body>
</html>