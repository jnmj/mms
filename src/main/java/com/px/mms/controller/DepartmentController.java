package com.px.mms.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;
import com.px.mms.constant.Constant;
import com.px.mms.domain.Department;
import com.px.mms.service.DepartmentService;


@RequestMapping("/department")
@Controller
public class DepartmentController {
	
	@Autowired
	private DepartmentService service;
	
	@RequestMapping("/add")
	public String addDepartment(@RequestParam(required=false)String name) {
		if(name!=null) {
			service.addDepartment(name);
		}
		return "addDepartment";
	}
	
	@RequestMapping("/scan")
	public String scanDepartment(Model model, @RequestParam(required=false)Integer pageNum) {
		pageNum=(pageNum==null?1:pageNum);
		PageInfo<Department> pageInfo = service.findDepartmentByPage(pageNum, Constant.pageSize);
		model.addAttribute("pageInfo", pageInfo);
		return "scanDepartment";
	}
	
	@RequestMapping("/delete")
	public String deleteDepartment(String id) {
		service.deleteDepartmentById(id);
		return "redirect:scan";
	}
	
	@RequestMapping(value="isExist", produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String isDepartmentExist(String name) {
		boolean ret = service.isDepartmentExist(name);
		if(ret) {
			return "部门已存在";
		}
		return "";
	}
	
	@RequestMapping("/update")
	public String updateDepartment(Department department) {
		service.updateDepartment(department);
		return "redirect:scan";
	}
}
