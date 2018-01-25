package cn.peter.ssm.service.impl;

import cn.peter.ssm.pojo.User;
import cn.peter.ssm.service.IUserService;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

import static org.junit.Assert.*;

/**
 * Created by yu on 18/1/20.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring-context.xml"})
public class UserServiceImplTest {

	@Autowired
	IUserService service;

	@Autowired
	User user;

    /*IUserService service = null;
    User user = null;

    @Before
    public void init() {
        service = new UserServiceImpl();
        user = new User();
    }*/

	@Test
	public void getUser() throws Exception {
        /*user.setUsername("Peter");
        user.setPassword("123");
        User serviceUser = service.getUser(this.user);
        System.out.println(serviceUser);*/
	}

	@Test
	public void testUpdateUser() throws Exception {
        /*user.setUid(1);
        user.setPassword("888");
        user.setNickname("天才Peter");
        Integer updateUser = service.updateUser(user);
        System.out.println(updateUser);*/
	}

	@Test
	public void testSelectAttribute() {
        /*user.setAuthority(1);
        List<User> userList = service.selectByAttributeSelective(user);
        System.out.println("========================");
        System.out.println(userList);
        System.out.println("========================");*/
	}

	@Test
	public void testInsert() {
        /*user.setUsername("Gaga");
        user.setPassword("66666");
		int i = service.insertByAttributeSelective(user);
		System.out.println(i);*/
	}

}