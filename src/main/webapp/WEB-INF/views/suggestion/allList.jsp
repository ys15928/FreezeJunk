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
	<jsp:include page="../default/header.jsp"/>
	<div class="wrap">
		<div class="list-head-box">
			<div class="list-select">전체리스트</div>
			<div class="non-list-select" style="border-left: none;"><a href="suggestion-4">내가 작성한 건의사항</a></div>
		</div>
		<div class="sugg-search-box">
			<span class="search-comment">제목</span><input type="text" id="search" name="search"/><button type="button" class="search-btn" onclick="search(1);">검색</button>
		</div>
		<div style="margin-top: 20px;">
		<%
			for(SuggestionDTO dto : list) {	
		%>
		<%
			if(dto.getSuggStatus().equals("1")) {
		%>
		<div class="sugg-line">
		<%
			} else {
				if(loginUser.getId().equals("team03")) {
		%>
		<div class="sugg-line">
		<%
				} else {
		%>
		<div class="sugg-line non-line">
		<%
				}
			}
		%>
			<div style="width: 7%; padding-left: 32px;"><%=dto.getNum() %></div>
			<div style="width: 40%; cursor: pointer;" id="<%=dto.getSuggId()%>" class="<%=dto.getNum() %>" onclick="info(this, <%=dto.getSuggStatus() %>);"><%=dto.getSuggTitle() %></div>
			<div style="width: 15%"><%=dto.getSuggId() %></div>
		<%
			Date sys = new Date();
			String sysStr = sd.format(sys);
			sys = sd.parse(sysStr);
			String dateStr = sd.format(dto.getSuggTime().getTime());
			Date date = sd.parse(dateStr);
			if(date.before(sys)) {
		%>
			<div style="width: 15%"><%=sdf1.format(dto.getSuggTime()) %></div>
		<%
			} else {
		%>
			<div style="width: 15%"><%=sdf2.format(dto.getSuggTime()) %></div>
		<%
			}
			
			if(dto.getAnswContent() == null) {
		%>
			<div style="width: 10%">답변대기</div>
		<%
			} else{
		%>
			<div style="width: 10%">답변완료</div>
		<%
			}
			
			if(dto.getSuggStatus().equals("1")) {	
		%>
			<div style="width: 10%">전체공개</div>
		<%
			} else {
		%>
			<div style="width: 10%">비공개</div>
		<%
			}
		%>
		</div>
		<%
			}
		
			if(count == 0) {
		%>
			<div class="sugg-line" style="border-bottom: none;">검색된 결과가 없습니다.</div>
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
			<a href="suggestion-3?currentPage=<%=startPage - 10 %>&search=<%=search%>">[이전]</a>
			<%
			}
			for(int i=startPage; i<=endPage; i++) {
				if(i == pageNum) {
			%>
			<a href="#" class="current-page">[<%=i %>]</a>
			<%
			} else {
			%>
				<a href="suggestion-3?currentPage=<%=i %>&search=<%=search%>">[<%=i %>]</a>
			<%
				}
			}
			if(endPage < pageCount) {
			%>
				<a href="suggestion-3?currentPage=<%=startPage + 10 %>&search=<%=search%>">[다음]</a>
			<%
			}
			%>
		</div>
	</div>
	
	<jsp:include page="../default/footer.jsp"/>
	
<script src="${contextPath }/resources/jquery-3.6.0.min.js"></script>
<script src="${contextPath }/resources/suggestion/suggestionScript.js"></script>
<script>
	function info(info, infoStatus) {
		var infoId = info.id;
		var infoNum = info.className;
		var loginId = "<%=loginUser.getId() %>";
		var status = infoStatus;
		if(status == 1 || loginId == "team03" || loginId == infoId) {
			location.href="suggestion-5?num=" + infoNum;
		} else {
			alert("비공개 글입니다.")
		}
	}
</script>
</body>
</html>