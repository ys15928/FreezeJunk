<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="<%=request.getContextPath() %>"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${contextPath }/resources/admin/adminStyle.css"/>
</head>
<body>
	<jsp:include page="../default/header.jsp"/>
	
	<div class="wrap">
		<div class="user-list-head">
			<div class="user-list-title">회원목록</div>
			<div class="user-list-head-search-box">
				<select id="search-select" name="option">
					<option value="1">ID</option>
					<option value="2">이름</option>
					<option value="3">이메일</option>
				</select>
				<input type="text" class="search-input" name="search" id="search" value="${search }"/>
				<span onclick="search();">
					<img src="${contextPath }/resources/image/search.png" class="search-img"/>
				</span>
			</div>
		</div>
		<div class="user-list-box">
			<c:forEach var="dto" items="${list }">
				<div class="user-list-line">
					<div>${dto.id }</div>
					<div>********</div>
					<div>${dto.name }</div>
					<div>${dto.email }</div>
				</div>
			</c:forEach>
			<c:if test="${list.size() == 0 }">
				<div>검색된 회원 정보가 없습니다</div>
			</c:if>
		</div>
	</div>
	
	<jsp:include page="../default/footer.jsp"/>
<script src="${contextPath }/resources/jquery-3.6.0.min.js"></script>
<script src="${contextPath }/resources/admin/adminScript.js"></script>
</body>
</html>