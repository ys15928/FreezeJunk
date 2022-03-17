<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <c:set var="contextPath" value="<%=request.getContextPath() %>"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image⁄x-icon" href="${contextPath }/resources/login/logo.png">
<title>FreezeJunk</title>
<link rel="stylesheet" href="${contextPath }/resources/default/firstStyle.css"/>
</head>
<c:if test="${loginUser != null }">
	<script>
		alert("이미 로그인 된 상태입니다.");
		location.href="main";
	</script>
</c:if>
<body>
<div class="center">
<div><img src="${contextPath }/resources/login/logoblack.png" class="imgsize"></div>
<div class="margin15">
안녕하세요. 관리자 프리즈입니다.</div>
<div class="margin15">
저희 FreezeJunk는 유튜브분들의 영상관리를 보다 쉽고 편하게 관리할 수 있게 도와주는 사이트입니다.<br><br>
FreezeJunk는 영상의 불필요한 댓글과 스팸 계정 차단, 카피봇 계정을 자동 차단할 수 있습니다.<br><br>
현재 FreezeJunk는 정식 서비스에 앞서 베타서비스로 먼저 출시되었습니다.<br><br>
</div>
<div>
서비스 사용 전 회원가입 후 사용방법 및 주의사항을 <span class="span">꼭!!!</span> 읽어주시기 바랍니다.
</div>
<div class="margin15">
많은 관심과 사랑 부탁드립니다. 감사합니다.
</div>
<div class="margin15">
- 프리즈 -
</div>
<div class="btn222">
<div class="qw"><a href="${contextPath }/login" class="qwa">로그인</a></div>
<div class="qe"><a href="${contextPath }/membership" class="qea">회원가입</a></div>

</div>

</div>

</body>
</html>