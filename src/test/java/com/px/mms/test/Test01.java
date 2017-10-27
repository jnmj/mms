package com.px.mms.test;
import java.util.UUID;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Component;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.px.mms.dao.DepartmentMapper;
import com.px.mms.domain.Department;


@RunWith(SpringJUnit4ClassRunner.class)  //使用junit4进行测试  
@WebAppConfiguration
@ContextConfiguration(locations={"/spring-mybatis.xml"}) //加载配置文件
public class Test01 {
	
	@Autowired
	private DepartmentMapper departmentMapper;

	@Test
	public void test1() {
		
		String id = UUID.randomUUID().toString().replaceAll("-", "");
		String name = "铁道部";
		Department department = new Department();
		department.setId(id);
		department.setName(name);
		departmentMapper.insert(department);
		
	}
}
