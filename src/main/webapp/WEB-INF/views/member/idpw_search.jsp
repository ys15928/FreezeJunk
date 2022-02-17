<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="<%=request.getContextPath() %>"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디/비밀번호 찾기</title>
<style type="text/css">
		
	.modal1{ background-color: white; width: 410px; height: 165px; border-radius: 6px;}
		
 	.searchbtn{height: 30px; width: 154px; background-color: white; font-weight: bold; border: none; }
    .pwsearchbtn{  border-top-right-radius: 4px;    border-bottom-right-radius: 4px; }
    .idsearchbtn{ border-top-left-radius: 4px;    border-bottom-left-radius: 4px; }
    
    .idsearchbtn:hover { color:white; background-color: #368AFF;  }
    .pwsearchbtn:hover { color:white; background-color: #368AFF; }
    
 	.yesbtn{ width: 308px; height: 40px; font-size: 20px; font-weight: bold; background-color: #368AFF;
 	   		 border: 1px solid #368AFF; border-radius: 4px; color:white; }
 	
 	.chkbtn{ border: none; font-weight: bold; background: white; }
 	
 
 	
 	.label{ font-weight: bold; color: white; font-size: 18px; }
    
 	.input{ width: 300px; height: 40px; font-weight: bold; color: white; background: black;
   			 border: none; border-bottom: 1px solid white;} 
	
	.search{ text-align: center; color: white; font-size: 25px; font-weight: bold; }

</style>
</head>
<body style="width: 1920px; overflow-x: hidden; background-color: black;">

<div style="display: flex; justify-content: center; align-items: center; margin-top: 218px;     margin-bottom: 60px;">
		<div>
			<div >
				<div style="text-align: center; margin-bottom: 30px;">
					<a href="${contextPath }/main"><img style="height: 60px;" src="${contextPath }/resources/login/logoblack.png"></a>
					<p style="color:white;">인증된 이메일만 정보 찾기가 가능합니다 :)</p>
				</div>
				<div style="display: flex;    justify-content: center;  align-items: center;">
				<div style="">
					<input type="button" class="searchbtn idsearchbtn"  id="search_1" name="search_total1" onClick="search_check1();" value="아이디 찾기" />
				</div>
				
				<div class="">
					<input type="button" class="searchbtn pwsearchbtn" id="search_2" name="search_total2" onClick="search_check2();" value="비밀번호 찾기" />
				</div>
				</div>
				
				<div id="searchI" style="display: block; margin-top: 20px;">
				<div class="search">아이디 찾기</div>
				<div style="margin-top: 20px;">
					<div >
						<label class="label" for="inputName_1">이름</label>
						<div style="margin-top: 10px;">
							<input type="text" class="input" id="inputName_1" name="inputName_1" placeholder="ex) 프리즈">
						</div>
					</div>
					<div style="margin-top: 10px;">
						<label class="label" for="inputEmail_1">이메일</label>
						<div style="margin-top: 10px;">
							<input type="text" class="input" id="inputEmail_1" name="inputEmail_1" placeholder="ex) E-mail@gmail.com">
						</div>
					</div>
				
					
					<div style="margin-top: 25px;">
					<div><button id="searchBtn1" type="button" class="yesbtn" onclick="idSearch_click();">확인</button></div>
					
					</div>
				</div>
				</div>
				
				
				
				<div id="searchP" style="display: none; margin-top: 20px;">
				<div class="search">비밀번호 찾기</div>
				<div style="margin-top: 20px;">
					<div class="">
						<label class="label" for="inputId_2">아이디</label>
						<div style="margin-top: 10px;">
							<input type="text" class="input" id="inputId_2" name="inputId_2" placeholder="ex) freeze">
						</div>
					</div>
					
					<div style="margin-top: 10px;">
						<label class="label" for="inputEmail_2">이메일</label>
						<div style="margin-top: 10px;">
							<input type="email" class="input" id="inputEmail_2"	name="inputEmail_2" placeholder="ex) E-mail@gmail.com">
						</div>
					</div>
					
					<div style="margin-top: 25px;">
					<div><button id="searchBtn2" type="button" class="yesbtn" onclick="">확인</button></div>
					
			
				</div>
				</div>
				</div>
				
			</div>
		</div>
	</div>
	
	<div id="background_modal" class="modal1" style="margin: 0 auto; display: none;">
	<div style="display: block; justify-content: center; align-items: center; text-align: center;">
		<div>
		<h4>
			<b>찾기 결과</b>
		</h4>
		</div>
		<div style="height: 70px; display: flex; justify-content: center; align-items: center;">
		<span id="id_value" style="font-weight: bold; font-size: 20px; color:blue;"></span>
		</div>
		
		<div style="margin-top: 20px;">
		<div><input type="button" id="clo" class="chkbtn" onclick="clo();" value="확인"/>
		
		</div>
		</div>
	</div>
</div>


<script src="${contextPath }/resources/jquery-3.6.0.min.js"></script>
<script type="text/javascript">

function search_check1(){
	document.getElementById("searchP").style.display="none";
	document.getElementById("searchI").style.display="block";
	document.getElementById("inputId_2").value = "";
	document.getElementById("inputEmail_2").value = "";
	document.getElementById("background_modal").style.display="none";
}

function search_check2(){
	document.getElementById("searchP").style.display="block";
	document.getElementById("searchI").style.display="none";
	document.getElementById("inputName_1").value = "";
	document.getElementById("inputEmail_1").value = "";
	document.getElementById("background_modal").style.display="none";
}

var idV = "";
function idSearch_click(){
	$.ajax({
		type:"POST",
		url:"searchId?inputName_1="+$('#inputName_1').val()+"&inputEmail_1="+$('#inputEmail_1').val(),
		success:function(data){
			if(data == 0){
				$("#background_modal").css('display', 'block');
				$('#id_value').text("회원 정보를 확인해주세요!");	
			} else {
				$("#background_modal").css('display', 'block');
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
					$("#background_modal").css('display', 'block');
					$('#id_value').text("회원 정보를 확인해주세요!");	
				} else {
					$("#background_modal").css('display', 'block');
					$('#id_value').text("이메일을 확인하세요!");
				}
			},
			
		})
	});
})

function clo(){
	document.getElementById("background_modal").style.display="none";
	document.getElementById("inputName_1").value = "";
	document.getElementById("inputEmail_1").value = "";
}



</script>
</body>
</html>