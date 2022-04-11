var blank_pattern1 = /^\s+|\s+$/g; // 공백만 있을 경우

function search() {
	var search = document.getElementById("search").value.replace(blank_pattern1, '');
	if (search != "") {
		search = document.getElementById("search").value;
	} else {
		search = "";
	}
	var select = $("#search-select option:selected").val();
	location.href = "admin-1?search=" + search + "&option=" + select;
}

