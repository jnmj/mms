package com.px.mms.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.PageInfo;
import com.px.mms.domain.Department;
import com.px.mms.domain.Room;

public interface RoomService {

	void addRoom(String name);

	void deleteRoomById(String id);

	void updateRoom(Room room);

	Room findRoomById(String id);

	boolean isRoomExist(String name);
	
	PageInfo<Room> findRoomByPage(Integer pageNum);

	List<Room> findAllRoom();
}