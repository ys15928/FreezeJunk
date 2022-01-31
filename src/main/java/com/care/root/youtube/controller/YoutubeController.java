package com.care.root.youtube.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.care.root.youtube.service.YoutubeService;

@Controller
public class YoutubeController {
	@Autowired
	YoutubeService service;

	
	@RequestMapping("/main")
	public String viewMain() {
		
		service.runCrawling();
	 
		
		return "youtube/youtube";
	}
}
