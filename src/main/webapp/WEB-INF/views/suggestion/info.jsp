<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.care.root.suggestion.SuggestionDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="<%=request.getContextPath() %>"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${contextPath }/resources/suggestion/suggestionStyle.css"/>
<link rel="stylesheet" href="${contextPath }/resources/summernote/summernote-lite.css"/>
<%
	SuggestionDTO dto = (SuggestionDTO) request.getAttribute("dto");
	SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy.MM.dd");
	SimpleDateFormat sd = new SimpleDateFormat("yyyy/MM/dd");
	SimpleDateFormat sdf2 = new SimpleDateFormat("a hh:mm");
	
	String answer = dto.getAnswContent();
%>
</head>
<body>
	<div class="wrap">
		<div class="info-head-title">
			<div class="info-title">${dto.suggTitle }</div>
		</div>
		<div class="info-head-sub">
			<div>${dto.suggId }</div>
			<div class="info-sub">|</div>
			<div>
			<%
			Date sys = new Date();
			String sysStr = sd.format(sys);
			sys = sd.parse(sysStr);
			String dateStr = sd.format(dto.getSuggTime().getTime());
			Date date = sd.parse(dateStr);
			if(date.before(sys)) {
			%>
				<%=sdf1.format(dto.getSuggTime())%>
			<%
			} else {
			%>
				<%=sdf2.format(dto.getSuggTime())%>
			<%
			}
			%>
			</div>
			<div class="info-sub">|</div>
			<div>
			<%
			if(answer == null) {
			%>
				답변대기
			<%
			} else {
			%>
				답변완료
			<%
			}
			%>
			</div>
		</div>
		<div class="info-content" style="background: aliceblue;">
			${dto.suggContent }
		</div>
		<div class="info-btn-box">
			<button type="button" onclick="location.href='suggestion-3'">목록으로</button>
			<button type="button">수정</button>
			<button type="button">삭제</button>
			<button type="button">답변</button>
		</div>
	</div>

<script src="${contextPath }/resources/jquery-3.6.0.min.js"></script>
<script src="${contextPath }/resources/suggestion/suggestionScript.js"></script>
</body>
</html>