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

<div id="background_modal" class="" style="background-color: pink;">
	<div class="" style="display:block;">
		<h4>
			<b>아이디는?</b><span class=""></span>
		</h4><br>
			<h2 id="id_value"></h2>
		<br>
		<button type="button" id="pwSearch_btn" class=""><i class=""></i>비밀번호 찾기</button>
	</div>
</div>

<div style="margin-left: 831px; margin-top: 298px; background-color: gray;">
		<div >
			<div >
				<div>
					<h3>아이디/비밀번호 찾기</h3>
					<p>인증된 이메일만 정보 찾기가 가능합니다 :)</p>
				</div>
				
				<div style="margin-bottom: 10px;">
			<!-- <input type="button" id="search_1" name="search_total" onClick="search_check1" >
			<input type="button" id="search_1" name="search_total1" onClick="search_check1();" >
					<label class=""	for="search_1">아이디 찾기</label>  	
					<button id="search_1" onClick="search_check1();">아이디 찾기</button>-->
					<input type="button" id="search_1" name="search_total1" onClick="search_check1();" value="아이디 찾기" />
				</div>
				
				<div class="">
			<!-- <input type="button" id="search_2" name="search_total" onClick="search_check2"> 
			<input type="button" id="search_2" name="search_total2" onClick="search_check2();">
					<label class="" for="search_2">비밀번호 찾기</label> 
					<button id="search_2" onClick="search_check2();">비밀번호 찾기</button>-->
					<input type="button" id="search_2" name="search_total2" onClick="search_check2();" value="비밀번호 찾기" />
				</div>
				
				<div id="searchI" style="display: block;">
					<div >
						<label for="inputName_1">이름</label>
						<div>
							<input type="text" class="" id="inputName_1" name="inputName_1" placeholder="ex) 프리즈">
						</div>
					</div>
					<div class="">
						<label class="" for="inputPhone_1">이메일</label>
						<div>
							<input type="text" class="" id="inputPhone_1" name="inputPhone_1" placeholder="ex) E-mail@gmail.com">
						</div>
					</div>
					
					<div class="form-group">
						<button id="searchBtn" type="button" onclick="idSearch_click()" class="">확인</button>
					<a class=""	href="${pageContext.request.contextPath}">취소</a>
					</div>
				</div>
				
				
				
				<div id="searchP" style="display: none;">
					<div class="">
						<label class="" for="inputId">아이디</label>
						<div>
							<input type="text" class="form-control" id="inputId" name="inputId_2" placeholder="ex) freeze">
						</div>
					</div>
					
					<div class="">
						<label class="" for="inputEmail_2">이메일</label>
						<div>
							<input type="email" class="form-control" id="inputEmail_2"	name="inputEmail_2" placeholder="ex) E-mail@gmail.com">
						</div>
					</div>
					
					<div class="">
						<button id="searchBtn2" type="button" class="">확인</button>
					<a class=""	href="${pageContext.request.contextPath}">취소</a>
				</div>
				</div>
				
			</div>
		</div>
	</div>


<script src="${contextPath }/resources/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
function search_check1(){
	document.getElementById("searchP").style.display="none";
	document.getElementById("searchI").style.dispaly="block";
}

function search_check2(){
	document.getElementById("searchP").style.dispaly="block";
	document.getElementById("searchI").style.dispaly="none";
}


$(document).ready(function() {
	// 1. 모달창 히든 불러오기
	$('#searchBtn').click(function() {
		$('#background_modal').show();
	});
	// 2. 모달창 닫기 버튼
	$('.close').on('click', function() {
		$('#background_modal').hide();
	});
	// 3. 모달창 위도우 클릭 시 닫기
	$(window).on('click', function() {
		if (event.target == $('#background_modal').get(0)) {
            $('#background_modal').hide();
         }
	});
});

</script>
</body>
</html>









