package com.care.root.youtube.controller;

import java.io.IOException;
import java.security.GeneralSecurityException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.care.root.youtube.service.youtubeService;

@Controller
public class YoutubeController {
	@Autowired
	youtubeService service;

	@RequestMapping("/keywordFreeze")
	public String keywordFreeze() {
		return "freezejunk/keywordFreeze";
	}
	
	@RequestMapping("/keywordFreezeResult")
	public String KeywordFreezeResult(HttpServletRequest request) {
		String videoUrl = request.getParameter("videoUrl");
		String keywords = request.getParameter("keywords");
		try {
			service.crawling(videoUrl);
			//service.filter(keywords);
			//service.setMarkSpam("UCIySAp3z5U12HR-50Lsc6qA");
			//service.setDelete("UgzNYQVb3VUga1Tk7Sl4AaABAg.9YAdBHn9IZw9YAdBi6kUM4");
		} catch (GeneralSecurityException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "freezejunk/keywordFreezeResult";
	}
	
	
	/*@RequestMapping("/accountFreeze")
	public String accountFreeze() {
		return "freezejunk/accountFreeze";
	}
	
	@RequestMapping("/accountFreezeResult")
	public String accountFreezeResult(HttpServletRequest request) {
		String url = request.getParameter("url");
		//service.setMarkSpam();
		return "freezejunk/accountFreezeResult";
	}
	
	
	@RequestMapping("/copyCommentFreeze")
	public String copyCommentFreeze() {
		return "freezejunk/copyCommentFreeze";
	}
	
	@RequestMapping("/copyCommentFreezeResult")
	public String copyCommentFreezeResult(HttpServletRequest request) {
		String url = request.getParameter("url");
		
		return "freezejunk/copyCommentFreezeResult";
	}*/
}
