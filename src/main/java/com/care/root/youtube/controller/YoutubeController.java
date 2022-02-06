package com.care.root.youtube.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.care.root.youtube.service.YoutubeService;

@Controller
public class YoutubeController {
	@Autowired
	YoutubeService service;

	@RequestMapping("/insertURL")
	public String viewMain() {
		return "freezejunk/insertUrl";
	}
	
	
	@RequestMapping("/junkResult")
	public String viewResult(HttpServletRequest request) {
		String url = request.getParameter("url");
		System.out.println("입력된 URL : " + url);
		
		service.makeURLtxt(url);
		service.runCrawling();
		
		return "freezejunk/junkResult";
	}
}
