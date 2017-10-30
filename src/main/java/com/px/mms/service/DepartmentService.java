package com.px.mms.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.PageInfo;
import com.px.mms.domain.Department;

public interface DepartmentService {

	void addDepartment(String name);

	void deleteDepartmentById(String id);

	void updateDepartment(String id, String name);

	Department findDepartmentById(String id);

	boolean isDepartmentExist(String name);
	
	PageInfo<Department> findDepartmentByPage(int pageNum, int pageSize);

}