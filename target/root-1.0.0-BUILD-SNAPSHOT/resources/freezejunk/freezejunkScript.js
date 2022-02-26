var blank_pattern1 = /^\s+|\s+$/g; // 공백만 있을 경우
function keywordCheck() {
	if(document.getElementById("videoUrl").value == "" || document.getElementById("videoUrl").value.replace(blank_pattern1, '') == "") {
		alert("유튜브 url을 입력해주세요.");
		return;
	}
	if(document.getElementById("keywords").value == "" || document.getElementById("keywords").value.replace(blank_pattern1, '') == "") {
		alert("키워드를 입력해주세요.");
		return;
	}
	document.getElementById("keywords").value = document.getElementById("keywords").value.replace(blank_pattern1, '');
	document.getElementById("form").submit();
}


function userCheck() {
	if(document.getElementById("videoUrl").value == "" || document.getElementById("videoUrl").value.replace(blank_pattern1, '') == "") {
		alert("유튜브 url을 입력해주세요.");
		return;
	}
	if(document.getElementById("accounts").value == "" || document.getElementById("accounts").value.replace(blank_pattern1, '') == "") {
		alert("차단 및 삭제하고자하는 계정의 댓글을 드래그해 넣어주세요.");
		return;
	}
	document.getElementById("accounts").value = document.getElementById("accounts").value.replace(blank_pattern1, '');
	document.getElementById("form").submit();
}


function videoUrlCheck() {
	if(document.getElementById("videoUrl").value == "" || document.getElementById("videoUrl").value.replace(blank_pattern1, '') == "") {
		alert("유튜브 url을 입력해주세요.");
		return;
	}

	document.getElementById("form").submit();
}


function instruction(){
	document.getElementById("insmodal").style.display="block";
}

function cl(){
	document.getElementById("insmodal").style.display="none";
}


