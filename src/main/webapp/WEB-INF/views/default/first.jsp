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
	.center{ position: fixed;
		top: 50%;
		left: 50%;
		-webkit-transform: translate(-50%, -50%);
		-moz-transform: translate(-50%, -50%);
		-ms-transform: translate(-50%, -50%);
		-o-transform: translate(-50%, -50%);
		transform: translate(-50%, -50%); }
		
	.qw{ 
	border-top-left-radius: 4px;
    border-bottom-left-radius: 4px;
	width: 75px;
    height: 30px;
    background-color: #242424;
    display: flex;
    justify-content: center; font-size: 15px;
    align-items: center; 
    font-weight: lighter;  }
    
	.qe{ 
	border-top-right-radius: 4px;
    border-bottom-right-radius: 4px;
	width: 75px;
    height: 30px;
    background-color: #242424; font-size: 15px;
    display: flex;
    justify-content: center;
    align-items: center;
    font-weight: lighter;  }	
    
    .qw:hover{ color: white; }
    .qe:hover{ color:white; }
    
    .btn222{ margin-top: 15px;
    display: flex;
    justify-content: center;
    align-items: center; }
</style>
</head>
<body style="width: 1920px; overflow-x: hidden; background-color: black;">

<div style="color:white; text-align: center;" class="center">
<div><img src="${contextPath }/resources/login/logoblack.png" style="width: 320px;"></div>
<div style="margin-top: 15px">
안녕하세요. 관리자 프리즈입니다.</div>
<div style="margin-top: 15px">
저희 FreezeJunk는 유튜브분들의 영상관리를 보다 쉽고 편하게 관리할 수 있게 도와주는 사이트입니다.<br><br>
FreezeJunk는 영상의 불필요한 댓글과 스팸 계정 차단, 카피봇 계정을 자동 차단할 수 있습니다.<br><br>
현재 FreezeJunk는 정식 서비스에 앞서 베타서비스로 먼저 출시되었습니다.<br><br>
</div>
<div>
서비스 사용 전 회원가입 후 사용방법 및 주의사항을 <span style="color:#368AFF;font-weight: bold;font-size: 18px; ">꼭!!!</span> 읽어주시기 바랍니다.
</div>
<div style="margin-top: 15px;">
많은 관심과 사랑 부탁드립니다. 감사합니다.
</div>
<div style="margin-top: 15px;">
- 프리즈 -
</div>
<div class="btn222">
<div class="qw"><a href="${contextPath }/login" style="text-decoration: none; color: #D5D5D5;">로그인</a></div>
<div class="qe"><a href="${contextPath }/membership" style="text-decoration: none; color: #D5D5D5;">회원가입</a></div>

</div>

</div>

</body>
</html>