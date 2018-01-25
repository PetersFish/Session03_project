package cn.peter.ssm.service.impl;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.peter.ssm.mapper.UserMapper;
import cn.peter.ssm.pojo.User;
import cn.peter.ssm.service.IUserService;

@Service
public class UserServiceImpl implements IUserService {

	@Autowired
	private UserMapper mapper;

	//select users by attributes
	public User getUser(User user) {

		return mapper.getUser(user);
	}

	//check user info
	public boolean checkIfo(User user) {
		User reslut = getUser(user);
		System.out.println(reslut);
		if (reslut != null) {
			return true;
		}
		return false;
	}

	//更新user信息
	@Override
	public Integer updateUser(User user) {

		System.out.println("======执行了user更新操作======");
		return mapper.updateUser(user);
	}

	//通过id获取user信息
	@Override
	public User getUserById(Integer id) {

		return mapper.getUserById(id);
	}

	//获取所有user
	@Override
	public List<User> listAll() {
		return mapper.listAll();
	}

	@Override
	public List<User> selectByAttributeSelective(User user) {
		return mapper.selectByAttributeSelective(user);
	}

	//insert user by selective attributes
	@Override
	public int insertByAttributeSelective(User user) {

		return mapper.insertByAttributeSelective(user);
	}

}
