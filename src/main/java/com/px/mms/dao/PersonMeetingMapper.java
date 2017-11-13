package com.px.mms.dao;

import com.px.mms.domain.PersonMeeting;
import com.px.mms.domain.PersonMeetingExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface PersonMeetingMapper {
    int countByExample(PersonMeetingExample example);

    int deleteByExample(PersonMeetingExample example);

    int deleteByPrimaryKey(String id);

    int insert(PersonMeeting record);

    int insertSelective(PersonMeeting record);

    List<PersonMeeting> selectByExample(PersonMeetingExample example);

    PersonMeeting selectByPrimaryKey(String id);

    int updateByExampleSelective(@Param("record") PersonMeeting record, @Param("example") PersonMeetingExample example);

    int updateByExample(@Param("record") PersonMeeting record, @Param("example") PersonMeetingExample example);

    int updateByPrimaryKeySelective(PersonMeeting record);

    int updateByPrimaryKey(PersonMeeting record);
    
    int insertList(List<PersonMeeting> list);
}