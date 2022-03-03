package com.care.root.youtube.controller;

import java.io.IOException;
import java.security.GeneralSecurityException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.care.root.youtube.service.youtubeService;

@Controller
public class youtubeController {
	@Autowired
	youtubeService service;

	@RequestMapping("/main/keywordFreeze")
	public String keywordFreeze(HttpServletRequest request) {
		return "freezejunk/keywordFreeze";
	}

	@RequestMapping(value = "/main/keywordFreezeResult", method = RequestMethod.POST)
	public String keywordFreezeResult(HttpServletRequest request) {
		String videoUrl = request.getParameter("videoUrl");
		String keywords = request.getParameter("keywords");

		try {
			service.filterForDelete(videoUrl, keywords);

		} catch (GeneralSecurityException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return "member/main";
	}

	@RequestMapping("/main/accountFreeze")
	public String accountFreeze(HttpServletRequest request) {
		return "freezejunk/accountFreeze";
	}

	@RequestMapping(value = "/main/accountFreezeResult", method = RequestMethod.POST)
	public String accountFreezeResult(HttpServletRequest request) {
		String videoUrl = request.getParameter("videoUrl");
		String accounts = request.getParameter("accounts");

		try {
			service.filterForSpamAccount(videoUrl, accounts);

		} catch (GeneralSecurityException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "member/main";
	}

	
	@RequestMapping("/main/copyCommentFreeze")
	public String copyCommentFreeze(HttpServletRequest request) {
		return "freezejunk/copyCommentFreeze";
	}

	@RequestMapping(value = "/main/copyCommentFreezeResult", method = RequestMethod.POST)
	public String copyCommentFreezeResult(HttpServletRequest request) {
		String videoUrl = request.getParameter("videoUrl");

		try {
			service.filterForcopyBot(videoUrl);

		} catch (GeneralSecurityException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return "member/main";
	}
}
