package com.px.mms.controller;

import javax.jms.Session;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.px.mms.domain.LoginResult;
import com.px.mms.service.UserService;
import com.sun.mail.util.LogOutputStream;

@Controller
public class PageController {

	@Autowired
	private UserService userService;
	
	@RequestMapping("/")
	public String toDefault() {
		return "index";
	}
	
	@RequestMapping(value=("/loginValidate") ,produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String loginValidate(String id, @RequestParam(required=false)String password, HttpSession session) {
		LoginResult result = userService.loginValidate(id, password);
		if(result.getStatus()==0) {
			session.setAttribute("user", result);
		}
		return result.getStatus().toString();
	}
	
	@RequestMapping("/login")
	public String login() {
		return "login";
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("user");
		return "login";
	}
	
	@RequestMapping("/index")
	public String toIndex(){
		return "redirect:/meeting/mine";
	}
}
