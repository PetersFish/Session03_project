package cn.peter.ssm.service.impl;

import cn.peter.ssm.pojo.Mail;
import cn.peter.ssm.service.IMailService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.text.SimpleDateFormat;
import java.util.Date;

import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring-context.xml"})
public class MailServiceImplTest {

	@Autowired
	IMailService mailService;

	@Autowired
	Mail mail;

	@Test
	public void insert() {
		/*mail.setM_content("我写了一封邮件");
		mail.setM_file("/user/mail");
		mail.setM_isDelete(0);
		mail.setM_isRead(0);
		mail.setM_sender("习大大");
		mail.setM_target("Peter");
		mail.setM_title("任命书");
		Date date = new Date();
		SimpleDateFormat smt = new SimpleDateFormat("yyyy-MM-dd");
		String format_str = smt.format(date);
		System.out.println(format_str);
		mail.setM_date(format_str);
		int i = mailService.insertSelective(mail);
		System.out.println(i);*/
	}
}