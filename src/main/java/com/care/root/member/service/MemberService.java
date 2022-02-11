package com.care.root.member.service;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.care.root.member.dto.MemberDTO;
import com.care.root.mybatis.MemberMapper;

@Service
public class MemberService {
	@Autowired	MemberMapper mapper;
	@Autowired JavaMailSender mailSender;
	
	public MemberDTO idcheck(String id) {		// 아이디 중복체크
		MemberDTO dto = mapper.idcheck(id);
		return dto;
	}
	
	public MemberDTO emailcheck(String email) {	// 이메일 중복체크
		return mapper.emailcheck(email);
	}
	
	public int register(HttpServletRequest req) {	// 회원가입 완료
		MemberDTO dto = new MemberDTO();
		dto.setId(req.getParameter("id"));
		dto.setPwd(req.getParameter("pwd"));
		dto.setName(req.getParameter("name"));
		dto.setEmail(req.getParameter("email"));
		return mapper.register(dto);
	}
	
	public void emailgoNum(String email,Model model) {	// 이메일로 인증번호 보내기
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
			helper.setSubject("FreezeJunk 회원가입 이메일 인증입니다.");
			StringBuffer sb = new StringBuffer();
			sb.append("안녕하세요 FreezeJunk입니다.<br>");
			sb.append("<p>회원가입을 신청해주셔서 가입 인증번호를 발급해드렸습니다.</p><br>");
			sb.append("웹 화면에 해당 인증번호를 입력하고 회원가입을 클릭해야 가입이 완료됩니다.<br/>");
			sb.append("인증 번호 : ");
			sb.append("<h2 style='color : blue'>'  "+ Certified +"  ' 입니다.</h2>");
			helper.setText(sb.toString(), true);
			mailSender.send(message);
			model.addAttribute("certified", Certified);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public int loginChk(String id, String pwd, HttpServletRequest req) {	// 로그인 체크, 로그인하기
		MemberDTO dto = new MemberDTO();
		HttpSession session = req.getSession();
		dto.setId(id);
		dto.setPwd(pwd);
		MemberDTO loDto = mapper.loginChk(dto);
		if(loDto == null) {
			return 0;
		}if(loDto.getId().equals(dto.getId()) && loDto.getPwd().equals(dto.getPwd())) {
			session.setAttribute("loginUser", loDto);
			return 1;
		}
		return 2;
	}
	
	
	
	public String searchId(String name, String email) {
		String result = "";
		try {
			result = mapper.searchId(name, email);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	
	public void searchPwd(String id,String email, HttpServletRequest req) {	// 이메일로 인증번호 보내기
		String key = "";
		for(int i=1; i<=8; i++) {
			int num = (int)(Math.random()*9)+1;
			key += String.valueOf(num);
		}
		MimeMessage message = mailSender.createMimeMessage();
		try {
		//	System.out.println(email);
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
			helper.setTo(email);
			helper.setFrom("freezejunk@gmail.com", "관리자");
			helper.setSubject("FreezeJunk 임시 비밀번호가 발급되었습니다.");
			StringBuffer sb = new StringBuffer();
			sb.append("안녕하세요 FreezeJunk입니다.<br>");
			sb.append("<p>비밀번호 찾기를 신청해주셔서 임시 비밀번호를 발급해드렸습니다.</p><br>");
			sb.append("<p>임시로 발급 드린 비밀번호는 <h2 style='color : blue'>'  "+ key +"  '</h2>이며 로그인 후 마이페이지에서 비밀번호를 변경해주시면 됩니다.</p><br>");
			sb.append("(혹시 잘못 전달된 메일이라면 이 이메일을 무시하셔도 됩니다)");
			helper.setText(sb.toString(), true);
			mailSender.send(message);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		mapper.searchPwd(id,email,key);
	}
	
	public void mypage(Model model, String id) {
		model.addAttribute("mypage",mapper.mypage(id));
	}
	
	public int myupdate(HttpServletRequest req, String id) {
		MemberDTO dto = new MemberDTO();
		HttpSession se = req.getSession();
		dto.setId(id);
		dto.setPwd(req.getParameter("pwd"));
		dto.setName(req.getParameter("name"));
		dto.setEmail(req.getParameter("email"));
		int result = mapper.myupdate(dto);
		if(result == 1) {
			se.setAttribute("loginUser", dto);
		}
		return result;
	}
	

	
	public void emaildel(MemberDTO dto,Model model, HttpServletResponse res) {
		String Certified = "";
		for(int i=1; i<=6; i++) {
			int num = (int)(Math.random()*9)+1;
			Certified += String.valueOf(num);
		}
		MimeMessage message = mailSender.createMimeMessage();
		try {
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
			helper.setTo(dto.getEmail());
			helper.setFrom("freezejunk@gmail.com", "관리자");
			helper.setSubject(" FreezeJunk 회원 탈퇴 이메일 인증번호입니다.");
			StringBuffer sb = new StringBuffer();
			sb.append("안녕하세요 FreezeJunk입니다.<br>");
			sb.append("<p>회원탈퇴를 신청해주셔서 탈퇴 인증번호를 발급해드렸습니다.</p><br>");
			sb.append("웹 화면에 해당 인증번호를 입력하고 탈퇴버튼을 클릭해야 탈퇴가 완료됩니다.<br/>");
			sb.append("인증 번호는 ");
			sb.append("<h2 style='color : blue'>'  "+ Certified +"  ' 입니다.</h2>");
			helper.setText(sb.toString(), true);
			mailSender.send(message);
			model.addAttribute("certified", Certified);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public int iddelete(String id) {
		return mapper.iddelete(id);
	}
	
}
