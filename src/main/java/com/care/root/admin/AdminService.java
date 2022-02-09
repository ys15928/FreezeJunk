package com.care.root.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.care.root.member.dto.MemberDTO;
import com.care.root.mybatis.MemberMapper;

@Service
public class AdminService {
	@Autowired
	MemberMapper mapper;
	
	public void userList(Model model, HttpServletRequest req) {
		String search = req.getParameter("search");
		if(search == null) {
			search = "";
		}
		List<MemberDTO> list = mapper.userList(search);
		model.addAttribute("list", list);
		model.addAttribute("search", search);
	}
}
