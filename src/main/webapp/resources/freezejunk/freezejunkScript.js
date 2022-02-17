var blank_pattern1 = /^\s+|\s+$/g; // 공백만 있을 경우
function keywordCheck() {
	if(document.getElementById("url").value == "" || document.getElementById("url").value.replace(blank_pattern1, '') == "") {
		alert("유튜브 url을 입력해주세요.");
		return;
	}
	if(document.getElementById("keywords").value == "" || document.getElementById("keywords").value.replace(blank_pattern1, '') == "") {
		alert("키워드를 입력해주세요.");
		return;
	}
	document.getElementById("form").submit();
}