package com.px.mms.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.mysql.jdbc.ResultSetInternalMethods;
import com.px.mms.constant.Constant;
import com.px.mms.dao.MeetingMapper;
import com.px.mms.dao.PersonMeetingMapper;
import com.px.mms.domain.Meeting;
import com.px.mms.domain.MeetingExample;
import com.px.mms.domain.MeetingExample.Criteria;
import com.px.mms.domain.MyPageInfo;
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
	public MyPageInfo<Meeting> findMeetingWithUserByPromoterByPage(String promoterId, Integer pageNum){
		int pageSize = Constant.pageSize;
		int start = (pageNum-1)*pageSize;
		MeetingExample example = new MeetingExample();
		Criteria criteria = example.createCriteria();
		criteria.andPromoterIdEqualTo(promoterId);
		int totalCount = mapper.selectByExample(example).size();
		
		List<Meeting> list = mapper.selectMeetingWithUserByPageByPromoter(promoterId, start, pageSize);
		MyPageInfo<Meeting> pageInfo = new MyPageInfo<>(pageNum, pageSize, totalCount, list);
		return pageInfo;
	}
	
	public MyPageInfo<Meeting> findMeetingWithUserByStatusByJoinerByPage(Integer status, String joinerId,
			Integer pageNum){
		int pageSize = Constant.pageSize;
		int start = (pageNum-1)*pageSize;
		int totalCount = mapper.countMeetingByStatusByJoiner(status, joinerId);
		
		List<Meeting> list = mapper.selectMeetingWithUserByPageByStatusByJoiner(status, joinerId, start, pageSize);
		MyPageInfo<Meeting> pageInfo = new MyPageInfo<>(pageNum, pageSize, totalCount, list);
		return pageInfo;
	}
	
	@Override
	public MyPageInfo<Meeting> findMeetingWithUserByStatusByPage(Integer status, Integer pageNum){
		int pageSize = Constant.pageSize;
		int start = (pageNum-1)*pageSize;
		MeetingExample example = new MeetingExample();
		Criteria criteria = example.createCriteria();
		criteria.andStatusEqualTo(status);
		int totalCount = mapper.selectByExample(example).size();
		
		List<Meeting> list = mapper.selectMeetingWithUserByPageByStatus(status, start, pageSize);
		MyPageInfo<Meeting> pageInfo = new MyPageInfo<>(pageNum, pageSize, totalCount, list);
		return pageInfo;
	}
	
	@Override
	public MyPageInfo<Meeting> findProcessedMeetingWithUserByPage(Integer pageNum){
		int pageSize = Constant.pageSize;
		int start = (pageNum-1)*pageSize;
		MeetingExample example = new MeetingExample();
		Criteria criteria = example.createCriteria();
		List<Integer> status = new ArrayList<>();
		status.add(1);
		status.add(2);
		criteria.andStatusIn(status);
		int totalCount = mapper.selectByExample(example).size();
		
		List<Meeting> list = mapper.selectProcessedMeetingWithUserByPage(start, pageSize);
		MyPageInfo<Meeting> pageInfo = new MyPageInfo<>(pageNum, pageSize, totalCount, list);
		return pageInfo;
	}
	
	@Override
	@Transactional
	public void updateMeetingStatusById(Meeting meeting) {
		mapper.updateByPrimaryKeySelective(meeting);
	}
	
	@Override
	public List<Meeting> validateDateTime(String id, String roomId, Date startTime, Date endTime) {
		MeetingExample example1 = new  MeetingExample();
		Criteria criteria1 = example1.createCriteria();
		criteria1.andIdNotEqualTo(id);
		criteria1.andRoomIdEqualTo(roomId);
		criteria1.andStartTimeGreaterThanOrEqualTo(startTime);
		criteria1.andStartTimeLessThan(endTime);
		List<Meeting> list1 = mapper.selectByExample(example1);
		
		MeetingExample example2 = new  MeetingExample();
		Criteria criteria2 = example2.createCriteria();
		criteria2.andRoomIdEqualTo(roomId);
		criteria2.andStartTimeLessThan(startTime);
		criteria2.andEndTimeGreaterThan(startTime);
		List<Meeting> list2 = mapper.selectByExample(example2);
		
		list1.addAll(list2);
		return list1;
	}
}
