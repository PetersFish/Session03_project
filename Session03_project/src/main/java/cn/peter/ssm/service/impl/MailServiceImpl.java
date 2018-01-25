package cn.peter.ssm.service.impl;

import cn.peter.ssm.mapper.MailMapper;
import cn.peter.ssm.pojo.Mail;
import cn.peter.ssm.pojo.User;
import cn.peter.ssm.service.IMailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MailServiceImpl implements IMailService {

	@Autowired
	MailMapper mailMapper;

	//创建邮件
	@Override
	public int insertSelective(Mail record) {

		return mailMapper.insertSelective(record);
	}

	//通过id获得邮件
	@Override
	public Mail selectByPrimaryKey(Integer m_id) {

		return mailMapper.selectByPrimaryKey(m_id);
	}

	//获取邮件列表
	@Override
	public List<Mail> listAll() {

		return mailMapper.listAll();
	}

	@Override
	public List<Mail> selectByUser(User user) {

		return mailMapper.selectByUser(user);
	}

	@Override
	public List<Mail> selectByTemplate(Mail record) {
		return mailMapper.selectByTemplate(record);
	}

	@Override
	public int deleteByPrimaryKey(Integer m_id) {

		return mailMapper.deleteByPrimaryKey(m_id);
	}

	@Override
	public int updateByPrimaryKeySelective(Mail record) {
		return mailMapper.updateByPrimaryKeySelective(record);
	}
}
