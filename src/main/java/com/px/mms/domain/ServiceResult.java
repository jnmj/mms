package com.px.mms.domain;

public class ServiceResult {
	
	private int status = -1;
	private String message;
	
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public ServiceResult() {
		super();
	}
	public ServiceResult(int status, String message) {
		super();
		this.status = status;
		this.message = message;
	}
	
	
}
