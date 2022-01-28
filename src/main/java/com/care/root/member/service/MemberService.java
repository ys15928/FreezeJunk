package com.care.root.member.service;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.care.root.member.dto.MemberDTO;
import com.care.root.mybatis.MemberMapper;

@Service
public class MemberService {
	@Autowired
	MemberMapper mapper;
	@Autowired JavaMailSender mailSender;
	
	public MemberDTO idcheck(String id) {
		System.out.println(id);
		MemberDTO dto = mapper.idcheck(id);
		return dto;
	}
	
	public MemberDTO emailcheck(String email) {
		return mapper.emailcheck(email);
	}
	
	public int register(HttpServletRequest req) {
		MemberDTO dto = new MemberDTO();
		dto.setId(req.getParameter("id"));
		dto.setPwd(req.getParameter("pwd"));
		dto.setName(req.getParameter("name"));
		dto.setEmail(req.getParameter("email"));
		return mapper.register(dto);
	}
	
	public void emailgoNum(String email,Model model) {
		String Certified = "";
		for(int i=1; i<=6; i++) {
			int num = (int)(Math.random()*9)+1;
			Certified += String.valueOf(num);
		}
		MimeMessage message = mailSender.createMimeMessage();
		try {
		//	System.out.println(email);
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
			helper.setTo(email);
			helper.setFrom("freezejunk@gmail.com", "관리자");
			helper.setSubject("FreezeJunk 회원가입 이메일 인증");
			StringBuffer sb = new StringBuffer();
			sb.append("웹 화면에 해당 인증번호를 입력하고 회원가입을 클릭해야 가입이 완료됩니다.<br/>");
			sb.append("인증 번호 : ");
			sb.append(Certified);
			helper.setText(sb.toString(), true);
			mailSender.send(message);
			System.out.println(Certified);
			model.addAttribute("certified", Certified);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
