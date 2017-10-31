package com.px.mms.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.px.mms.dao.PersonMapper;
import com.px.mms.domain.Person;
import com.px.mms.service.UserService;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private PersonMapper mapper;
	
	@Override
	@Transactional
	public void addUser(Person person) {
		mapper.insert(person);
	}
}
