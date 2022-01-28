package com.care.root.mybatis;

import javax.servlet.http.HttpServletRequest;

import com.care.root.member.dto.MemberDTO;

public interface MemberMapper {
	public MemberDTO idcheck(String id);
	public MemberDTO emailcheck(String email);
	public int register(MemberDTO dto);
}
