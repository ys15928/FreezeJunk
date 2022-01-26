package com.care.root.member.service;

import javax.servlet.http.HttpServletRequest;

import com.care.root.member.dto.MemberDTO;
import com.care.root.mybatis.MemberMapper;

public class MemberService {
	MemberMapper mapper;
	
	public int register(HttpServletRequest req) {
		MemberDTO dto = new MemberDTO();
		dto.setId(req.getParameter("id"));
		dto.setPwd(req.getParameter("pwd"));
		dto.setName(req.getParameter("name"));
		dto.setEmail(req.getParameter("email"));
		return mapper.register(null);
	}
}
