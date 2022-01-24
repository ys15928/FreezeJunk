package com.care.root.member.contoller;

import org.springframework.web.bind.annotation.RequestMapping;

public class MemberController {
	@RequestMapping("header")
	public String loginError() {
		return "default/header";
	}
}
