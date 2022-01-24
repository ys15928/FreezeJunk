package com.care.root.youtube.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.care.root.mybatis.YoutubeMapper;
import com.care.root.youtube.dto.YoutubeDTO;

@Service
public class YoutubeService implements YoutubeServiceImpl{
	@Autowired YoutubeMapper mapper;
	YoutubeDTO dto = new YoutubeDTO(); 
	
	public void youtubeService() {
		System.out.println("Youtube Service 실행");
	}
	
}