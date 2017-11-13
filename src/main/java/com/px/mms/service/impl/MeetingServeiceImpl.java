package com.px.mms.service.impl;

import java.util.ArrayList;
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
import com.px.mms.domain.Meeting;
import com.px.mms.domain.PersonMeeting;
import com.px.mms.service.MeetingService;

@Service
public class MeetingServeiceImpl implements MeetingService{
	
	@Autowired
	private MeetingMapper mapper;
	
	@Autowired
	private PersonMeetingMapper personMeetingMapper;
	
	@Override
	@Transactional
	public void addMeeting(Meeting meeting, String[] userIds) {
		meeting.setId(UUID.randomUUID().toString().replaceAll("-", ""));
		meeting.setStatus(0);
		mapper.insert(meeting);
		List<PersonMeeting> relationList = new ArrayList<>();
		for(String userId : userIds) {
			PersonMeeting personMeeting = new PersonMeeting();
			personMeeting.setId(UUID.randomUUID().toString().replaceAll("-", ""));
			personMeeting.setMeetingId(meeting.getId());
			personMeeting.setPersonId(userId);
			relationList.add(personMeeting);
		}
		personMeetingMapper.insertList(relationList);
	}
	
	@Override
	public PageInfo<Meeting> findMeetingWithUserByPromoterByPage(String promoterId, Integer pageNum){
		PageHelper.startPage(pageNum, Constant.pageSize);
		List<Meeting> list = mapper.selectMeetingWithUserByPromoter(promoterId);
		return new PageInfo<>(list);
	}
}
