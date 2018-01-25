package cn.peter.ssm.mapper;


import java.util.List;

import cn.peter.ssm.pojo.User;

public interface UserMapper {

	//select user by user attributes
	User getUser(User user);

	//save user
	Integer updateUser(User user);

	//select user by id
	User getUserById(Integer id);

	//list users
	List<User> listAll();

	//list user by attributes
	List<User> selectByAttributeSelective(User user);

	//insert by selective
	int insertByAttributeSelective(User user);
}
