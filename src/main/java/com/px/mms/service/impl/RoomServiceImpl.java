package com.px.mms.service.impl;


import java.util.List;
import java.util.UUID;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.px.mms.constant.Constant;
import com.px.mms.dao.MeetingMapper;
import com.px.mms.dao.PersonMeetingMapper;
import com.px.mms.dao.RoomMapper;
import com.px.mms.domain.PersonMeetingExample;
import com.px.mms.domain.Room;
import com.px.mms.domain.RoomExample;
import com.px.mms.domain.RoomExample.Criteria;
import com.px.mms.service.RoomService;


@Service
public class RoomServiceImpl implements RoomService {

	@Autowired
	private RoomMapper mapper;
	
	@Autowired
	private PersonMeetingMapper personMeetingMapper;
	
	@Autowired
	private MeetingMapper meetingMapper;
	
	@Override
	@Transactional
	public void addRoom(String name) {
		
		Room room = new Room();
		String id = UUID.randomUUID().toString().replaceAll("-", "");
		room.setId(id);
		room.setName(name);
		mapper.insert(room);		
	}
	
	@Override
	@Transactional
	public void deleteRoomById(String id) {
		mapper.deleteByPrimaryKey(id);
	}
	
	@Override
	@Transactional
	public void updateRoom(Room room) {
		mapper.updateByPrimaryKey(room);
	}
	
	@Override
	public Room findRoomById(String id) {
		return mapper.selectByPrimaryKey(id);
	}
	
	@Override
	public PageInfo<Room> findRoomByPage(Integer pageNum){
		PageHelper.startPage(pageNum, Constant.pageSize);
		RoomExample example = new RoomExample();
		example.setOrderByClause("convert(name using gbk) ");
		List<Room> list = mapper.selectByExample(example);
		return new PageInfo<>(list);
	}
	
	@Override
	public boolean isRoomExist(String name) {
		RoomExample example = new RoomExample();
		Criteria criteria = example.createCriteria();
		criteria.andNameEqualTo(name);
		int count = mapper.countByExample(example);
		return count==0?false:true;
	}
	
	@Override
	public List<Room> findAllRoom(){
		RoomExample example = new RoomExample();
		example.setOrderByClause("convert(name using gbk) asc");
		return mapper.selectByExample(example);
	}
	
}
