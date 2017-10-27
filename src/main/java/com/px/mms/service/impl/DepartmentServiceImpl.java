package com.px.mms.service.impl;


import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.px.mms.dao.DepartmentMapper;
import com.px.mms.domain.Department;
import com.px.mms.domain.DepartmentExample;
import com.px.mms.domain.DepartmentExample.Criteria;
import com.px.mms.service.DepartmentService;
import com.px.mms.domain.ServiceResult;


@Service
public class DepartmentServiceImpl implements DepartmentService {

	@Autowired
	private DepartmentMapper mapper;
	
	@Override
	@Transactional
	public void addDepartment(String name) {
		Department department = new Department();
		String id = UUID.randomUUID().toString().replaceAll("-", "");
		department.setId(id);
		department.setName(name);
		mapper.insert(department);		
	}
	
	@Override
	@Transactional
	public void deleteDepartmentById(String id) {
		mapper.deleteByPrimaryKey(id);
	}
	
	@Override
	@Transactional
	public void updateDepartment(Department department) {
		mapper.updateByPrimaryKey(department);
	}
	
	@Override
	public Department findDepartmentById(String id) {
		return mapper.selectByPrimaryKey(id);
	}
	
	@Override
	public PageInfo<Department> findDepartmentByPage(int pageNum, int pageSize){
		PageHelper.startPage(pageNum, pageSize);
		DepartmentExample example = new DepartmentExample();
		example.setOrderByClause("convert(name using gbk) asc");
		List<Department> list = mapper.selectByExample(example);
		return new PageInfo<>(list);
	}
}
