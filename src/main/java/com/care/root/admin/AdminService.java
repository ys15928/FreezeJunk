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
		String option = req.getParameter("option");
		if(option == null) {
			option = "1";
		}
		List<MemberDTO> list = null;
		
		if(option.equals("1")) {
			list = mapper.userListId(search);
		} else if(option.equals("2")) {
			list = mapper.userListName(search);
		} else if(option.equals("3")) {
			list = mapper.userListEmail(search);
		}
		
		model.addAttribute("list", list);
		model.addAttribute("search", search);
		model.addAttribute("option", option);
	}
}
