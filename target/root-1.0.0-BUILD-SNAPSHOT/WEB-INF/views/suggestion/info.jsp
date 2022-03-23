<%@page import="com.care.root.member.dto.MemberDTO"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.care.root.suggestion.dto.SuggestionDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image⁄x-icon"
	href="${contextPath }/resources/login/icon.png">
<title>FreezeJunk</title>
<link rel="stylesheet"
	href="${contextPath }/resources/suggestion/suggestionStyle.css" />
<link rel="stylesheet"
	href="${contextPath }/resources/summernote/summernote-lite.css" />
<%
SuggestionDTO dto = (SuggestionDTO) request.getAttribute("dto");
String id = dto.getSuggId().substring(0, 4);
id += "****";
// dto.setSuggId(id);

SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy.MM.dd");
SimpleDateFormat sd = new SimpleDateFormat("yyyy/MM/dd");
SimpleDateFormat sdf2 = new SimpleDateFormat("a hh:mm");

String answer = dto.getAnswContent();

MemberDTO loginUser = (MemberDTO) session.getAttribute("loginUser");
%>
</head>
<body>
	<div class="container">
		<jsp:include page="../default/header.jsp" />
		<div class="wrap">
			<div class="info-head-title">
				<div class="info-title">${dto.suggTitle }</div>
			</div>
			<div class="info-head-sub">
				<div>${dto.name }(<%=id%>)
				</div>
				<div class="info-sub">|</div>
				<div>
					<%
					Date sys = new Date();
					String sysStr = sd.format(sys);
					sys = sd.parse(sysStr);
					String dateStr = sd.format(dto.getSuggTime().getTime());
					Date date = sd.parse(dateStr);
					if (date.before(sys)) {
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
					if (answer == null) {
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
			<div class="info-content">${dto.suggContent }</div>
			<%
			if (answer != null) {
			%>
			<div class="info-head-sub margin-25-0">
				<div>관리자</div>
				<div class="info-sub">|</div>
				<div>
					<%
					Date sys2 = new Date();
					String sysStr2 = sd.format(sys);
					sys = sd.parse(sysStr);
					String dateStr2 = sd.format(dto.getAnswTime().getTime());
					Date date2 = sd.parse(dateStr);
					if (date.before(sys)) {
					%>
					<%=sdf1.format(dto.getAnswTime())%>
					<%
					} else {
					%>
					<%=sdf2.format(dto.getAnswTime())%>
					<%
					}
					%>
				</div>
			</div>
			<div class="info-content">${dto.answContent }</div>
			<%
			}
			%>
			<div class="info-btn-box">
				<c:choose>
					<c:when test="${type == 'all' }">
						<button type="button" onclick="location.href='suggestion-3'">목록으로</button>
					</c:when>
					<c:otherwise>
						<button type="button" onclick="location.href='suggestion-4'">목록으로</button>
					</c:otherwise>
				</c:choose>
				<%
				if (dto.getSuggId().equals(loginUser.getId()) && dto.getAnswContent() == null) {
				%>
				<button type="button"
					onclick="location.href='suggestion-6?num=${dto.num}'">수정</button>
				<%
				}
				if (loginUser.getId().equals("team03") || (dto.getSuggId().equals(loginUser.getId()) && dto.getAnswContent() == null)) {
				%>
				<button type="button" onclick="deleteCheck();">삭제</button>
				<%
				}
				if (dto.getAnswContent() == null && loginUser.getId().equals("team03")) {
				%>
				<button type="button"
					onclick="location.href='admin/suggestion-4?num=${dto.num}'">답변</button>
				<%
				}
				%>
			</div>
			<form action="suggestion-8" method="post" class="dp-none"
				id="delete-form">
				<input type="hidden" name="num" value="${dto.num }" />
			</form>
		</div>
		<jsp:include page="../default/footer.jsp" />
	</div>
	<script src="${contextPath }/resources/jquery-3.6.0.min.js"></script>
	<script src="${contextPath }/resources/suggestion/suggestionScript.js"></script>
</body>
</html>