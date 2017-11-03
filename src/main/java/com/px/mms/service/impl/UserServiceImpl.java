package com.px.mms.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.px.mms.constant.Constant;
import com.px.mms.dao.PersonMapper;
import com.px.mms.domain.Person;
import com.px.mms.domain.PersonExample;
import com.px.mms.domain.PersonExample.Criteria;
import com.px.mms.service.UserService;
import com.px.mms.util.MD5Util;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private PersonMapper mapper;
	
	@Override
	@Transactional
	public void addUser(Person person) {
		person.setPassword(MD5Util.getMD5(person.getPassword()));
		mapper.insert(person);
	}
	
	@Override
	public PageInfo<Person> findUserByPage(Integer pageNum, Integer sortBy){
		PageHelper.startPage(pageNum, Constant.pageSize);
		List<Person> list = mapper.selectUserWithDepartment(sortBy);
		return new PageInfo<>(list);
	}
	
	@Override
	@Transactional
	public void deleteUserById(String id) {
		mapper.deleteByPrimaryKey(id);
	}
	
	@Override
	@Transactional
	public void updateUser(Person person, Integer resetPassword) {
		if(resetPassword!=null) {
			person.setPassword(MD5Util.getMD5(Constant.defaultPassword));
		}
		mapper.updateByPrimaryKeySelective(person);
	}
	
	@Override
	public boolean isUserExist(String id) {
		PersonExample example = new PersonExample();
		Criteria criteria = example.createCriteria() ;
		criteria.andIdEqualTo(id);
		int count = mapper.countByExample(example);
		return count==1?true:false;
	}
}
