<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.care.root.suggestion.dto.SuggestionDTO"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="<%=request.getContextPath() %>"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image⁄x-icon" href="${contextPath }/resources/login/icon.png">
<title>FreezeJunk</title>
<link rel="stylesheet" href="${contextPath }/resources/suggestion/suggestionStyle.css"/>
<link rel="stylesheet" href="${contextPath }/resources/summernote/summernote-lite.css"/>
</head>
<body>
<%
	SuggestionDTO dto = (SuggestionDTO) request.getAttribute("dto");
	SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy.MM.dd");
	SimpleDateFormat sd = new SimpleDateFormat("yyyy/MM/dd");
	SimpleDateFormat sdf2 = new SimpleDateFormat("a hh:mm");
	
%>
<div class="container">
	<jsp:include page="../default/header.jsp"/>
	<div class="wrap ht-1030">
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
		</div>
		<div class="info-content">
			${dto.suggContent }
		</div>
		<div class="answer-title">
		Answer
		</div>
		<div>
			<form action="suggestion-5" method="post" id="form">
				<input type="hidden" name="num" value="<%=dto.getNum() %>"/>
				<textarea name="content" id="editor"></textarea>
			</form>
		</div>
		<div class="write-btn-box">
			<button type="button" class="mr-15" id="write-btn" onclick="history.back();">이전으로</button>
			<button type="button" id="write-btn" onclick="suggestionAnswerWrite();">등록</button>
		</div>
	</div>
	<jsp:include page="../default/footer.jsp"/>
</div>

<script src="${contextPath }/resources/jquery-3.6.0.min.js"></script>
<script src="${contextPath }/resources/bootstrap.js"></script>
<script src="${contextPath }/resources/suggestion/suggestionScript.js"></script>
<script src="${contextPath }/resources/summernote/summernote-lite.js"></script>
<script src="${contextPath }/resources/summernote/lang/summernote-ko-KR.js"></script>
<script>
$('#editor').summernote({
	  height: 350,
	  // 에디터 한글 설정
	  lang: "ko-KR",
	  focus : false,
	  toolbar: [
		    // 글꼴 설정
		    ['fontname', ['fontname']],
		    // 글자 크기 설정
		    ['fontsize', ['fontsize']],
		    // 굵기, 기울임꼴, 밑줄,취소 선, 서식지우기
		    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
		    // 글자색
		    ['color', ['forecolor','color']],
		    // 표만들기
		    ['table', ['table']],
		    // 글머리 기호, 번호매기기, 문단정렬
		    ['para', ['ul', 'ol', 'paragraph']],
		    // 줄간격
		    ['height', ['height']],
		    // 그림첨부, 링크만들기, 동영상첨부
		    ['insert',['picture','link','video']],
		    // 코드보기, 확대해서보기, 도움말
		    ['view', ['codeview']]
		  ],
		  // 추가한 글꼴
		fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋음체','바탕체'],
		 // 추가한 폰트사이즈
		fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']
	});
$('.note-editable').css("font-family", '"맑은 고딕"');
$(".note-current-fontname").css("font-family", '"맑은 고딕"');
$(".note-current-fontname").text("맑은 고딕");
$('.note-editable').css("background-color", "white");
</script>
</body>
</html>