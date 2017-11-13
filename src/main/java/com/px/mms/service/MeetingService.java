package com.px.mms.service;

import java.util.List;

import com.github.pagehelper.PageInfo;
import com.px.mms.domain.Meeting;

public interface MeetingService {

	void addMeeting(Meeting meeting, String[] userIds);

	PageInfo<Meeting> findMeetingWithUserByPromoterByPage(String promoterId, Integer pageNum);
}