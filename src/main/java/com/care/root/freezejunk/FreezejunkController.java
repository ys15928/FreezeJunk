package com.care.root.freezejunk;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class FreezejunkController {
	/*
	@RequestMapping(value="main/freezejunk-1")
	public String urlSearch() {
		return "freezejunk/urlSearch";
	}
	*/
	
	@RequestMapping(value="main/freezejunk-1")
	public String keywordsSearch() {
		return "freezejunk/keywordsSearch";
	}
	
	@RequestMapping(value="main/freezejunk-2")
	public String userSearch() {
		return "freezejunk/userSearch";
	}
}
