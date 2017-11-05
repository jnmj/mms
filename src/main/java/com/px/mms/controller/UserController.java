package com.px.mms.controller;

import java.util.List;

import javax.xml.registry.infomodel.User;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;
import com.px.mms.domain.Department;
import com.px.mms.domain.Person;
import com.px.mms.service.DepartmentService;
import com.px.mms.service.UserService;

import junit.framework.Test;

@RequestMapping("/user")
@Controller
public class UserController {

	@Autowired
	private UserService service;
	@Autowired
	private DepartmentService departmentService;
		
	@RequestMapping("/add")
	public String addUser(Person person, Model model) {
		if(person.getId()!=null) {
			service.addUser(person);
		}
		List<Department> list = departmentService.findAllDepartment();
		model.addAttribute("departments", list);
		
		return "addUser";
	}
	
	@RequestMapping("/scan")
	public String scanUser(Model model, Integer pageNum, Integer sortBy) {
		pageNum=(pageNum==null?1:pageNum);
		sortBy=(sortBy==null?1:sortBy);
		PageInfo<Person> pageInfo = service.findUserByPage(pageNum, sortBy);
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("sortBy", sortBy);
		return "scanUser";
	}
	
	@RequestMapping("/update")
	public String updateUser(Person person, Integer resetPassword) {
		service.updateUser(person, resetPassword);
		return "redirect:scan";
	}
	
	@RequestMapping("/delete")
	public String deleteUser(String id) {
		service.deleteUserById(id);
		return "redirect:scan";
	}
	
	@RequestMapping(value="/isExist", produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String isUserExist(String id) {
		boolean ret = service.isUserExist(id);
		if(ret) {
			return "用户已存在";
		}
		return "";
	}
}
