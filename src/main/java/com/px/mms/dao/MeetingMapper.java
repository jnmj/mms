package com.px.mms.dao;

import com.px.mms.domain.Meeting;
import com.px.mms.domain.MeetingExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface MeetingMapper {
    int countByExample(MeetingExample example);

    int deleteByExample(MeetingExample example);

    int deleteByPrimaryKey(String id);

    int insert(Meeting record);

    int insertSelective(Meeting record);

    List<Meeting> selectByExample(MeetingExample example);

    Meeting selectByPrimaryKey(String id);

    int updateByExampleSelective(@Param("record") Meeting record, @Param("example") MeetingExample example);

    int updateByExample(@Param("record") Meeting record, @Param("example") MeetingExample example);

    int updateByPrimaryKeySelective(Meeting record);

    int updateByPrimaryKey(Meeting record);
}