package com.care.root.youtube.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.care.root.mybatis.YoutubeMapper;
import com.care.root.youtube.dto.YoutubeDTO;

import jep.Jep;
import jep.JepException;

@Service
public class YoutubeService implements YoutubeServiceImpl {
	@Autowired
	YoutubeMapper mapper;
	YoutubeDTO dto = new YoutubeDTO();

	public void runCrawling() {
		System.out.println("Youtube Service 실행");

		try (Jep jep = new Jep(false)) {

			// jep.set("test1", "aa");
			
			
			jep.runScript("E:\\FreezeJunk\\src\\main\\webapp\\resources\\youtube\\crawlingPython.py");

			//System.out.println("response : " + jep.getValue("response"));

			jep.close();
		} catch (JepException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}