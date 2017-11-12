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
import com.px.mms.domain.Meeting;
import com.px.mms.domain.Person;
import com.px.mms.domain.Room;
import com.px.mms.service.DepartmentService;
import com.px.mms.service.RoomService;
import com.px.mms.service.UserService;

import junit.framework.Test;

@RequestMapping("/meeting")
@Controller
public class MeetingController {

	@Autowired
	private RoomService roomService;
	
	@RequestMapping("/add")
	public String addUser(Meeting meeting, Model model) {
		if(meeting.getId()!=null) {
			//
		}
		List<Room> rooms = roomService.findAllRoom();
		model.addAttribute("rooms", rooms);
		return "addMeeting";
	}
	
}
