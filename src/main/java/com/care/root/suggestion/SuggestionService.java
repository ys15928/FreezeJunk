package com.care.root.suggestion;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.care.root.member.dto.MemberDTO;
import com.care.root.mybatis.SuggestionMapper;

@Service
public class SuggestionService {
	@Autowired
	SuggestionMapper mapper;
	
	public int write(HttpServletRequest req) {
		SuggestionDTO dto = new SuggestionDTO();
		HttpSession session = req.getSession();
		MemberDTO loginUser = (MemberDTO) session.getAttribute("loginUser");
		dto.setSuggId(loginUser.getId());
		dto.setSuggTitle(req.getParameter("title"));
		dto.setSuggContent(req.getParameter("content"));
		if(req.getParameterValues("status") == null) {
			dto.setSuggStatus("0");
		} else {
			dto.setSuggStatus("1");
		}
		dto.setAnswContent(null);
		dto.setAnswTime(null);
		return mapper.write(dto);
	}
	
	public void allList(HttpServletRequest req, Model model) {
		String search = req.getParameter("search");
		int pageSize = 10;
		if(search == null) {
			search = "";
		}
		String currentPage = req.getParameter("currentPage");
		if(currentPage == null) {
			currentPage = "1";
		}
		int pageNum = Integer.parseInt(currentPage);
		int count = mapper.allListCount(search);
		int startRow = (pageNum - 1) * pageSize + 1;
		int endRow = pageNum * pageSize;
		
		model.addAttribute("list", mapper.allList(startRow, endRow, search));
		model.addAttribute("count", count);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("search", search);
	}
	
	public void info(HttpServletRequest req, Model model) {
		int num = Integer.parseInt(req.getParameter("num"));
		SuggestionDTO dto = mapper.info(num);
		model.addAttribute("dto", dto);
	}
	public int answer(HttpServletRequest req) {
		SuggestionDTO dto = new SuggestionDTO();
		dto.setNum(Integer.parseInt(req.getParameter("num")));
		dto.setAnswContent(req.getParameter("content"));
		return mapper.answer(dto);
	}
	
	public int update(HttpServletRequest req) {
		SuggestionDTO dto = new SuggestionDTO();
		HttpSession session = req.getSession();
		MemberDTO loginUser = (MemberDTO) session.getAttribute("loginUser");
		dto.setNum(Integer.parseInt(req.getParameter("num")));
		dto.setSuggId(loginUser.getId());
		dto.setSuggTitle(req.getParameter("title"));
		dto.setSuggContent(req.getParameter("content"));
		if(req.getParameterValues("status") == null) {
			dto.setSuggStatus("0");
		} else {
			dto.setSuggStatus("1");
		}
		dto.setAnswContent(null);
		dto.setAnswTime(null);
		return mapper.update(dto);
	}
	
	public int delete(HttpServletRequest req) {
		int num = Integer.parseInt(req.getParameter("num"));
		return mapper.delete(num);
	}
}
