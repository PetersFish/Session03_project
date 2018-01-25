package cn.peter.ssm.controller;

import cn.peter.ssm.pojo.Mail;
import cn.peter.ssm.pojo.User;
import cn.peter.ssm.service.IMailService;
import cn.peter.ssm.service.IUserService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value = "/mail")
public class MailController {

	@Autowired
	IMailService mailService;

	@Autowired
	IUserService userService;

	@Autowired
	Mail mail;


	//跳转到写邮件页面
	@RequestMapping(value = "/mailWrite.action")
	public String emailWrite(HttpSession session) {

		session.setAttribute("pageIfo", "mailWrite.jsp");
		List<User> users = userService.listAll();
		session.setAttribute("users", users);
		return "redirect:/user/toindex.do";
	}

	//跳转到邮件显示页面
	@RequestMapping(value = "readMail.action")
	public String readMail(@RequestParam(value = "m_id") String id, HttpSession session) {

		//获得指定的mail
		Integer m_id = Integer.parseInt(id);
		mail.setM_id(m_id);
		Mail mail = mailService.selectByPrimaryKey(m_id);

		//将mail设为已读状态，并重新更新到数据库
		mail.setM_isRead(1);
		mailService.updateByPrimaryKeySelective(mail);

		//将mail存入session
		session.setAttribute("mail", mail);
		session.setAttribute("pageIfo", "readMail.jsp");

		return "redirect:/user/toindex.do";
	}

	//跳转到垃圾邮件显示页面
	@RequestMapping(value = "readTrashMail.action")
	public String readTrashMail(@RequestParam(value = "m_id") String id, HttpSession session) {

		//获得指定的mail
		Integer m_id = Integer.parseInt(id);
		mail.setM_id(m_id);
		Mail mail = mailService.selectByPrimaryKey(m_id);

		//将mail设为已读状态，并重新更新到数据库
		mail.setM_isRead(1);
		mailService.updateByPrimaryKeySelective(mail);

		//将mail存入session
		session.setAttribute("trashMail", mail);
		session.setAttribute("pageIfo", "readTrashMail.jsp");

		return "redirect:/user/toindex.do";
	}

	//发送邮件
	@ResponseBody
	@RequestMapping(value = "/mailUpdate.action")
	public String emailSend(Mail mail, HttpSession session, @Param(value = "file") MultipartFile file) {

		//处理附件上传的模块
		try {
			String attach_addr = "/Users/yu/IdeaProjects/Session03_project/src/main/webapp/attachment/";
			if (file != null && !file.isEmpty()) {
				String filename = file.getOriginalFilename();
				String path = attach_addr + filename;
				file.transferTo(new File(path));
				mail.setM_file("/attachment/" + filename);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}

		Date date = new Date();
		SimpleDateFormat smt = new SimpleDateFormat("yyyy-MM-dd");
		String format_str = smt.format(date);
		System.out.println(format_str);
		mail.setM_date(format_str);

		mailService.insertSelective(mail);
		session.setAttribute("pageIfo", "mailWrite.jsp");
		return "1";
	}

	//跳转到收邮件页面
	@RequestMapping(value = "/mailReceive!receive.action")
	public String mailReceive(HttpSession session) {

		//根据m_target以及m_isDelete来筛选列表，首先得得到一个mail对象，根据这个对象去查找
		mail.setM_isDelete(0);
		User user = (User) session.getAttribute("user");
		String nickname = user.getNickname();
		mail.setM_target(nickname);

		Mail temp = mail;

		List<Mail> mailList = mailService.selectByTemplate(temp);
		session.setAttribute("mailList", mailList);
		session.setAttribute("pageIfo", "mailReceive.jsp");

		return "redirect:/user/toindex.do";
	}

	//跳转到回收站页面
	@RequestMapping(value = "/mailGarage!garage.action")
	public String mailGarage(HttpSession session) {

		//根据m_target以及m_isDelete来筛选列表，首先得得到一个mail对象，根据这个对象去查找
		mail.setM_isDelete(1);
		User user = (User) session.getAttribute("user");
		String nickname = user.getNickname();
		mail.setM_target(nickname);

		Mail temp = mail;

		List<Mail> trashMailList = mailService.selectByTemplate(temp);
		session.setAttribute("trashMailList", trashMailList);
		session.setAttribute("pageIfo", "mailTrach.jsp");

		return "redirect:/user/toindex.do";
	}

	//移动邮件到回收站
	@ResponseBody
	@RequestMapping(value = "/removeToCan.action")
	public String removeToCan(@RequestParam(value = "m_id") String str_id) {

		Integer id = Integer.valueOf(str_id);
		mail.setM_id(id);
		mail.setM_isDelete(1);
		mailService.updateByPrimaryKeySelective(mail);

		return "1";
	}

	//从垃圾箱恢复邮件
	@ResponseBody
	@RequestMapping(value = "/recoverMail.action")
	public String recoverMail(@RequestParam(value = "m_id") String str_id) {

		Integer id = Integer.valueOf(str_id);
		mail.setM_id(id);
		mail.setM_isDelete(0);
		mailService.updateByPrimaryKeySelective(mail);

		return "1";
	}

	//彻底删除邮件
	@ResponseBody
	@RequestMapping(value = "/deleteMail.action")
	public String deleteMail(@RequestParam(value = "m_id") String str_id) {

		Integer id = Integer.valueOf(str_id);

		mailService.deleteByPrimaryKey(id);

		return "1";
	}
}
