package com.px.mms.service;

import java.util.List;

import com.github.pagehelper.PageInfo;
import com.px.mms.domain.Meeting;
import com.px.mms.domain.MyPageInfo;

public interface MeetingService {

	void addMeeting(Meeting meeting, String[] userIds);

	MyPageInfo<Meeting> findMeetingWithUserByPromoterByPage(String promoterId, Integer pageNum);
	
	MyPageInfo<Meeting> findMeetingWithUserByStatusByPage(Integer status, Integer pageNum);
	
	void updateMeetingStatusById(Meeting meeting);
}