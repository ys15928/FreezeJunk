package com.care.root.youtube.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class YoutubeController {

	@RequestMapping("/main/keywordFreeze")
	public String keywordFreeze(HttpServletRequest request) {
		return "freezejunk/keywordFreeze";
	}


	@RequestMapping("/main/accountFreeze")
	public String accountFreeze(HttpServletRequest request) {
		return "freezejunk/accountFreeze";
	}


	@RequestMapping("/main/copyCommentFreeze")
	public String copyCommentFreeze(HttpServletRequest request) {
		return "freezejunk/copyCommentFreeze";
	}

}