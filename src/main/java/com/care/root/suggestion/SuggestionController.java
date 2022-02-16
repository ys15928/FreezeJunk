package com.care.root.suggestion;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class SuggestionController {
	@Autowired
	SuggestionService service;
	
	@RequestMapping(value="main/suggestion-1")
	public String writeView() {
		return "suggestion/write";
	}
	
	@RequestMapping(value="main/suggestion-2", method=RequestMethod.POST)
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
	
	@RequestMapping(value="main/suggestion-3")
	public String list(HttpServletRequest req, Model model) {
		service.list(req, model, 1);
		return "suggestion/allList";
	}
	
	@RequestMapping(value="main/suggestion-4")
	public String myList(HttpServletRequest req, Model model) {
		service.list(req, model, 2);
		return "suggestion/myList";
	}
	
	@RequestMapping(value="main/suggestion-5")
	public String info(HttpServletRequest req, Model model) {
		service.info(req, model);
		return "suggestion/info";
	}
	@RequestMapping(value="main/admin/suggestion-4")
	public String answerForm(HttpServletRequest req, Model model) {
		service.info(req, model);
		return "suggestion/answer";
	}
	
	@RequestMapping(value="main/admin/suggestion-5", method=RequestMethod.POST)
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
	
	@RequestMapping(value="main/suggestion-6")
	public String updateForm(HttpServletRequest req, Model model) {
		service.info(req, model);
		return "suggestion/update";
	}
	
	@RequestMapping(value="main/suggestion-7", method=RequestMethod.POST)
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
	
	@RequestMapping(value="main/suggestion-8", method=RequestMethod.POST)
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
