package com.care.root.mybatis;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.care.root.suggestion.SuggestionDTO;

public interface SuggestionMapper {
	public int write(SuggestionDTO dto);
	public ArrayList<SuggestionDTO> allList(@Param("s")int start, @Param("e")int end, @Param("search")String search);
	public int allListCount(String search);
	public SuggestionDTO info(int num);
}
