package cn.peter.ssm.service;


import cn.peter.ssm.pojo.Mail;
import cn.peter.ssm.pojo.User;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface IMailService {

	//创建邮件
	int insertSelective(Mail record);

	//通过id获得邮件
	Mail selectByPrimaryKey(Integer m_id);

	//获取邮件列表
	List<Mail> listAll();

	//从数据库获取特定user的mailList
	List<Mail> selectByUser(User user);

	//通过mail模板获得mailList
	List<Mail> selectByTemplate(Mail record);

	//根据m_id删除mail
	int deleteByPrimaryKey(Integer m_id);

	//通过主键更新mail
	int updateByPrimaryKeySelective(Mail record);
}
