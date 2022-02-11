package com.care.root.member.contoller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.care.root.member.dto.MemberDTO;
import com.care.root.member.service.MemberService;

@Controller
public class MemberController {
	@Autowired
	MemberService service;
	
	@RequestMapping("header")
	public String header() {
		return "default/header";
	}
	@RequestMapping("main")
	public String main() {
		return "member/main";
	}
	@RequestMapping("footer")
	public String footer() {
		return "default/footer";
	}
	
	@RequestMapping("membership")
	public String membership() {
		return "member/membership";
	}
	
	@RequestMapping("login")
	public String login() {
		return "member/login";
	}
	
	@RequestMapping("idpwsearch")
	public String idpwsearch() {
		return "member/idpw_search";
	}
	
	@RequestMapping(value="memberSuc", method=RequestMethod.POST)
	public void resister(HttpServletRequest req, HttpServletResponse res) throws IOException {
		res.setContentType("text/html; charset=utf-8"); // 응답 설정 변경
        PrintWriter out = res.getWriter(); // 화면 출력용 객체
        int result= service.register(req);
        if(result==0) {
        	out.print("<script> alert('회원가입에 실패하셨습니다.');location.href='membership';</script>");    	
        }else {
        	out.print("<script> alert('회원가입이 완료되었습니다.');location.href='login';</script>");
        }
	}
	
	@RequestMapping(value="idcheck", method=RequestMethod.POST, produces="application/json; charset=utf-8")
	@ResponseBody
	public Map idcheck(@RequestBody Map dto) {
		System.out.println(dto.get("id"));
		String id= (String)dto.get("id");
		Map map = new HashMap();
		map.put("idcheck", service.idcheck(id));
		return map;
	}
	@RequestMapping(value="emailcheck", method=RequestMethod.POST, produces = "application/json; charset=utf-8")
	@ResponseBody
	public Map emailcheck(@RequestBody Map dto) {
		String email = (String)dto.get("email");
		Map map = new HashMap();
		map.put("emailcheck", service.emailcheck(email));
		return map;
	}
	
	@RequestMapping(value="emailgoNum", method=RequestMethod.POST, produces = "application/json; charset=utf-8")
	@ResponseBody
	public Map emailgoNum(@RequestBody Map dto,Model model) {
		String email = (String)dto.get("email");
		System.out.println(email);
		Map map = new HashMap();
		service.emailgoNum(email,model);
		map.put("certified", model.getAttribute("certified"));
		return map;
	}
	
	@RequestMapping(value="loginChk", method=RequestMethod.POST, produces = "application/json; charset=utf-8")
	@ResponseBody
	public Map loginChk(@RequestBody Map dto, HttpServletRequest req) {
		String id = (String)dto.get("id");
		String pwd = (String)dto.get("pwd");
		Map map = new HashMap();
		int result = service.loginChk(id,pwd,req);
		map.put("login", result);
		return map;
	}
	
	
	@RequestMapping(value="main/logout")
	public void logout(HttpServletRequest req, HttpServletResponse res) throws IOException{
		res.setContentType("text/html; charset=utf-8");
		PrintWriter out = res.getWriter();
		HttpSession session = req.getSession();
		session.invalidate();
		out.print("<script>alert('로그아웃 완료');location.href='../main';</script>");
	}
	
	@RequestMapping(value="searchId", method = RequestMethod.POST)
	@ResponseBody
	public String searchId(@RequestParam("inputName_1") String name,@RequestParam("inputEmail_1")String email) {
		String result = service.searchId(name, email);
		return result;
	}
	
	@RequestMapping(value = "searchPwd", method = RequestMethod.POST)
	@ResponseBody
	public String searchPwd(@RequestParam("id")String id, @RequestParam("email")String email, HttpServletRequest req) {
		service.searchPwd(id, email, req);
		return "searchPwd";
	}
	
	
	
	@RequestMapping("mypage")
	public String mypage(Model model, HttpServletRequest req) {
		HttpSession se = req.getSession();
		if(se.getAttribute("loginUser")==null) {
			return "redirect:login";
		}else {
			MemberDTO dto = (MemberDTO)se.getAttribute("loginUser");
			service.mypage(model,dto.getId());
		}
		return "member/mypage";
	}
	
	@PostMapping("myupdate")
	public void myupdate(HttpServletRequest req, HttpServletResponse res, Model model) throws IOException {
		HttpSession se = req.getSession();
		res.setContentType("text/html; charset=utf-8");
		PrintWriter out = res.getWriter();
		MemberDTO dto = (MemberDTO)se.getAttribute("loginUser");
		if(dto==null) {
			out.print("<script> locetion.href='login';</script>");
		}else {
			int result = service.myupdate(req,dto.getId());
			if(result == 0) {
				out.print("<script> alert('회원 정보 수정을 실패했습니다');location.href='mypage';</script>");
			}else {
				out.print("<script> alert('회원 정보 수정이 완료되었습니다');location.href='mypage';</script>");
			}
		}
	}
	
	
		
	@RequestMapping("emaildel")
	@ResponseBody
	public ArrayList emaildel(HttpServletRequest req, HttpServletResponse res,Model model) {
		ArrayList list = new ArrayList();
		
		HttpSession se = req.getSession();
		MemberDTO dto = (MemberDTO)se.getAttribute("loginUser");
		service.emaildel(dto, model, res);
		list.add(model.getAttribute("certified"));
		return list;
	}
	
	@RequestMapping(value = "iddelete", method=RequestMethod.POST)
	public void iddelete(HttpServletRequest req, HttpServletResponse res) throws IOException {
		res.setContentType("text/html; charset=utf-8");
		PrintWriter out = res.getWriter();
		HttpSession se = req.getSession();
		MemberDTO dto = (MemberDTO)se.getAttribute("loginUser");
		int result = service.iddelete(dto.getId());
		if(result == 0) {
			out.print("<script> alert('회원 탈퇴에 실패했습니다');location.href='mypage';</script>");
		} else {
			se.invalidate();
			out.print("<script> alert('탈퇴되었습니다.');location.href='main';</script>");
		}
	}
	
	
	
	
	
	
}



