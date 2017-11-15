package com.px.mms.service.impl;

import java.util.List;

import javax.security.auth.login.LoginContext;

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
import com.px.mms.domain.LoginResult;
import com.px.mms.service.UserService;
import com.px.mms.util.MD5Util;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private PersonMapper mapper;
	
	@Override
	public Person findUserById(String id) {
		return mapper.selectByPrimaryKey(id);
	}
	
	@Override
	public LoginResult loginValidate(String id, String password) {
		LoginResult result = new LoginResult();
		Person person = mapper.selectByPrimaryKey(id);
		if(person==null) {
			result.setStatus(-1);
			return result;
		}
		
		PersonExample example = new PersonExample();
		Criteria criteria = example.createCriteria();
		criteria.andIdEqualTo(id);
		criteria.andPasswordEqualTo(MD5Util.getMD5(password));
		List<Person> list = mapper.selectByExample(example);
		if(list.size()==0) {
			result.setStatus(-2);
			return result;
		}else {
			person = list.get(0);
			result.setId(person.getId());
			result.setName(person.getName());
			result.setRole(person.getRole());
			result.setStatus(0);
			return result;
		}
	}
	
	@Override
	public Integer validatePassword(String id, String password) {
		PersonExample example = new PersonExample();
		Criteria criteria = example.createCriteria();
		criteria.andIdEqualTo(id);
		criteria.andPasswordEqualTo(MD5Util.getMD5(password));
		return mapper.countByExample(example);
	}
	
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
		}else {
			if(person.getPassword()!=null) {
				person.setPassword(MD5Util.getMD5(person.getPassword()));
			}
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
