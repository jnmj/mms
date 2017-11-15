package com.px.mms.domain;

import java.util.Date;
import java.util.List;

public class Meeting {
    private String id;

    private String introduction;

    private Date startTime;

    private Date endTime;

    private Integer status;

    private String strStatus;
    
    public String getStrStatus() {
    	switch(status){
		case 0:
			return "审核中";
		case 1:
			return "已通过";
		case 2:
			return "未通过";
		}
		return null;
	}

	private String note;

    private String promoterId;

    private String roomId;
    
    private List<Person> users;
    
    private Room room;
    
    private Person promoter;
    
    public Person getPromoter() {
		return promoter;
	}

	public void setPromoter(Person promoter) {
		this.promoter = promoter;
	}

	public void setStrStatus(String strStatus) {
		this.strStatus = strStatus;
	}

	public Room getRoom() {
		return room;
	}

	public void setRoom(Room room) {
		this.room = room;
	}

	
    
	public List<Person> getUsers() {
		return users;
	}

	public void setUsers(List<Person> users) {
		this.users = users;
	}

	public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getIntroduction() {
        return introduction;
    }

    public void setIntroduction(String introduction) {
        this.introduction = introduction == null ? null : introduction.trim();
    }

    public Date getStartTime() {
        return startTime;
    }

    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note == null ? null : note.trim();
    }

    public String getPromoterId() {
        return promoterId;
    }

    public void setPromoterId(String promoterId) {
        this.promoterId = promoterId == null ? null : promoterId.trim();
    }

    public String getRoomId() {
        return roomId;
    }

    public void setRoomId(String roomId) {
        this.roomId = roomId == null ? null : roomId.trim();
    }
}