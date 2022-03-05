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
					$('#id_value').text("임시 비밀번호는 - freezejunk - 입니다.");
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
