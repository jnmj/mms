package com.px.mms.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.PageInfo;
import com.px.mms.domain.Department;

public interface DepartmentService {

	void addDepartment(String name);

	void deleteDepartmentById(String id);

	void updateDepartment(Department department);

	Department findDepartmentById(String id);

	boolean isDepartmentExist(String name);
	
	PageInfo<Department> findDepartmentByPage(Integer pageNum);

	List<Department> findAllDepartment();
	
	List<Department> findAllDepartmentWithUser();
	
}