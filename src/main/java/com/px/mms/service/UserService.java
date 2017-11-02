package com.px.mms.service;


import com.github.pagehelper.PageInfo;
import com.px.mms.domain.Person;

public interface UserService {

	void addUser(Person person);
	
	PageInfo<Person> findUserByPage(Integer pageNum, Integer sortBy);
	
	void deleteUserById(String id);
	
	boolean isUserExist(String id);

}