package cn.peter.ssm.service;

import java.util.List;

import cn.peter.ssm.pojo.User;
import org.springframework.stereotype.Service;

@Service
public interface IUserService {

	User getUser(User user);

	boolean checkIfo(User user);

	Integer updateUser(User user);

	User getUserById(Integer id);

	List<User> listAll();

	List<User> selectByAttributeSelective(User user);

	int insertByAttributeSelective(User user);

}
