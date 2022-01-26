var blank_pattern1 = /^\s+|\s+$/g; // 공백만 있을 경우

function suggestionWrite() {
	if(document.getElementById("title").value == "" || document.getElementById("title").value.replace(blank_pattern1, '') == "") {
		alert("제목을 입력해주세요.");
		document.getElementById("title").focus();
		return;
	}
	
	var text = document.getElementById("editor").value;
	text = text.replace(/<br\/>/ig, "");
	text = text.replace(/<p>/ig, "");
	text = text.replace(/<br\>/ig, "");
	text = text.replace(/<\/p>/ig, "");
	text = text.replace(/&nbsp;/gi,"");
	
	if(text == "" || text.replace(blank_pattern1, '') == "") {
		alert("내용을 입력해 주세요.");
		document.getElementById("editor").focus();
		return;
	}
	
	document.getElementById("form").submit();
	
}

function search() {
	var search = document.getElementById("search").value.replace(blank_pattern1, '');
	if(search != "") {
		search = document.getElementById("search").value;
	} else {
		search = "";
	}
	location.href="suggestion-3?search="+search;
}