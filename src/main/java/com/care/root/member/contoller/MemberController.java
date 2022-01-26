package com.care.root.member.contoller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.care.root.member.dto.MemberDTO;
import com.care.root.member.service.MemberService;

@Controller
public class MemberController {
	@Autowired
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
	
	@RequestMapping(value="memberSuc", method=RequestMethod.POST)
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
	
	@RequestMapping(value="idcheck", method=RequestMethod.POST, produces="application/json; charset=utf-8")
	@ResponseBody
	public Map idcheck(@RequestBody Map dto) {
		System.out.println(dto.get("id"));
		String id= (String)dto.get("id");
		Map map = new HashMap();
		map.put("idcheck", service.idcheck(id));
		return map;
	}
	@RequestMapping(value="emailcheck", method=RequestMethod.POST, produces = "application/json; charset=utf-8")
	@ResponseBody
	public Map emailcheck(@RequestBody Map dto) {
		String email = (String)dto.get("email");
		Map map = new HashMap();
		map.put("emailcheck", service.emailcheck(email));
		return map;
	}
	
	@RequestMapping(value="emailgoNum", method=RequestMethod.POST, produces = "application/json; charset=utf-8")
	@ResponseBody
	public Map emailgoNum(@RequestBody Map dto,Model model) {
		String email = (String)dto.get("email");
		System.out.println(email);
		Map map = new HashMap();
		service.emailgoNum(email,model);
		map.put("certified", model.getAttribute("certified"));
		return map;
	}
	
	
	
}
