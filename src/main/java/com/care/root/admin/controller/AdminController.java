package com.care.root.admin.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.care.root.admin.service.AdminService;

@Controller
public class AdminController {

	@Autowired
	AdminService service;
	
	@RequestMapping(value="admin/admin-1")
	public String userList(Model model, HttpServletRequest req) {
		service.userList(model, req);
		return "admin/userList";
	}
}
