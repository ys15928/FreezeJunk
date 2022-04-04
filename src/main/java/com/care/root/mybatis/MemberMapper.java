package com.care.root.mybatis;

import java.util.ArrayList;

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
	public ArrayList<MemberDTO> userListIdDescId(String search);
	public ArrayList<MemberDTO> userListIdAscId(String search);
	public ArrayList<MemberDTO> userListIdDescName(String search);
	public ArrayList<MemberDTO> userListIdAscName(String search);
	public ArrayList<MemberDTO> userListIdDescEmail(String search);
	public ArrayList<MemberDTO> userListIdAscEmail(String search);
	public ArrayList<MemberDTO> userListNameDescId(String search);
	public ArrayList<MemberDTO> userListNameAscId(String search);
	public ArrayList<MemberDTO> userListNameDescName(String search);
	public ArrayList<MemberDTO> userListNameAscName(String search);
	public ArrayList<MemberDTO> userListNameDescEmail(String search);
	public ArrayList<MemberDTO> userListNameAscEmail(String search);
	public ArrayList<MemberDTO> userListEmailDescId(String search);
	public ArrayList<MemberDTO> userListEmailAscId(String search);
	public ArrayList<MemberDTO> userListEmailDescName(String search);
	public ArrayList<MemberDTO> userListEmailAscName(String search);
	public ArrayList<MemberDTO> userListEmailDescEmail(String search);
	public ArrayList<MemberDTO> userListEmailAscEmail(String search);
	public int iddelete(String id);
}
