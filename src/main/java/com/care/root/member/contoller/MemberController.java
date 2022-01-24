package com.care.root.member.contoller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberController {
	
	@RequestMapping("header")
	public String header() {
		return "default/header";
	}
	
	@RequestMapping("membership")
	public String membership() {
		return "member/membership";
	}
	
	
	
	
}
