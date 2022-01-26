package com.care.root.member.contoller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.care.root.member.service.MemberService;

@Controller
public class MemberController {
	
	MemberService service;
	
	@RequestMapping("header")
	public String header() {
		return "default/header";
	}
	@RequestMapping("footer")
	public String footer() {
		return "default/footer";
	}
	
	@RequestMapping("membership")
	public String membership() {
		return "member/membership";
	}
	
	@RequestMapping("login")
	public String login() {
		return "member/login";
	}
	
	@PostMapping("memberSuc")
	public void resister(HttpServletRequest req, HttpServletResponse res) throws IOException {
		res.setContentType("text/html; charset=utf-8"); // 응답 설정 변경
        PrintWriter out = res.getWriter(); // 화면 출력용 객체
        int result= service.register(req);
        if(result==0) {
        	out.print("<script> alert('회원가입 실패.');location.href='membership';</script>");    	
        }else {
        	out.print("<script> alert('회원가입 성공.');location.href='login';</script>");
        }
	}
	
	
	
}
