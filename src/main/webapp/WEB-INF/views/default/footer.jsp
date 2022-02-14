<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="<%=request.getContextPath() %>"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<hr style="margin-top: 20px; border: 1px solid gainsboro;">
<div style="background-color: black;">
<table  style="display: flex; justify-content: center; align-items: center; height: 280px; color:gray; width:1080px; margin:auto; font-size: 15px;">

	<tr>
	<td style="width:650px">© 2022 All Rights Reserved. 주식회사 FreezeJunk</td><td></td>
	</tr>
	
	<tr style="height: 10px;"></tr>
	
	<tr>
	<td>사업자 등록 번호 : 123-45-67890</td><td style="width:430px; text-align: center;"rowspan="5">
					<img style="height: 95px;" src="${contextPath}/resources/login/logoblack.png"></td>
	</tr>
	
	<tr>
	<td>대표자명 : Freeze</td>
	</tr>
	
	<tr>
	<td>주소 : 서울시 강남구</td>
	</tr>
	
	<tr>
	<td>전화번호 : 02-123-1234</td>
	</tr>
	
	<tr>
	<td>이메일 : freezejunk@naver.com</td>
	</tr>
	
	<tr style="height: 10px;"></tr>
	
	<tr>
	<td>FreezeJunk는 여러분의 고민을 얼려드립니다.</td><td></td>
	</tr>
	
</table>
</div>



</body>
</html>