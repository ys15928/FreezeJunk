package com.care.root.mybatis;

import javax.servlet.http.HttpServletRequest;

import com.care.root.member.dto.MemberDTO;

public interface MemberMapper {
	public int register(MemberDTO dto);
}
