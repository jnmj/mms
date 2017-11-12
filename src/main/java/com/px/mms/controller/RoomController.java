package com.px.mms.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;
import com.px.mms.constant.Constant;
import com.px.mms.domain.Room;
import com.px.mms.service.RoomService;


@RequestMapping("/room")
@Controller
public class RoomController {
	
	@Autowired
	private RoomService service;
	
	@RequestMapping("/add")
	public String addRoom(String name) {
		if(name!=null) {
			service.addRoom(name);
		}
		return "addRoom";
	}
	
	@RequestMapping("/scan")
	public String scanRoom(Model model, Integer pageNum) {
		pageNum=(pageNum==null?1:pageNum);
		PageInfo<Room> pageInfo = service.findRoomByPage(pageNum);
		model.addAttribute("pageInfo", pageInfo);
		return "scanRoom";
	}
	
	@RequestMapping("/getAll")
	@ResponseBody
	public List<Room> getAllRoom() {
		return service.findAllRoom();
	}
	
	@RequestMapping("/delete")
	public String deleteRoom(String id) {
		service.deleteRoomById(id);
		return "redirect:scan";
	}
	
	@RequestMapping(value="/isExist", produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String isRoomExist(String name) {
		boolean ret = service.isRoomExist(name);
		if(ret) {
			return "会议室已存在";
		}
		return "";
	}
	
	@RequestMapping("/update")
	public String updateRoom(Room room) {
		service.updateRoom(room); 
		return "redirect:scan";
	}
}
