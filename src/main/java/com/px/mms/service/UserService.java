package com.px.mms.service;

import org.springframework.transaction.annotation.Transactional;

import com.px.mms.domain.Person;

public interface UserService {

	void addUser(Person person);

}