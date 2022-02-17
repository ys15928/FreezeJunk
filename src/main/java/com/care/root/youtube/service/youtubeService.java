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
import java.util.List;
import java.io.InputStream;
import java.io.InputStreamReader;
import com.care.root.mybatis.YoutubeMapper;
import com.care.root.youtube.dto.YoutubeDTO;

@Service
public class YoutubeService {
	@Autowired
	YoutubeMapper mapper;
	YoutubeDTO dto = new YoutubeDTO();

	Gson gson;
	FileWriter file;
	JSONObject commentJsonObj, resultCommentData, commentArrayData, commentArrayDataTarget;
	JSONArray commentArray, commentArrayTarget;
	String[] videoId, keywordList, accountList, authorChannelId;
	String commentId, authorName, authorChannelUrl, commentText, strDateToSec, strResultCommentData, junkCommentIdList,
			authorNameTarget, strDateToSecTarget, commentTextTarget, commentIdTarget;
	Comment comment, reply;
	CommentSnippet snippet, replySnippet;
	DateTime publishedAt, replyPublishedAt;
	int commentCount;
	long dateToSec, replyDateToSec;

	private static final String DEVELOPER_KEY = "AIzaSyBQyyjxukCf2vzb0tDe1ILeemhFlv1fHzs";
	private static final String APPLICATION_NAME = "FreezeJunk";
	private static final JsonFactory JSON_FACTORY = JacksonFactory.getDefaultInstance();

	// 크롤링 하기 위한 Service 준비
	public static YouTube getServiceCrawling() throws GeneralSecurityException, IOException {
		final NetHttpTransport httpTransport = GoogleNetHttpTransport.newTrustedTransport();
		return new YouTube.Builder(httpTransport, JSON_FACTORY, null).setApplicationName(APPLICATION_NAME).build();
	}

	// 전체 댓글 크롤링
	public void crawlingAll(String videoUrl) throws GeneralSecurityException, IOException, GoogleJsonResponseException {
		videoId = videoUrl.split("\\?v=");
		YouTube youtubeService = getServiceCrawling();
		YouTube.CommentThreads.List request = youtubeService.commentThreads().list("snippet,replies");
		CommentThreadListResponse response = request.setKey(DEVELOPER_KEY).setMaxResults(100L).setOrder("relevance")
				.setTextFormat("plainText").setVideoId(videoId[1]).setPrettyPrint(true).execute();

		commentCount = 0;
		resultCommentData = new JSONObject();

		while (true) {

			for (int i = 0; i < response.getItems().size(); i++) {
				comment = response.getItems().get(i).getSnippet().getTopLevelComment();
				snippet = comment.getSnippet();

				commentId = comment.getId();
				authorName = snippet.getAuthorDisplayName();
				authorChannelUrl = snippet.getAuthorChannelUrl();
				commentText = snippet.getTextOriginal();

				publishedAt = snippet.getPublishedAt();
				dateToSec = publishedAt.getValue() / 1000;
				strDateToSec = String.valueOf(dateToSec);

				commentJsonObj = new JSONObject();
				commentJsonObj.put("commentId", commentId);
				commentJsonObj.put("authorName", authorName);
				commentJsonObj.put("authorChannelUrl", authorChannelUrl);
				commentJsonObj.put("strDateToSec", strDateToSec);
				commentJsonObj.put("text", commentText);

				commentArray = new JSONArray();
				commentArray.add(commentJsonObj);
				commentCount++;
				resultCommentData.put("commentArray" + commentCount, commentArray);

				if (response.getItems().get(i).getReplies() != null) {
					List<Comment> replies = response.getItems().get(i).getReplies().getComments();

					for (int j = 0; j < replies.size(); j++) {
						reply = replies.get(j);
						replySnippet = reply.getSnippet();

						commentId = reply.getId();
						authorName = replySnippet.getAuthorDisplayName();
						authorChannelUrl = replySnippet.getAuthorChannelUrl();
						commentText = replySnippet.getTextOriginal();

						publishedAt = replySnippet.getPublishedAt();
						dateToSec = publishedAt.getValue() / 1000;
						strDateToSec = String.valueOf(dateToSec);

						commentJsonObj = new JSONObject();
						commentJsonObj.put("commentId", commentId);
						commentJsonObj.put("authorName", authorName);
						commentJsonObj.put("authorChannelUrl", authorChannelUrl);
						commentJsonObj.put("strDateToSec", strDateToSec);
						commentJsonObj.put("text", commentText);

						commentArray = new JSONArray();
						commentArray.add(commentJsonObj);
						commentCount++;
						resultCommentData.put("commentArray" + commentCount, commentArray);
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
			gson = new GsonBuilder().setPrettyPrinting().create();
			strResultCommentData = gson.toJson(resultCommentData);
			file = new FileWriter("E:\\FreezeJunk\\src\\main\\webapp\\resources\\youtube\\allCommentData.json");
			file.write(strResultCommentData);
			file.flush();
			file.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	// 카피 댓글을 찾기 위한 인기순 상위 50개 댓글 크롤링
	public void crawlingTop50(String videoUrl)
			throws GeneralSecurityException, IOException, GoogleJsonResponseException {

		videoId = videoUrl.split("\\?v=");
		YouTube youtubeService = getServiceCrawling();
		YouTube.CommentThreads.List request = youtubeService.commentThreads().list("snippet");
		CommentThreadListResponse response = request.setKey(DEVELOPER_KEY).setMaxResults(50L).setOrder("relevance")
				.setTextFormat("plainText").setVideoId(videoId[1]).setPrettyPrint(true).execute();

		commentCount = 0;
		resultCommentData = new JSONObject();

		for (int i = 0; i < response.getItems().size(); i++) {
			comment = response.getItems().get(i).getSnippet().getTopLevelComment();
			snippet = comment.getSnippet();

			commentId = comment.getId();
			authorName = snippet.getAuthorDisplayName();
			authorChannelUrl = snippet.getAuthorChannelUrl();
			commentText = snippet.getTextOriginal();

			publishedAt = snippet.getPublishedAt();
			dateToSec = publishedAt.getValue() / 1000;
			strDateToSec = String.valueOf(dateToSec);

			commentJsonObj = new JSONObject();
			commentJsonObj.put("commentId", commentId);
			commentJsonObj.put("authorName", authorName);
			commentJsonObj.put("authorChannelUrl", authorChannelUrl);
			commentJsonObj.put("strDateToSec", strDateToSec);
			commentJsonObj.put("text", commentText);

			commentArray = new JSONArray();
			commentArray.add(commentJsonObj);
			commentCount++;
			resultCommentData.put("commentArray" + commentCount, commentArray);
		}

		// commentArray을 확인하기 위한 commentArray.json 파일 생성
		try {
			gson = new GsonBuilder().setPrettyPrinting().create();
			strResultCommentData = gson.toJson(resultCommentData);
			file = new FileWriter("E:\\FreezeJunk\\src\\main\\webapp\\resources\\youtube\\top50CommentData.json");
			file.write(strResultCommentData);
			file.flush();
			file.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	// keywords 포함한 댓글의 comment id 추출
	public void filterForDelete(String videoUrl, String inputKeywords)
			throws GoogleJsonResponseException, GeneralSecurityException, IOException {

		if ((!inputKeywords.equals(" ")) && (!inputKeywords.equals(""))) {
			crawlingAll(videoUrl);
			junkCommentIdList = new String();
			keywordList = inputKeywords.split(",");

			for (int i = 1; i <= resultCommentData.size(); i++) {
				commentArray = (JSONArray) resultCommentData.get("commentArray" + i);
				commentArrayData = (JSONObject) commentArray.get(0);
				commentId = (String) commentArrayData.get("commentId");
				commentText = (String) commentArrayData.get("text");

				for (int j = 0; j < keywordList.length; j++) {

					if (commentText.contains(keywordList[j])) {
						junkCommentIdList += commentId + ", ";
					}
				}
			}

			if (junkCommentIdList.length() >= 2) {
				junkCommentIdList = junkCommentIdList.substring(0, junkCommentIdList.length() - 2);
				setSpamAndDelete(junkCommentIdList, false);
			} else {
				System.out.println("NO TARGET HERE");
			}
		}

		else {
			System.out.println("NO KEYOWRDS INPUT");
		}
	}

	// 차단하고자하는 계정의 모든 댓글 comment id 추출
	public void filterForSpamAccount(String videoUrl, String inputAccounts)
			throws GoogleJsonResponseException, GeneralSecurityException, IOException {

		if ((!inputAccounts.equals(" ")) && (!inputAccounts.equals(""))) {
			crawlingAll(videoUrl);
			junkCommentIdList = new String();
			accountList = inputAccounts.split(",");

			for (int i = 1; i <= resultCommentData.size(); i++) {
				commentArray = (JSONArray) resultCommentData.get("commentArray" + i);
				commentArrayData = (JSONObject) commentArray.get(0);
				authorChannelUrl = (String) commentArrayData.get("authorChannelUrl");
				authorChannelId = authorChannelUrl.split("channel/");
				commentId = (String) commentArrayData.get("commentId");

				for (int j = 0; j < accountList.length; j++) {

					if (accountList[j].contains(authorChannelId[1])) {
						junkCommentIdList += commentId + ", ";
					}
				}
			}

			if (junkCommentIdList.length() >= 2) {
				junkCommentIdList = junkCommentIdList.substring(0, junkCommentIdList.length() - 2);
				setSpamAndDelete(junkCommentIdList, true);
			} else {
				System.out.println("NO TARGET HERE");
			}
		}
		else {
			System.out.println("NO ACCOUNT INPUT");
		}
	}

	// 같은 내용, 더 늦게 달린 댓글의 comment id 추출
	public void filterForcopyBot(String videoUrl)
			throws GoogleJsonResponseException, GeneralSecurityException, IOException {

		crawlingTop50(videoUrl);
		junkCommentIdList = new String();

		for (int i = 1; i <= resultCommentData.size(); i++) {
			commentArray = (JSONArray) resultCommentData.get("commentArray" + i);
			commentArrayData = (JSONObject) commentArray.get(0);
			authorName = (String) commentArrayData.get("authorName");
			strDateToSec = (String) commentArrayData.get("strDateToSec");
			commentText = (String) commentArrayData.get("text");
			commentId = (String) commentArrayData.get("commentId");

			for (int j = i; j < resultCommentData.size(); j++) {

				commentArrayTarget = (JSONArray) resultCommentData.get("commentArray" + j);
				commentArrayDataTarget = (JSONObject) commentArrayTarget.get(0);
				authorNameTarget = (String) commentArrayDataTarget.get("authorName");
				strDateToSecTarget = (String) commentArrayDataTarget.get("strDateToSec");
				commentTextTarget = (String) commentArrayDataTarget.get("text");
				commentIdTarget = (String) commentArrayDataTarget.get("commentId");

				if ((commentText.equals(commentTextTarget)) && (!commentId.equals(commentIdTarget))) {

					if (Integer.parseInt(strDateToSec) > Integer.parseInt(strDateToSecTarget)) {
						if (!junkCommentIdList.contains(commentId))
							junkCommentIdList += commentId + ", ";
					}

					else {
						if (!junkCommentIdList.contains(commentIdTarget))
							junkCommentIdList += commentIdTarget + ", ";
					}
				}
			}
		}

		if (junkCommentIdList.length() >= 2) {
			junkCommentIdList = junkCommentIdList.substring(0, junkCommentIdList.length() - 2);
			setSpamAndDelete(junkCommentIdList, true);
		} else {
			System.out.println("NO BOT HERE");
		}

	}

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

	// 삭제 및 스팸 설정 하기 위한 Service 준비
	public static YouTube getService() throws GeneralSecurityException, IOException {
		final NetHttpTransport httpTransport = GoogleNetHttpTransport.newTrustedTransport();
		Credential credential = authorize(httpTransport);

		return new YouTube.Builder(httpTransport, JSON_FACTORY, credential).setApplicationName(APPLICATION_NAME)
				.build();
	}

	// 삭제 및 스팸 설정 실행
	public void setSpamAndDelete(String commentId, boolean setBanAuthor)
			throws GeneralSecurityException, IOException, GoogleJsonResponseException {
		YouTube youtubeService = getService();

		YouTube.Comments.SetModerationStatus request = youtubeService.comments().setModerationStatus(commentId,
				"rejected");
		request.setBanAuthor(setBanAuthor).execute();

	}
}