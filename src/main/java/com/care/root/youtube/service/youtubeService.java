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
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
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

	// Crawling Comments(동영상 URL의 vidoeID를 이용)
	private static final String DEVELOPER_KEY = "AIzaSyBQyyjxukCf2vzb0tDe1ILeemhFlv1fHzs";
	private static final String APPLICATION_NAME = "FreezeJunk";
	private static final JsonFactory JSON_FACTORY = JacksonFactory.getDefaultInstance();

	public static YouTube getServiceCrawling() throws GeneralSecurityException, IOException {
		final NetHttpTransport httpTransport = GoogleNetHttpTransport.newTrustedTransport();
		return new YouTube.Builder(httpTransport, JSON_FACTORY, null).setApplicationName(APPLICATION_NAME).build();
	}

	JSONObject allCommentData;

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
				String text = snippet.getTextOriginal();

				DateTime publishedAt = snippet.getPublishedAt();
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
						String replyText = replySnippet.getTextOriginal();

						DateTime replyPublishedAt = replySnippet.getPublishedAt();
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

			if (response.getNextPageToken() != null) {
				response = request.setKey(DEVELOPER_KEY).setMaxResults(100L).setOrder("relevance")
						.setPageToken(response.getNextPageToken()).setTextFormat("plainText").setVideoId(videoId[1])
						.setPrettyPrint(true).execute();
			} else
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
	}

	public void filterForDelete(String inputKeywords)
			throws GoogleJsonResponseException, GeneralSecurityException, IOException {
		String listCommentId = new String();
		String keywordList[] = inputKeywords.split(",");
		System.out.println("inputKeywords = " + inputKeywords);

		for (int i = 1; i <= allCommentData.size(); i++) {
			JSONArray commentArrayData = (JSONArray) allCommentData.get("commentArray" + i);
			JSONObject obj = (JSONObject) commentArrayData.get(0);
			String commentId = (String) obj.get("commentId");
			String text = (String) obj.get("text");

			// filtering to Delete Keywords
			for (int j = 0; j < keywordList.length; j++) {

				if (text.contains(keywordList[j])) {
					listCommentId += commentId + ", ";
				}
			}
		}

		if (listCommentId.length() >= 2)
			listCommentId = listCommentId.substring(0, listCommentId.length() - 2);
		
		System.out.println("삭제해야할 댓글 Id = " + listCommentId);
		setSpamAndDelete(listCommentId, false);
	}

	// setModerationStatus (댓글 드래그 해서 바로 넣으면 들어가는 채널 id로 비교 후 해당 댓글의 commentId를 이용)
	public void filterForSpamAccount(String inputAccounts) {
		String listCommentId = new String();
		String accountList[] = inputAccounts.split(",");
		System.out.println("inputAccounts = " + inputAccounts);

		for (int i = 1; i <= allCommentData.size(); i++) {
			JSONArray commentArrayData = (JSONArray) allCommentData.get("commentArray" + i);
			JSONObject obj = (JSONObject) commentArrayData.get(0);
			String authorChannelUrl = (String) obj.get("authorChannelUrl");
			String[] authorChannelId = authorChannelUrl.split("channel/");
			String commentId = (String) obj.get("commentId");

			for (int j = 0; j < accountList.length; j++) {

				if (accountList[j].contains(authorChannelId[1])) {
					listCommentId += commentId + ", ";
				}
			}
		}
		
		if (listCommentId.length() >= 2)
			listCommentId = listCommentId.substring(0, listCommentId.length() - 2);
		
		System.out.println("스팸 등록할 계정의 댓글 Id = " + listCommentId);
		// setSpamAndDelete(listCommentId, true);
	}

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

	public void setSpamAndDelete(String channelId, boolean setBanAuthor)
			throws GeneralSecurityException, IOException, GoogleJsonResponseException {
		System.out.println("setSpamAndDelete 실행");
		YouTube youtubeService = getService();

		// "rejected" setBanAuthor(true) => 차단 및 삭제 / "rejected" setBanAuthor(false) =>
		// 삭제만
		YouTube.Comments.SetModerationStatus request = youtubeService.comments().setModerationStatus(channelId,
				"rejected");
		request.setBanAuthor(setBanAuthor).execute();

	}
}