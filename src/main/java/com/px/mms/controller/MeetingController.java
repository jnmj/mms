package com.px.mms.controller;

import java.util.List;

import javax.servlet.http.HttpSession;
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
import com.px.mms.domain.LoginResult;
import com.px.mms.domain.Meeting;
import com.px.mms.domain.Person;
import com.px.mms.domain.Room;
import com.px.mms.service.DepartmentService;
import com.px.mms.service.MeetingService;
import com.px.mms.service.RoomService;
import com.px.mms.service.UserService;

import junit.framework.Test;

@RequestMapping("/meeting")
@Controller
public class MeetingController {

	@Autowired
	private RoomService roomService;
	
	@Autowired
	private MeetingService service;
	
	@Autowired
	private DepartmentService departmentService;
	
	@RequestMapping("/add")
	public String addMeeting(Meeting meeting, String[] userIds, Model model) {
		if(meeting.getRoomId()!=null) {
			service.addMeeting(meeting,userIds);
			return "redirect:myOrder";
		}else {
			List<Room> rooms = roomService.findAllRoom();
			model.addAttribute("rooms", rooms);
			List<Department> departments = departmentService.findAllDepartmentWithUser();
			model.addAttribute("departments", departments);
			return "addMeeting";
		}
	}
	
	@RequestMapping("/myOrder")
	public String toMyOrder(Model model, Integer pageNum, HttpSession session) {
		pageNum=(pageNum==null?1:pageNum);
		LoginResult user = (LoginResult) session.getAttribute("user");
		PageInfo<Meeting> pageInfo = service.findMeetingWithUserByPromoterByPage(user.getId(),pageNum);
		model.addAttribute("pageInfo", pageInfo);
		return "myOrder";
	}
	
}
