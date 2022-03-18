package com.care.root.mybatis;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.care.root.suggestion.dto.SuggestionDTO;

public interface SuggestionMapper {
	public int write(SuggestionDTO dto);
	public ArrayList<SuggestionDTO> allList(@Param("s")int start, @Param("e")int end, @Param("search")String search);
	public ArrayList<SuggestionDTO> myList(@Param("s")int start, @Param("e")int end, @Param("search")String search, @Param("id") String id);
	public int allListCount(String search);
	public int myListCount(@Param("id")String id, @Param("search")String search);
	public SuggestionDTO info(int num);
	public int answer(SuggestionDTO dto);
	public int update(SuggestionDTO dto);
	public int delete(int num);
}
