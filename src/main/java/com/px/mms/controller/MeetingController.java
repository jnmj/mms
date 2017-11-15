package com.px.mms.controller;

import java.util.Date;
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

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.pagehelper.PageInfo;
import com.px.mms.domain.Department;
import com.px.mms.domain.LoginResult;
import com.px.mms.domain.Meeting;
import com.px.mms.domain.MyPageInfo;
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
	public String myOrder(Model model, Integer pageNum, HttpSession session) {
		pageNum=(pageNum==null?1:pageNum);
		LoginResult user = (LoginResult) session.getAttribute("user");
		MyPageInfo<Meeting> pageInfo = service.findMeetingWithUserByPromoterByPage(user.getId(),pageNum);
		model.addAttribute("pageInfo", pageInfo);
		return "myOrderMeeting";
	}
	
	@RequestMapping("/mine")
	public String mine(Model model, Integer pageNum, HttpSession session) {
		pageNum=(pageNum==null?1:pageNum);
		LoginResult user = (LoginResult) session.getAttribute("user");
		MyPageInfo<Meeting> pageInfo = service.findMeetingWithUserByStatusByJoinerByPage(1, user.getId(), pageNum);
		model.addAttribute("pageInfo", pageInfo);
		return "myMeeting";
	}
	
	@RequestMapping("/approve")
	public String approve(Model model, Integer pageNum) {
		pageNum=(pageNum==null?1:pageNum);
		MyPageInfo<Meeting> pageInfo = service.findMeetingWithUserByStatusByPage(0, pageNum);
		model.addAttribute("pageInfo", pageInfo);
		return "approveMeeting";
		
	}
	
	@RequestMapping("/approveRecord")
	public String myOrder(Model model, Integer pageNum) {
		pageNum=(pageNum==null?1:pageNum);
		MyPageInfo<Meeting> pageInfo = service.findProcessedMeetingWithUserByPage(pageNum);
		model.addAttribute("pageInfo", pageInfo);
		return "approveMeetingRecord";
	}
	
	@RequestMapping("/decide")
	public String decide(Meeting meeting) {
		service.updateMeetingStatusById(meeting);
		return "redirect:approve";
	}
	
	@RequestMapping("/validate")
	@ResponseBody
	public List<Meeting> validate(String id, String roomId, Date startTime, Date endTime) {
		List<Meeting> list = service.validateDateTime(id, roomId, startTime, endTime);
		return list;
	}
}
