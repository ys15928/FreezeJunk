package com.care.root.mybatis;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import com.care.root.member.dto.MemberDTO;

public interface MemberMapper {
	public MemberDTO idcheck(String id);
	public MemberDTO emailcheck(String email);
	public int register(MemberDTO dto);
	public MemberDTO loginChk(MemberDTO dto);
	public String getName(String id);
	public ArrayList<MemberDTO> userList(String search);
}
