function authenticate() {
	return gapi.auth2.getAuthInstance()
		.signIn({ scope: "https://www.googleapis.com/auth/youtube.force-ssl" })
		.then(function() { console.log("Sign-in successful"); },
			function(err) { console.error("Error signing in", err); });
}

function loadClient() {
	console.log("markSpam_ loadClient()");
	gapi.client.setApiKey("AIzaSyBQyyjxukCf2vzb0tDe1ILeemhFlv1fHzs");
	return gapi.client.load("https://www.googleapis.com/discovery/v1/apis/youtube/v3/rest")
		.then(function() { console.log("GAPI client loaded for API"); },
			function(err) { console.error("Error loading GAPI client for API", err); });
}

function setModerationStatus() {
	authenticate().then(loadClient)
	console.log("setModerationStatus_ execute()");
	return gapi.client.youtube.comments.setModerationStatus({
		"id": [
			"UgwrYtPymeBGJzJIOdF4AaABAg.9YAV3GM__Bi9YAhAG6a1kD"
		],
		"moderationStatus": "rejected", // 해당 댓글 숨김
		"banAuthor": true // true : 해당 계정 숨김 등록
	})
		.then(function(response) {
			// Handle the results here (response.result has the parsed body).
			console.log("Response", response);
		},
			function(err) { console.error("Execute error", err); });
}

gapi.load("client:auth2", function() {
	gapi.auth2.init({ client_id: "66390999420-pviepnnsa838pdbedugl2odhp56f43ns.apps.googleusercontent.com" });
});