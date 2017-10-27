package com.px.mms.dao;

import com.px.mms.domain.Room;
import com.px.mms.domain.RoomExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface RoomMapper {
    int countByExample(RoomExample example);

    int deleteByExample(RoomExample example);

    int deleteByPrimaryKey(String id);

    int insert(Room record);

    int insertSelective(Room record);

    List<Room> selectByExample(RoomExample example);

    Room selectByPrimaryKey(String id);

    int updateByExampleSelective(@Param("record") Room record, @Param("example") RoomExample example);

    int updateByExample(@Param("record") Room record, @Param("example") RoomExample example);

    int updateByPrimaryKeySelective(Room record);

    int updateByPrimaryKey(Room record);
}