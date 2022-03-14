let commentDataAfterExtract = {},
	cnt = 0;

// prepare for googleOauth2.0
function authenticate_googleOauth2(deleteCnt, func, deleteFreezeCommentId) {
	spinnerOff()

	return gapi.auth2.getAuthInstance()
		.signIn({ scope: "https://www.googleapis.com/auth/youtube.force-ssl" })
		.then(function() {
			console.log("Sign-in successful");

			let answer = confirm(deleteCnt + "개의 댓글들을 삭제하겠습니까?");

			if (answer == true) {
				setSpamAndDelete(deleteFreezeCommentId, func)
			}
			else {
				alert("삭제가 취소되었습니다.")
				history.go(0)
			}
		},
			function(err) {
				console.error("Error signing in", err);
				alert("구글 계정 로그인 과정에서 에러가 발생하였습니다.");
				history.go(0)
			});
}

function loadClient_googleOauth2() {
	gapi.client.setApiKey("AIzaSyBQyyjxukCf2vzb0tDe1ILeemhFlv1fHzs");
	return gapi.client.load("https://www.googleapis.com/discovery/v1/apis/youtube/v3/rest")
		.then(function() {
			console.log("GAPI client loaded for API");
		},
			function(err) {
				console.error("Error loading GAPI client for API", err);
				alert("구글 계정 로그인 과정에서 에러가 발생하였습니다.");
				history.go(0)
			});
}

gapi.load("client:auth2", function() {
	gapi.auth2.init({ client_id: "66390999420-pviepnnsa838pdbedugl2odhp56f43ns.apps.googleusercontent.com" });
});

// <============================ 크 롤 링 키 워 드, 계 정  ============================>
// 첫 번째 크롤링(키워드, 계정)
function crawlingFirst(num) {
	spinnerOn()
	let videoUrl = document.getElementById('videoUrl').value;
	let videoId = videoUrl.split("?v=");

	return gapi.client.youtube.commentThreads.list({
		"part": [
			"snippet",
			"replies"
		],
		"maxResults": 100,
		"order": "relevance",
		"textFormat": "plainText",
		"videoId": videoId[1],
		"prettyPrint": true

	})
		.then(function(crawlingResult) {
			extractCrawlingData(videoId[1], crawlingResult, num)
		},
			function(err) {
				console.error("Execute error", err);
				alert("크롤링 과정에서 에러가 발생하였습니다.");
				history.go(0)
			});
}

// 남은 댓글 크롤링(키워드, 계정)
function crawlingMore(videoId, nextPageToken, num) {

	return gapi.client.youtube.commentThreads.list({
		"part": [
			"snippet",
			"replies"
		],
		"maxResults": 100,
		"order": "relevance",
		"pageToken": nextPageToken,
		"textFormat": "plainText",
		"videoId": videoId,
		"prettyPrint": true
	})
		.then(function(crawlingResult) {
			extractCrawlingData(videoId, crawlingResult, num)
		},
			function(err) {
				console.error("Execute error", err);
				alert("크롤링 과정에서 에러가 발생하였습니다.");
				history.go(0)
			});
}

// 크롤링 데이터 중 필요 데이터만 추출(키워드, 계정)
function extractCrawlingData(videoId, crawlingResult, num) {

	for (let i = 0; i < crawlingResult.result.items.length; i++) {

		let pathToTopLevelComment = crawlingResult.result.items[i].snippet.topLevelComment
		let commentId = pathToTopLevelComment.id
		let authorName = pathToTopLevelComment.snippet.authorDisplayName
		let authorChannelUrl = pathToTopLevelComment.snippet.authorChannelUrl
		let commentText = pathToTopLevelComment.snippet.textDisplay
		let publishedAt = pathToTopLevelComment.snippet.publishedAt
		let publishedAtToSec = new Date(publishedAt).getTime() / 1000

		commentObj = new Object();
		commentObj.commentId = commentId;
		commentObj.authorName = authorName;
		commentObj.authorChannelUrl = authorChannelUrl;
		commentObj.commentText = commentText;
		commentObj.publishedAtToSec = publishedAtToSec;

		commentDataAfterExtract[cnt++] = commentObj

		if (crawlingResult.result.items[i].replies != null) {

			for (let j = 0; j < crawlingResult.result.items[i].replies.comments.length; j++) {

				let pathToComments = crawlingResult.result.items[i].replies.comments[j]
				let replyId = pathToComments.id
				let replyAuthorName = pathToComments.snippet.authorDisplayName
				let replyAuthorChannelUrl = pathToComments.snippet.authorChannelUrl
				let replyText = pathToComments.snippet.textDisplay
				let replyPublishedAt = pathToComments.snippet.publishedAt
				let replyPublishedAtToSec = new Date(replyPublishedAt).getTime() / 1000

				commentObj = new Object();
				commentObj.commentId = replyId;
				commentObj.authorName = replyAuthorName;
				commentObj.authorChannelUrl = replyAuthorChannelUrl;
				commentObj.commentText = replyText;
				commentObj.publishedAtToSec = replyPublishedAtToSec;

				commentDataAfterExtract[cnt++] = commentObj
			}
		}
	}

	if (crawlingResult.result.nextPageToken != null) {
		crawlingMore(videoId, crawlingResult.result.nextPageToken, num);
	}
	else {
		if (num == 1) {
			filterForDelete(commentDataAfterExtract);
		}
		else if (num == 2) {
			filterForSpamAccount(commentDataAfterExtract)
		}
	}
}

// <================================= 카 피 봇 크 롤 링 =================================>
// 첫 번째 크롤링(카피봇)
function crawlingFirst_ForCopyBot() {
	spinnerOn()
	let videoUrl = document.getElementById('videoUrl').value;
	let videoId = videoUrl.split("?v=");

	return gapi.client.youtube.commentThreads.list({
		"part": [
			"snippet",
		],
		"maxResults": 100,
		"order": "relevance",
		"textFormat": "plainText",
		"videoId": videoId[1],
		"prettyPrint": true

	})
		.then(function(crawlingResult) {
			extractCrawlingData_ForCopyBot(videoId[1], crawlingResult)
		},
			function(err) {
				console.error("Execute error", err);
				alert("크롤링 과정에서 에러가 발생하였습니다.");
				history.go(0)
			});
}

// 남은 댓글 크롤링(카피봇)
function crawlingMore_ForCopyBot(videoId, nextPageToken) {

	return gapi.client.youtube.commentThreads.list({
		"part": [
			"snippet",
		],
		"maxResults": 100,
		"order": "relevance",
		"pageToken": nextPageToken,
		"textFormat": "plainText",
		"videoId": videoId,
		"prettyPrint": true
	})
		.then(function(crawlingResult) {
			extractCrawlingData_ForCopyBot(videoId, crawlingResult)
		},
			function(err) {
				console.error("Execute error", err);
				alert("크롤링 과정에서 에러가 발생하였습니다.");
				history.go(0)
			});
}

// 크롤링 데이터 중 필요 데이터만 추출(카피봇)
function extractCrawlingData_ForCopyBot(videoId, crawlingResult) {
	let flag = false

	for (let i = 0; i < crawlingResult.result.items.length; i++) {

		let pathToTopLevelComment = crawlingResult.result.items[i].snippet.topLevelComment
		let commentId = pathToTopLevelComment.id
		let authorName = pathToTopLevelComment.snippet.authorDisplayName
		let authorChannelUrl = pathToTopLevelComment.snippet.authorChannelUrl
		let commentText = pathToTopLevelComment.snippet.textDisplay
		let publishedAt = pathToTopLevelComment.snippet.publishedAt
		let publishedAtToSec = new Date(publishedAt).getTime() / 1000

		commentObj = new Object();
		commentObj.commentId = commentId;
		commentObj.authorName = authorName;
		commentObj.authorChannelUrl = authorChannelUrl;
		commentObj.commentText = commentText;
		commentObj.publishedAtToSec = publishedAtToSec;

		commentDataAfterExtract[cnt++] = commentObj
		if (cnt > 500) {
			flag = true;
			break;
		}
	}

	if (crawlingResult.result.nextPageToken != null && flag != true) {
		crawlingMore_ForCopyBot(videoId, crawlingResult.result.nextPageToken);
	}
	else {
		filterForcopyBot(commentDataAfterExtract);
	}
}

// <===============================삭 제 대 상 찾 기===============================>
// 키워드
function filterForDelete(commentDataAfterExtract) {
	console.log("commentDataAfterExtract : " + JSON.stringify(commentDataAfterExtract));
	console.log("commentDataAfterExtract.len : " + Object.keys(commentDataAfterExtract).length);

	let keywords = document.getElementById('keywords').value
	let keywordsList = keywords.split(",")
	let keywordRegularExpression = []
	let deleteFreezeCommentId = []
	let deleteCnt = 0

	for (let i = 0; i < Object.keys(keywordsList).length; i++) {

		keywordsList[i] = keywordsList[i].replace(/^\s+|\s+$/gm, '');
		keywordRegularExpression.push("(s*)(.*)" + keywordsList[i] + "(.*)(s*)"); // keyword 앞뒤 정규식 추가
	}

	for (let i = 0; i < Object.keys(commentDataAfterExtract).length; i++) {

		let commentText = commentDataAfterExtract[i].commentText
		let commentId = commentDataAfterExtract[i].commentId

		for (let j = 0; j < keywordRegularExpression.length; j++) {

			if (commentText.match(keywordRegularExpression[j])) {
				deleteFreezeCommentId.push(commentId)
			}
		}
	}

	if (deleteFreezeCommentId.length > 0) {
		deleteFreezeCommentId = [...new Set(deleteFreezeCommentId)];
		deleteCnt = deleteFreezeCommentId.length

		authenticate_googleOauth2(deleteCnt, false, deleteFreezeCommentId).then(loadClient_googleOauth2)
	}
	else {
		console.log("No Target keyword Comment Here!!");
		alert("삭제할 대상이 없습니다.");
		document.getElementById("form").submit();
	}
}

// 계정(차단하고자 하는 계정의 모든 댓글 id를 추출)
function filterForSpamAccount(commentDataAfterExtract) {
	console.log("commentDataAfterExtract : " + JSON.stringify(commentDataAfterExtract));
	console.log("commentDataAfterExtract.len : " + Object.keys(commentDataAfterExtract).length);

	let accounts = document.getElementById('accounts').value;
	let accountList = accounts.split(",")
	let deleteFreezeCommentId = []
	let deleteCnt = 0

	for (let i = 0; i < Object.keys(commentDataAfterExtract).length; i++) {
		let authorChannelUrl = commentDataAfterExtract[i].authorChannelUrl
		let authorChannelId = authorChannelUrl.split("channel/")
		//let channelId = authorChannelId[1].substring(0, authorChannelId[1].length - 1)
		let commentId = commentDataAfterExtract[i].commentId

		for (let j = 0; j < accountList.length; j++) {

			if (accountList[j].includes(authorChannelId[1])) {
				deleteFreezeCommentId.push(commentId)
				deleteCnt++
			}
		}
	}

	if (deleteFreezeCommentId.length > 0) {
		authenticate_googleOauth2(deleteCnt, true, deleteFreezeCommentId).then(loadClient_googleOauth2)
	}
	else {
		console.log("No Target account Comment Here!!");
		alert("삭제할 대상이 없습니다.");
		document.getElementById("form").submit();
	}
}

// 카피봇
function filterForcopyBot(commentDataAfterExtract) {
	console.log("commentDataAfterExtract : " + JSON.stringify(commentDataAfterExtract));
	console.log("commentDataAfterExtract.len : " + Object.keys(commentDataAfterExtract).length);

	let deleteFreezeCommentId = []
	let deleteCnt = 0

	for (let i = 0; i < Object.keys(commentDataAfterExtract).length; i++) {
		let commentTextA = commentDataAfterExtract[i].commentText
		let commentIdA = commentDataAfterExtract[i].commentId
		let authorNameA = commentDataAfterExtract[i].authorName
		let publishedAtToSecA = commentDataAfterExtract[i].publishedAtToSec

		for (let j = i + 1; j < Object.keys(commentDataAfterExtract).length; j++) {
			let commentTextB = commentDataAfterExtract[j].commentText
			let commentIdB = commentDataAfterExtract[j].commentId
			let authorNameB = commentDataAfterExtract[j].authorName
			let publishedAtToSecB = commentDataAfterExtract[j].publishedAtToSec

			if ((commentTextA == commentTextB) && (commentIdA != commentIdB) && (authorNameA != authorNameB)) {
				deleteCnt++

				if (publishedAtToSecA > publishedAtToSecB) {
					deleteFreezeCommentId.push(commentIdA);
				}
				else {
					deleteFreezeCommentId.push(commentIdB);
				}
			}
		}
	}

	if (deleteFreezeCommentId.length > 0) {
		authenticate_googleOauth2(deleteCnt, true, deleteFreezeCommentId).then(loadClient_googleOauth2)
	}
	else {
		console.log("No Target copyBot Comment Here!!");
		alert("삭제할 대상이 없습니다.");
		document.getElementById("form").submit();
	}
}

// excute setSpamAndDelete
function setSpamAndDelete(deleteFreezeCommentId, setBanAuthor) {
	console.log("삭제 및 스팸 처리 시작");

	return gapi.client.youtube.comments.setModerationStatus({

		"id": deleteFreezeCommentId,
		"moderationStatus": "rejected",
		"banAuthor": setBanAuthor
	})
		.then(function(response) {
			console.log("Response", response);
			alert("삭제가 완료되었습니다.")
			document.getElementById("form").submit();
		},
			function(err) {
				console.error("에러 발생", err);
				alert("삭제 권한이 없습니다. \n동영상을 소유한 구글계정으로 로그인해 주세요.");
				history.go(0)
			});
}

spinnerOff()

function keywordFreeze() {
	blank_pattern1 = /^\s+|\s+$/g; // 공백만 있을 경우
	
	if (document.getElementById("videoUrl").value == "" || document.getElementById("videoUrl").value.replace(blank_pattern1, '') == "") {
		alert("유튜브 url을 입력해주세요.");
		return;
	}

	if (document.getElementById("keywords").value == "" || document.getElementById("keywords").value.replace(blank_pattern1, '') == "") {
		alert("키워드를 입력해주세요.");
		return;
	}

	document.getElementById("keywords").value = document.getElementById("keywords").value.replace(blank_pattern1, '');

	loadClient_googleOauth2()
	setTimeout(function() {
		crawlingFirst(1)
	}, 1000);

}

function accountFreeze() {
	blank_pattern1 = /^\s+|\s+$/g; // 공백만 있을 경우

	if (document.getElementById("videoUrl").value == "" || document.getElementById("videoUrl").value.replace(blank_pattern1, '') == "") {
		alert("유튜브 url을 입력해주세요.");
		return;
	}

	if (document.getElementById("accounts").value == "" || document.getElementById("accounts").value.replace(blank_pattern1, '') == "") {
		alert("차단 및 삭제하고자하는 계정의 댓글을 드래그해 넣어주세요.");
		return;
	}

	document.getElementById("accounts").value = document.getElementById("accounts").value.replace(blank_pattern1, '');

	loadClient_googleOauth2()
	setTimeout(function() {
		crawlingFirst(2)
	}, 1000);
}

function copyCommentFreeze() {
	blank_pattern1 = /^\s+|\s+$/g; // 공백만 있을 경우

	if (document.getElementById("videoUrl").value == "" || document.getElementById("videoUrl").value.replace(blank_pattern1, '') == "") {
		alert("유튜브 url을 입력해주세요.");
		return;
	}

	loadClient_googleOauth2()
	setTimeout(function() {
		crawlingFirst_ForCopyBot()
	}, 1000);
}

function instruction() { // 사용방법 보기
	document.getElementById("insmodal").style.display = "block";
}

function cl() {	// 사용방법 숨기기
	document.getElementById("insmodal").style.display = "none";
}

function spinnerOn() { // Spinner 띄우기
	document.getElementById("mask").style.display = "block";
	document.getElementById("loadingImg").style.display = "block";
}

function spinnerOff() {	// Spinner 숨기기
	document.getElementById("mask").style.display = "none";
	document.getElementById("loadingImg").style.display = "none";
}