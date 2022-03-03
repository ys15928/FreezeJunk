<%@page import="com.care.root.member.dto.MemberDTO"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.care.root.suggestion.SuggestionDTO"%>
<%@page import="java.util.List"%>
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
</head>
<body>
<%
	HttpSession se = request.getSession();
	MemberDTO loginUser = (MemberDTO) se.getAttribute("loginUser");
	List<SuggestionDTO> list= (List<SuggestionDTO>) request.getAttribute("list");
	SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy.MM.dd");
	SimpleDateFormat sd = new SimpleDateFormat("yyyy/MM/dd");
	SimpleDateFormat sdf2 = new SimpleDateFormat("a hh:mm");
	
	int count = Integer.parseInt(request.getAttribute("count").toString());
	int pageNum = Integer.parseInt(request.getAttribute("pageNum").toString()); 
	String search = (String) request.getAttribute("search");
	
	int pageCount = count / 10 + (count%10 == 0 ? 0 : 1);
	
	int startPage = ((pageNum-1)/10)*10+1;
	int endPage = startPage + 10 - 1;
	
	if(endPage > pageCount) {
		endPage = pageCount;
	}
%>
<div class="container">
	<jsp:include page="../default/header.jsp"/>
	<div class="wrap all-wrap">
		<div class="list-head-box">
			<div class="non-list-select"><a href="suggestion-3">전체리스트</a></div>
			<div class="list-select bl-none">내가 작성한 건의사항</div>
		</div>
		<div class="sugg-search-box">
			<span class="search-comment">제목</span><input type="text" id="search" name="search"/>
			<span class="search-btn-box" onclick="search(2);">
				<img src="${contextPath }/resources/image/search_white.png" class="search-img"/>
			</span>
		</div>
		<div class="list-head">
		<div class="list-head-num">글번호</div>
		<div class="list-head-title">제목</div>
		<div class="list-head-id">작성자</div>
		<div class="list-head-date">작성일</div>
		<div class="list-head-status">답변여부</div>
		<div class="list-head-status">공개여부</div>
		</div>
		<div class="list-body">
		<%
			for(SuggestionDTO dto : list) {	
				String id = dto.getSuggId().substring(0, 4);
				id += "****";
				dto.setSuggId(id);
		%>
		<div class="sugg-line">
			<div class="list-num"><%=dto.getNum() %></div>
			<div class="list-title"><a href="suggestion-5?num=<%=dto.getNum()%>" class="sugg-line-a"><%=dto.getSuggTitle() %></a></div>
			<div class="list-name"><%=dto.getName() %>(<%=dto.getSuggId() %>)</div>
		<%
			Date sys = new Date();
			String sysStr = sd.format(sys);
			sys = sd.parse(sysStr);
			String dateStr = sd.format(dto.getSuggTime().getTime());
			Date date = sd.parse(dateStr);
			if(date.before(sys)) {
		%>
			<div class="list-date"><%=sdf1.format(dto.getSuggTime()) %></div>
		<%
			} else {
		%>
			<div class="list-date"><%=sdf2.format(dto.getSuggTime()) %></div>
		<%
			}
			
			if(dto.getAnswContent() == null) {
		%>
			<div class="status-waiting">답변대기</div>
		<%
			} else{
		%>
			<div class="status-success">답변완료</div>
		<%
			}
			
			if(dto.getSuggStatus().equals("1")) {	
		%>
			<div class="list-all">전체공개</div>
		<%
			} else {
		%>
			<div class="list-non-all">비공개</div>
		<%
			}
		%>
		</div>
		<%
			}
		
			if(count == 0) {
		%>
			<div class="sugg-line-non bb-none">검색된 결과가 없습니다.</div>
		<%
			}
		%>
		</div>
		<div class="list-write-btn-box">
			<button type="button" class="list-write-btn" onclick="location.href='suggestion-1'">글작성</button>
		</div>
		<div class="pageing-box">
			<%
			if(startPage > 10) {
			%>
			<a href="suggestion-4?currentPage=<%=startPage - 10 %>&search=<%=search%>">[이전]</a>
			<%
			}
			for(int i=startPage; i<=endPage; i++) {
				if(i == pageNum) {
			%>
			<a href="#" class="current-page"><%=i %>&nbsp;</a>
			<%
			} else {
			%>
				<a href="suggestion-4?currentPage=<%=i %>&search=<%=search%>"><%=i %>&nbsp;</a>
			<%
				}
			}
			if(endPage < pageCount) {
			%>
				<a href="suggestion-4?currentPage=<%=startPage + 10 %>&search=<%=search%>">[다음]</a>
			<%
			}
			%>
		</div>
	</div>
	
	<jsp:include page="../default/footer.jsp"/>
	</div>
<script src="${contextPath }/resources/jquery-3.6.0.min.js"></script>
<script src="${contextPath }/resources/suggestion/suggestionScript.js"></script>
</body>
</html>