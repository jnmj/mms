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
import com.px.mms.domain.Person;
import com.px.mms.service.DepartmentService;
import com.px.mms.service.UserService;


@RunWith(SpringJUnit4ClassRunner.class)  //使用junit4进行测试  
@WebAppConfiguration
@ContextConfiguration(locations={"/spring-mybatis.xml"}) //加载配置文件
public class Test01 {
	
	@Autowired
	private DepartmentService departmentService;

	@Autowired
	private UserService userService;
	@Test
	public void test1() {
		for(int i=34;i<35;i++) {
			Person person = new Person();
			person.setId("2016110125");
			person.setName("罗贯中");
			person.setPassword("123456");
			person.setPhone("13261712886");
			person.setEmail("754737592@qq.com");
			person.setRole(0);
			person.setDepartmentId("a39fa73e47994a23bf3f53583e0c54f7");
			userService.addUser(person);
		}
		
		
	}
}
