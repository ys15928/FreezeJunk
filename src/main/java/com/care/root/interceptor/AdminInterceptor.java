package com.care.root.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.care.root.member.dto.MemberDTO;

public class AdminInterceptor extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		MemberDTO dto = (MemberDTO) session.getAttribute("loginUser");
		if(dto != null) {
			if(dto.getId().equals("freezejunkadminacc")) {
				return true;
			}
		}
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print("<script>alert('잘못된 접근입니다');"
				+ "location.href = '"+request.getContextPath() + "/main';</script>");
		return false;
	}

}
