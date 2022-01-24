<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>" />

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Document</title>
</head>
<body>
	<div class="container">
		<h1>Videos list</h1>
		<ul id="results"></ul>
	</div>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

	<script type="text/javascript">
		var playlist = 'Ohq9il4eiig';
		$(document).ready(
				function() {
					$.get("https://www.googleapis.com/youtube/v3/videos", {
						part : 'snippet',
						maxResults : 50,
						id : playlist,
						key : 'AIzaSyBQyyjxukCf2vzb0tDe1ILeemhFlv1fHzs'
					}, function(data) {
						var output;
						$.each(data.items, function(i, item) {
							console.log(item);
							vTitle = item.snippet.title;
							vId = item.snippet.channelId;
							vDe = item.snippet.description;
							vTh = item.snippet.channelTitle;
							vaaa = item.snippet.thumbnails.standard.url;
							output = '<li>' + vTitle + '<br>--videoid: ' + vId
									+ '<br>--videodescription: ' + vDe
									+ '<br>--videothumbnails: ' + vTh
									+ '<br><img src ="' + vaaa + '"></li>'; 
									/*output= '<li>'+vTitle+'<iframe src=\"//www.youtube.com/embed/'+vId+'\"></iframe></li>';*/
							$("div").append(output);
						})
					});
				});
	</script>
</body>
</html>
