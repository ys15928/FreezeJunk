package com.care.root.mybatis;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;

import com.care.root.member.dto.MemberDTO;

public interface MemberMapper {
	public MemberDTO idcheck(String id);
	public MemberDTO emailcheck(String email);
	public int register(MemberDTO dto);
	public MemberDTO loginChk(MemberDTO dto);
	public String searchId(@Param("name")String name, @Param("email")String email);
	public void searchPwd(@Param("id")String id, @Param("email")String email, @Param("key")String key);
	public MemberDTO mypage(String id);
	public int myupdate(MemberDTO dto);
	public String getName(String id);
	public ArrayList<MemberDTO> userListId(String search);
	public ArrayList<MemberDTO> userListName(String search);
	public ArrayList<MemberDTO> userListEmail(String search);
	public int iddelete(String id);
}
