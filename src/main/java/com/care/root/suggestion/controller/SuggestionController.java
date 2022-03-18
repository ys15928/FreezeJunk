package com.care.root.suggestion.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.care.root.suggestion.service.SuggestionService;

@Controller
public class SuggestionController {
	@Autowired
	SuggestionService service;
	
	@RequestMapping(value="suggestion-1")
	public String writeView() {
		return "suggestion/write";
	}
	
	@RequestMapping(value="suggestion-2", method=RequestMethod.POST)
	public void write(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		resp.setContentType("text/html; charset=utf-8");
		PrintWriter out = resp.getWriter();
		int result = service.write(req);
		if(result == 1) {
			out.print("<script>alert('건의사항이 작성되었습니다.');location.href='suggestion-3';</script>");
		} else {
			out.print("<script>alert('에러가 발생했습니다.');location.href='suggestion-3';</script>");
		}
	}
	
	@RequestMapping(value="suggestion-3")
	public String list(HttpServletRequest req, Model model) {
		service.list(req, model, 1);
		return "suggestion/allList";
	}
	
	@RequestMapping(value="suggestion-4")
	public String myList(HttpServletRequest req, Model model) {
		service.list(req, model, 2);
		return "suggestion/myList";
	}
	
	@RequestMapping(value="suggestion-5")
	public String info(HttpServletRequest req, Model model) {
		service.info(req, model);
		return "suggestion/info";
	}
	@RequestMapping(value="admin/suggestion-4")
	public String answerForm(HttpServletRequest req, Model model) {
		service.info(req, model);
		return "suggestion/answer";
	}
	
	@RequestMapping(value="admin/suggestion-5", method=RequestMethod.POST)
	public void answer(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		resp.setContentType("text/html; charset=utf-8");
		PrintWriter out = resp.getWriter();
		int result = service.answer(req);
		if(result == 1) {
			out.print("<script>alert('답변이 등록되었습니다.');location.href='../suggestion-3';</script>");
		} else {
			out.print("<script>alert('에러가 발생했습니다.');location.href='../suggestion-3';</script>");
		}
	}
	
	@RequestMapping(value="suggestion-6")
	public String updateForm(HttpServletRequest req, Model model) {
		service.info(req, model);
		return "suggestion/update";
	}
	
	@RequestMapping(value="suggestion-7", method=RequestMethod.POST)
	public void update(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		resp.setContentType("text/html; charset=utf-8");
		PrintWriter out = resp.getWriter();
		int result = service.update(req);
		if(result == 1) {
			out.print("<script>alert('게시글이 수정되었습니다.');location.href='suggestion-3';</script>");
		} else {
			out.print("<script>alert('에러가 발생했습니다.');location.href='suggestion-3';</script>");
		}
	}
	
	@RequestMapping(value="suggestion-8", method=RequestMethod.POST)
	public void delete(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		resp.setContentType("text/html; charset=utf-8");
		PrintWriter out = resp.getWriter();
		int result = service.delete(req);
		if(result == 1) {
			out.print("<script>alert('게시글이 삭제되었습니다.');location.href='suggestion-3';</script>");
		} else {
			out.print("<script>alert('에러가 발생했습니다.');location.href='suggestion-3';</script>");
		}
	}
}
