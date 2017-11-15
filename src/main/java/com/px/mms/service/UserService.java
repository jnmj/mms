package com.px.mms.service;


import com.github.pagehelper.PageInfo;
import com.px.mms.domain.LoginResult;
import com.px.mms.domain.Person;

public interface UserService {

	Person findUserById(String id);
	
	LoginResult loginValidate(String id, String password);
	
	void addUser(Person person);
	
	PageInfo<Person> findUserByPage(Integer pageNum, Integer sortBy);
	
	void deleteUserById(String id);
	
	void updateUser(Person person, Integer resetPassword);
	
	boolean isUserExist(String id);

	Integer validatePassword(String id, String password);
}