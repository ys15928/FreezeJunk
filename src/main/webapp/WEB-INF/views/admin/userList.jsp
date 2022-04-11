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
	href="${contextPath }/resources/admin/adminStyle.css" />

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap"
	rel="stylesheet">

</head>
<body>
	<jsp:include page="../default/header.jsp" />
	<div class="container">
		<div class="wrap mb-125">
			<div class="user-list-head">
				<div class="user-list-title">회원목록</div>
				<div class="user-list-head-search-box">
					<select id="search-select">
						<c:choose>
							<c:when test="${option == 1 }">
								<option value="1" selected>ID</option>
								<option value="2">닉네임</option>
								<option value="3">이메일</option>
							</c:when>
							<c:when test="${option == 2 }">
								<option value="1">ID</option>
								<option value="2" selected>닉네임</option>
								<option value="3">이메일</option>
							</c:when>
							<c:when test="${option == 3 }">
								<option value="1">ID</option>
								<option value="2">닉네임</option>
								<option value="3" selected>이메일</option>
							</c:when>
						</c:choose>

					</select> <input type="text" class="search-input" name="search" id="search"
						value="${search }" /> <span onclick="search();"> <img
						src="${contextPath }/resources/image/search_black.png"
						class="search-img" />
					</span>
				</div>
			</div>
			<div class="user-list-box">
				<div class="user-head-line">
					<c:choose>
						<c:when test="${idSort == 'asc' }">
							<div id="head-id" class="1" onclick="sort(this);">
								아이디<img src="${contextPath }/resources/image/asc.png"
									id="id-btn">
							</div>
						</c:when>
						<c:when test="${idSort == 'desc' }">
							<div id="head-id" class="-1" onclick="sort(this);">
								아이디<img src="${contextPath }/resources/image/desc.png"
									id="id-btn">
							</div>
						</c:when>
						<c:otherwise>
							<div id="head-id" class="1" onclick="sort(this);">
								아이디<img src="${contextPath }/resources/image/asc.png"
									id="id-btn">
							</div>
						</c:otherwise>
					</c:choose>

					<div>비밀번호</div>
					<c:choose>
						<c:when test="${nameSort == 'asc' }">
							<div id="head-name" class="1" onclick="sort(this);">
								닉네임<img src="${contextPath }/resources/image/asc.png"
									id="name-btn">
							</div>
						</c:when>
						<c:when test="${nameSort == 'desc' }">
							<div id="head-name" class="-1" onclick="sort(this);">
								닉네임<img src="${contextPath }/resources/image/desc.png"
									id="name-btn">
							</div>
						</c:when>
						<c:otherwise>
							<div id="head-name" class="1" onclick="sort(this);">
								닉네임<img src="${contextPath }/resources/image/asc.png"
									id="name-btn">
							</div>
						</c:otherwise>
					</c:choose>

					<c:choose>
						<c:when test="${emailSort == 'asc' }">
							<div id="head-email" class="1" onclick="sort(this);">
								이메일<img src="${contextPath }/resources/image/asc.png"
									id="email-btn">
							</div>
						</c:when>
						<c:when test="${emailSort == 'desc' }">
							<div id="head-email" class="-1" onclick="sort(this);">
								이메일<img src="${contextPath }/resources/image/desc.png"
									id="email-btn">
							</div>
						</c:when>
						<c:otherwise>
							<div id="head-email" class="1" onclick="sort(this);">
								이메일<img src="${contextPath }/resources/image/asc.png"
									id="email-btn">
							</div>
						</c:otherwise>
					</c:choose>


				</div>
				<c:forEach var="dto" items="${list }">
					<div class="user-list-line">
						<div>${dto.id }</div>
						<div>********</div>
						<div>${dto.name }</div>
						<div>${dto.email }</div>
					</div>
				</c:forEach>
				<c:if test="${list.size() == 0 }">
					<div class="none-line">검색된 회원 정보가 없습니다</div>
				</c:if>
			</div>
		</div>
	</div>

	<jsp:include page="../default/footer.jsp" />
	<script src="${contextPath }/resources/jquery-3.6.0.min.js"></script>
	<script src="${contextPath }/resources/admin/adminScript.js"></script>
	<script>
		var blank_pattern1 = /^\s+|\s+$/g; // 공백만 있을 경우

		function sort(info) {
			var id = info.id;

			var search = document.getElementById("search").value.replace(
					blank_pattern1, '');
			if (search != "") {
				search = document.getElementById("search").value;
			} else {
				search = "";
			}
			var select = $("#search-select option:selected").val();

			if (id == "head-id") {
				if (document.getElementById("head-id").className == 1) {
					$("#head-id").attr("class", "-1");
					location.href = "admin-1?search=" + search + "&option="
							+ select + "&column=id&sort=desc";
				} else {
					$("#head-id").attr("class", "1");
					location.href = "admin-1?search=" + search + "&option="
							+ select + "&column=id&sort=asc";
				}
			}

			if (id == "head-name") {
				if (document.getElementById("head-name").className == 1) {
					$("#head-name").attr("class", "-1");
					location.href = "admin-1?search=" + search + "&option="
							+ select + "&column=name&sort=desc";
				} else {
					$("#head-id").attr("class", "1");
					location.href = "admin-1?search=" + search + "&option="
							+ select + "&column=name&sort=asc";
				}
			}

			if (id == "head-email") {
				if (document.getElementById("head-email").className == 1) {
					$("#head-email").attr("class", "-1");
					location.href = "admin-1?search=" + search + "&option="
							+ select + "&column=email&sort=desc";
				} else {
					$("#head-email").attr("class", "1");
					location.href = "admin-1?search=" + search + "&option="
							+ select + "&column=email&sort=asc";
				}
			}
		}
	</script>
</body>
</html>