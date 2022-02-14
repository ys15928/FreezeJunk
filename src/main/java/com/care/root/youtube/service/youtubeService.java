package com.care.root.youtube.service;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.api.client.auth.oauth2.Credential;
import com.google.api.client.extensions.java6.auth.oauth2.AuthorizationCodeInstalledApp;
import com.google.api.client.extensions.jetty.auth.oauth2.LocalServerReceiver;
import com.google.api.client.googleapis.auth.oauth2.GoogleAuthorizationCodeFlow;
import com.google.api.client.googleapis.auth.oauth2.GoogleClientSecrets;
import com.google.api.client.googleapis.javanet.GoogleNetHttpTransport;
import com.google.api.client.googleapis.json.GoogleJsonResponseException;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.client.json.JsonFactory;
import com.google.api.client.json.jackson2.JacksonFactory;
import com.google.api.client.util.DateTime;
import com.google.api.services.youtube.YouTube;
import com.google.api.services.youtube.model.Comment;
import com.google.api.services.youtube.model.CommentSnippet;
import com.google.api.services.youtube.model.CommentThreadListResponse;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import java.io.FileWriter;
import java.io.IOException;
import java.security.GeneralSecurityException;
import java.util.Arrays;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.io.InputStream;
import java.io.InputStreamReader;
import com.care.root.mybatis.YoutubeMapper;
import com.care.root.youtube.dto.YoutubeDTO;

@Service
public class youtubeService {
	@Autowired
	YoutubeMapper mapper;
	YoutubeDTO dto = new YoutubeDTO();
	
	JSONObject allCommentData;

	// Crawling Comments(동영상 URL의 vidoeID를 이용)
	private static final String DEVELOPER_KEY = "AIzaSyBQyyjxukCf2vzb0tDe1ILeemhFlv1fHzs";
	private static final String APPLICATION_NAME = "FreezeJunk";
	private static final JsonFactory JSON_FACTORY = JacksonFactory.getDefaultInstance();

	public static YouTube getServiceCrawling() throws GeneralSecurityException, IOException {
		final NetHttpTransport httpTransport = GoogleNetHttpTransport.newTrustedTransport();
		return new YouTube.Builder(httpTransport, JSON_FACTORY, null).setApplicationName(APPLICATION_NAME).build();
	}

	public void crawling(String videoUrl) throws GeneralSecurityException, IOException, GoogleJsonResponseException {
		String[] videoId = videoUrl.split("\\?v=");
		YouTube youtubeService = getServiceCrawling();
		YouTube.CommentThreads.List request = youtubeService.commentThreads().list("snippet,replies");
		CommentThreadListResponse response = request.setKey(DEVELOPER_KEY).setMaxResults(100L).setOrder("relevance")
				.setTextFormat("plainText").setVideoId(videoId[1]).setPrettyPrint(true).execute();

		// 크롷링 결과를 확인하기 위한 crawlingResult.json 파일 생성
		try {
			Gson gson = new GsonBuilder().setPrettyPrinting().create();
			String prettyResponse = gson.toJson(response);
			FileWriter file = new FileWriter(
					"E:\\FreezeJunk\\src\\main\\webapp\\resources\\youtube\\crawlingResult.json");
			file.write(prettyResponse);
			file.flush();
			file.close();
		} catch (IOException e) {
			e.printStackTrace();
		}

		int commentCount = 0;
		allCommentData = new JSONObject();

		while (true) {

			for (int i = 0; i < response.getItems().size(); i++) {
				Comment comment = response.getItems().get(i).getSnippet().getTopLevelComment();
				CommentSnippet snippet = comment.getSnippet();

				String commentId = comment.getId();
				String authorName = snippet.getAuthorDisplayName();
				String authorChannelUrl = snippet.getAuthorChannelUrl();
				DateTime publishedAt = snippet.getPublishedAt();
				String text = snippet.getTextOriginal();

				long dateToSec = publishedAt.getValue() / 1000;
				String strDateToSec = String.valueOf(dateToSec);

				JSONObject data = new JSONObject();
				data.put("commentId", commentId);
				data.put("authorName", authorName);
				data.put("authorChannelUrl", authorChannelUrl);
				data.put("strDateToSec", strDateToSec);
				data.put("text", text);

				JSONArray commentArray = new JSONArray();
				commentArray.add(data);
				commentCount++;
				allCommentData.put("commentArray" + commentCount, commentArray);

				if (response.getItems().get(i).getReplies() != null) {
					List<Comment> replies = response.getItems().get(i).getReplies().getComments();

					for (int j = 0; j < replies.size(); j++) {
						Comment reply = replies.get(j);
						CommentSnippet replySnippet = reply.getSnippet();

						String replyId = reply.getId();
						String replyAuthorName = replySnippet.getAuthorDisplayName();
						String replyAuthorChannelUrl = replySnippet.getAuthorChannelUrl();
						DateTime replyPublishedAt = replySnippet.getPublishedAt();
						String replyText = replySnippet.getTextOriginal();

						long replyDateToSec = replyPublishedAt.getValue() / 1000;
						String strReplyDateToSec = String.valueOf(replyDateToSec);

						data = new JSONObject();
						data.put("commentId", replyId);
						data.put("authorName", replyAuthorName);
						data.put("authorChannelUrl", replyAuthorChannelUrl);
						data.put("strDateToSec", strReplyDateToSec);
						data.put("text", replyText);

						commentArray = new JSONArray();
						commentArray.add(data);
						commentCount++;
						allCommentData.put("commentArray" + commentCount, commentArray);
					}
				}
			}

			if (response.getNextPageToken() != null)
				response = request.setKey(DEVELOPER_KEY).setMaxResults(100L).setOrder("relevance")
						.setPageToken(response.getNextPageToken()).setTextFormat("plainText").setVideoId(videoId[1])
						.setPrettyPrint(true).execute();
			else
				break;
		}

		// commentArray을 확인하기 위한 commentArray.json 파일 생성
		try {
			Gson gson = new GsonBuilder().setPrettyPrinting().create();
			String strAllCommentData = gson.toJson(allCommentData);
			FileWriter file = new FileWriter(
					"E:\\FreezeJunk\\src\\main\\webapp\\resources\\youtube\\allCommentData.json");
			file.write(strAllCommentData);
			file.flush();
			file.close();
		} catch (IOException e) {
			e.printStackTrace();
		}

		for (int i=1 ; i <= allCommentData.size() ; i++) {
			//JSONObject commentArrayData = (JSONObject) allCommentData.get("commentArray" + i);
			//System.out.println(commentArrayData.get("text"));

		}
		
	}

	/*
	 * public void filter(String keywords) { System.out.println(commentArray);
	 * 
	 * ListIterator<ArrayList<String>> iterator = commentArray.listIterator();
	 * 
	 * while (iterator.hasNext()) {
	 * System.out.println(commentArray.indexOf("테스트테스트"));
	 * System.out.println(iterator.next()); } }
	 */

	// 댓글 삭제 및 스팸계정 등록 준비
	private static final String CLIENT_SECRETS = "client_secret.json";
	private static final Collection<String> SCOPES = Arrays.asList("https://www.googleapis.com/auth/youtube.force-ssl");

	public static Credential authorize(final NetHttpTransport httpTransport) throws IOException {
		InputStream in = youtubeService.class.getResourceAsStream(CLIENT_SECRETS);
		GoogleClientSecrets clientSecrets = GoogleClientSecrets.load(JSON_FACTORY, new InputStreamReader(in));
		GoogleAuthorizationCodeFlow flow = new GoogleAuthorizationCodeFlow.Builder(httpTransport, JSON_FACTORY,
				clientSecrets, SCOPES).build();
		Credential credential = new AuthorizationCodeInstalledApp(flow, new LocalServerReceiver()).authorize("user");

		return credential;
	}

	public static YouTube getService() throws GeneralSecurityException, IOException {
		final NetHttpTransport httpTransport = GoogleNetHttpTransport.newTrustedTransport();
		Credential credential = authorize(httpTransport);

		return new YouTube.Builder(httpTransport, JSON_FACTORY, credential).setApplicationName(APPLICATION_NAME)
				.build();
	}

	// Mark Spam(댓글 드래그 해서 바로 넣으면 들어가는 채널 id를 이용)
	public void setMarkSpam(String channelId)
			throws GeneralSecurityException, IOException, GoogleJsonResponseException {
		System.out.println("setMarkSpam 실행");
		YouTube youtubeService = getService();
		YouTube.Comments.MarkAsSpam request = youtubeService.comments().markAsSpam(channelId);
		request.execute();
	}

	// Delete Comment (댓글의 id를 이용)
	public void setDelete(String commentId) throws GeneralSecurityException, IOException, GoogleJsonResponseException {
		System.out.println("setDelete 실행");
		YouTube youtubeService = getService();
		YouTube.Comments.Delete request = youtubeService.comments().delete(commentId);
		request.execute();
	}
}