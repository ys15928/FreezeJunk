package com.care.root.youtube.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.care.root.mybatis.YoutubeMapper;
import com.care.root.youtube.dto.YoutubeDTO;

import jep.*;
import java.io.*;

@Service
public class YoutubeService implements YoutubeServiceImpl {
	@Autowired
	YoutubeMapper mapper;
	YoutubeDTO dto = new YoutubeDTO();
	String filePath = "E:\\FreezeJunk\\src\\main\\webapp\\resources\\youtube";
	
	public void makeURLtxt(String url) {
		System.out.println("시작!");
		try {
			FileWriter fileWriter = new FileWriter(filePath + "\\url.txt");

			fileWriter.write(url);
			fileWriter.flush();
			fileWriter.close();

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void runCrawling() {
		try {
			Jep jep = new Jep();
			jep.runScript(filePath + "\\crawlingPython.py");
			//System.out.println(jep.getValue("comments"));
			jep.close();
			System.out.println("크롤링 완료");

		} catch (JepException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}