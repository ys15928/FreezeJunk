<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="<%=request.getContextPath() %>"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.a{ text-decoration: none; color: gray; }
	.a:hover{ border-bottom: 1px solid #BDBDBD; }
	.span{ font-size: 15px; }
</style>
</head>
<body>
<hr style="margin-top: 20px; border: 1px solid #353535;">
<div style="background-color: black;">
<table  style="display: flex; justify-content: center; align-items: center; height: 280px; color:gray; width:1080px; margin:auto; font-size: 15px;">

	<tr>
	<td style="width:650px">© 2022 All Rights Reserved. 주식회사 FreezeJunk</td><td></td>
	</tr>
	
	<tr style="height: 10px;"></tr>
	
	<tr>
	<td>사업자 등록 번호 : 123-45-67890</td><td style="width:430px; text-align: center;"rowspan="5">
					<a href="${contextPath }/main"><img style="height: 95px;" src="${contextPath}/resources/login/logoblack.png"></a></td>
	</tr>
	
	<tr>
	<td>대표자명 : 신윤수</td>
	</tr>
	
	<tr>
	<td>주소 : 서울시 금천구</td>
	</tr>
	
	<tr>
	<td>전화번호 : 010-4628-1383</td>
	</tr>
	
	<tr>
	<td>이메일 : freezejunk@gmail.com</td>
	</tr>
	
	<tr>
	<td>
	<a href="${contextPath }/policy_privacy" class="a">개인정보처리방침</a>
	<span class="span">|</span>
	<a href="${contextPath }/policy_service" class="a">서비스이용약관</a>
	<span class="span">|</span>
	<a href="${contextPath }/main/suggestion-3" class="a">고객센터</a>
	</td>
	</tr>
	
	<tr style="height: 10px;"></tr>
	
	<tr>
	<td>FreezeJunk는 여러분의 고민을 얼려드립니다.</td><td></td>
	</tr>
	
</table>
</div>



</body>
</html>