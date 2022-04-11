package com.care.root.admin.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.care.root.member.dto.MemberDTO;
import com.care.root.mybatis.MemberMapper;

@Service
public class AdminService {
	@Autowired
	MemberMapper mapper;
	
	public void userList(Model model, HttpServletRequest req) {	// user List 보기
		String search = req.getParameter("search");
		if(search == null) {
			search = "";
		}
		String option = req.getParameter("option");
		if(option == null) {
			option = "1";
		}
		
		String column = req.getParameter("column");
		String sort = req.getParameter("sort");
		
		
		List<MemberDTO> list = null;
		
		if(option.equals("1")) {
			if(column == null) {
				list = mapper.userListId(search);
			} else {
				if(column.equals("id")) {
					if(sort.equals("desc")) {
						list = mapper.userListIdDescId(search);
						model.addAttribute("idSort", "desc");
					} else {
						list = mapper.userListIdAscId(search);
						model.addAttribute("idSort", "asc");
					}
				} else if(column.equals("name")) {
					if(sort.equals("desc")) {
						list = mapper.userListIdDescName(search);
						model.addAttribute("nameSort", "desc");
					} else {
						list = mapper.userListIdAscName(search);
						model.addAttribute("nameSort", "asc");
					}
				} else if(column.equals("email")) {
					if(sort.equals("desc")) {
						list = mapper.userListIdDescEmail(search);
						model.addAttribute("emailSort", "desc");
					} else {
						list = mapper.userListIdAscEmail(search);
						model.addAttribute("emailSort", "asc");
					}
				}
			}
			
		} else if(option.equals("2")) {
			if(column == null) {
				list = mapper.userListName(search);
			} else {
				if(column.equals("id")) {
					if(sort.equals("desc")) {
						list = mapper.userListNameDescId(search);
						model.addAttribute("idSort", "desc");
					} else {
						list = mapper.userListNameAscId(search);
						model.addAttribute("idSort", "asc");
					}
				} else if(column.equals("name")) {
					if(sort.equals("desc")) {
						list = mapper.userListNameDescName(search);
						model.addAttribute("nameSort", "desc");
					} else {
						list = mapper.userListNameAscName(search);
						model.addAttribute("nameSort", "asc");
					}
				} else if(column.equals("email")) {
					if(sort.equals("desc")) {
						list = mapper.userListNameDescEmail(search);
						model.addAttribute("emailSort", "desc");
					} else {
						list = mapper.userListNameAscEmail(search);
						model.addAttribute("emailSort", "asc");
					}
				}
			}
			
		} else if(option.equals("3")) {
			if(column == null) {
				list = mapper.userListEmail(search);
			} else {
				if(column.equals("id")) {
					if(sort.equals("desc")) {
						list = mapper.userListEmailDescId(search);
						model.addAttribute("idSort", "desc");
					} else {
						list = mapper.userListEmailAscId(search);
						model.addAttribute("idSort", "asc");
					}
				} else if(column.equals("name")) {
					if(sort.equals("desc")) {
						list = mapper.userListEmailDescName(search);
						model.addAttribute("nameSort", "desc");
					} else {
						list = mapper.userListEmailAscName(search);
						model.addAttribute("nameSort", "asc");
					}
				} else if(column.equals("email")) {
					if(sort.equals("desc")) {
						list = mapper.userListEmailDescEmail(search);
						model.addAttribute("emailSort", "desc");
					} else {
						list = mapper.userListEmailAscEmail(search);
						model.addAttribute("emailSort", "asc");
					}
				}
			}
		}
		
		model.addAttribute("list", list);
		model.addAttribute("search", search);
		model.addAttribute("option", option);
	}
}
