package com.px.mms.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.px.mms.domain.Department;
import com.px.mms.domain.Person;
import com.px.mms.service.DepartmentService;
import com.px.mms.service.UserService;

@RequestMapping("/user")
@Controller
public class UserController {

	@Autowired
	private UserService service;
	@Autowired
	private DepartmentService departmentService;
	
	@RequestMapping("/add")
	public String addUser(@RequestParam(required=false)Person person, Model model) {
		if(person!=null) {
			service.addUser(person);
		}else {
			List<Department> list = departmentService.findAllDepartment();
			model.addAttribute("departments", list);
		}
		return "addUser";
	}
}
