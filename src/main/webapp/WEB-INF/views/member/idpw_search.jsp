<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="<%=request.getContextPath() %>"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디/비밀번호 찾기</title>
</head>
<body style="width: 1920px; overflow-x: hidden;">
<div id="background_modal" style="display: block">
	<div class="">
		<h4>
			<b>손님 아이디는?</b><span class="">&times;</span>
		</h4><br>
			<h2 id="id_value"></h2>
		<br>
		<button type="button" id="pwSearch_btn" class="btn peach-gradient btn-rounded waves-effect">
		<i class=""></i>비밀번호 찾기</button>
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
						<label class="" for="inputEmail_1">이메일</label>
						<div>
							<input type="text" class="" id="inputEmail_1" name="inputEmail_1" placeholder="ex) E-mail@gmail.com">
						</div>
					</div>
					
					<div class="">
						<button id="searchBtn" type="button" onclick="idSearch_click()" class="">확인</button>
					<a class=""	href="${pageContext.request.contextPath}">취소</a>
					</div>
				</div>
				
				
				
				<div id="searchP" style="display: none;">
					<div class="">
						<label class="" for="inputId_2">아이디</label>
						<div>
							<input type="text" class="" id="inputId_2" name="inputId_2" placeholder="ex) freeze">
						</div>
					</div>
					
					<div class="">
						<label class="" for="inputEmail_2">이메일</label>
						<div>
							<input type="email" class="" id="inputEmail_2"	name="inputEmail_2" placeholder="ex) E-mail@gmail.com">
						</div>
					</div>
					
					<div class="">
						<button id="searchBtn2" type="button" class="" onclick="">확인</button>
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
	document.getElementById("searchI").style.display="block";
}

function search_check2(){
	document.getElementById("searchP").style.display="block";
	document.getElementById("searchI").style.display="none";
}

var idV = "";
function idSearch_click(){
	$.ajax({
		type:"POST",
		url:"searchId?inputName_1="+$('#inputName_1').val()+"&inputEmail_1="+$('#inputEmail_1').val(),
		success:function(data){
			if(data == 0){
				$('#id_value').text("회원 정보를 확인해주세요!");	
			} else {
				$('#id_value').text(data);
				idV = data;
			}
		}
	});
}


$(function(){
	$("#searchBtn2").click(function(){
		$.ajax({
			url : "searchPwd",
			type : "POST",
			data : {
				id : $("#inputId_2").val(),
				email : $("#inputEmail_2").val()
			},
			success : function(result) {
				if(result == 0){
					$('#id_value').text("회원 정보를 확인해주세요!");	
				} else {
					$('#id_value').text("이메일을 확인하세요");
				}
			},
			
		})
	});
})

</script>
</body>
</html>