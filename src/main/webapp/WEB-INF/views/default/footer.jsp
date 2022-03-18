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
<link rel="stylesheet" href="${contextPath }/resources/default/footerStyle.css"/>
</head>
<body>
<div class="footerbackground">
<table class="footertable">
	
	<tr>
	<td>FREEZEJUNK 프리즈정크</td>
	</tr>
	
	<tr class="footertr"></tr>
	
	<tr>
	<td>대표자명 : 신윤수</td>
	<td class="footerhe">** FreezeJunk는 구글 계정의 로그인 정보를 저장하지 않습니다.</td>
	</tr>
	
	<tr>
	<td>주소 : 서울시 금천구  <span class="footerspan">|</span>  전화번호 : 010-4628-1383</td>
	<td class="footerhe">** FreezeJunk는 설정 실수에 의한 댓글 삭제는 책임지지 않습니다.</td>
	</tr>
	
	<tr>
	<td>이메일 : freezejunk01@gmail.com</td>
	</tr>
	
	<tr class="footertr"></tr>
	
	<tr>
	<td class="footerhe">copyright © FreezeJunk All Rights Reserved.</td>
	<td>
	<a href="${contextPath }/policy_privacy" class="footera">개인정보처리방침</a>
	<span class="footerspan">|</span>
	<a href="${contextPath }/policy_service" class="footera">서비스이용약관</a>
	<span class="footerspan">|</span>
	<a href="${contextPath }/main/suggestion-3" class="footera">고객센터</a>
	</td>
	</tr>

	
	<tr class="footertr"></tr>
	
	
</table>
</div>



</body>
</html>