package cn.peter.ssm.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.peter.ssm.pojo.User;
import cn.peter.ssm.service.IUserService;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping(value = "/user")
public class UserController {

	@Autowired
	private IUserService userService;

	@Autowired
	private User user;

	//进入登录页面
	@RequestMapping(value = "/tologin.do")
	public String tologin() {

		return "login";
	}

	//进入登录页面
	@RequestMapping(value = "/toindex.do")
	public String toindex() {

		return "index";
	}

	//注销登录
	@RequestMapping(value = "/loginOut.action")
	public String logout(HttpSession session) {

		session.setAttribute("user", null);
		session.setAttribute("pageIfo", null);

		return "redirect:/user/tologin.do";
	}

	//跳转到个人信息页面
	@RequestMapping(value = "/forward.action")
	public String personalIfo(HttpSession session) {
		session.setAttribute("pageIfo", "infoRead.jsp");
		return "redirect:/user/toindex.do";
	}

	//跳转到个人信息页面
	@RequestMapping(value = "/userEdit.action")
	public String userEdit(HttpSession session) {
		session.setAttribute("pageIfo", "infoEdit.jsp");
		return "redirect:/user/toindex.do";
	}

	//检验登录信息，并将结果返回给请求的ajax
	@RequestMapping(value = "/checkifo.do")
	@ResponseBody
	public String checkIfo(User user, HttpSession session) {
		User result = userService.getUser(user);
		System.out.println(result);
		if (result != null) {
			session.setAttribute("user", result);
			User myuser = (User) session.getAttribute("user");
			System.out.println(myuser);
			return "1";
		} else {
			return "0";
		}
	}

	//修改用户信息
	@ResponseBody
	@RequestMapping(value = "/userInfo!editData.action")
	public String editData(User user, HttpSession session) {
		System.out.println("获取user：" + user);

		try {
			//获取user的uid
			User oldUser = (User) session.getAttribute("user");
			Integer uid = oldUser.getUid();

			//将uid赋值给user
			user.setUid(uid);

			//将新的user信息保存进数据库
			Integer result = userService.updateUser(user);

			//重新查询更新后的user信息，将其封装如session
			User newUser = userService.getUserById(uid);
			session.setAttribute("user", newUser);

			//更新后重新跳转的只读页面
			session.setAttribute("pageIfo", "infoRead.jsp");

			return "1";
		} catch (Exception e) {
			e.printStackTrace();
			return "0";
		}
	}

	//跳转显示账户信息的页面
	@RequestMapping(value = "accountShow.action")
	public String accountShow(HttpSession session) {

		session.setAttribute("pageIfo", "accountPersonal.jsp");
		return "redirect:/user/toindex.do";
	}

	//跳转显示账户编辑的页面
	@RequestMapping(value = "accountPersonalEditPage.action")
	public String accountEditPage(HttpSession session) {

		session.setAttribute("pageIfo", "accountPersonalEdit.jsp");
		return "redirect:/user/toindex.do";
	}

	//编辑账户信息
	@ResponseBody
	@RequestMapping(value = "accountEditSubmit.action")
	public String accountEditSubmit(HttpSession session, User user) {

		//通过id更新user信息
		Integer integer = userService.updateUser(user);
		session.setAttribute("user", null);
		session.setAttribute("pageIfo", "accountPersonal.jsp");
		return "1";
	}

	//管理员账户信息列表
	@RequestMapping(value = "accountAdmin.action")
	public String accountAdmin(HttpSession session) {

		//获取所以账户信息，将list存入session
		List<User> userList = userService.listAll();
		session.setAttribute("userList", userList);
		session.setAttribute("pageIfo", "accountAdmin.jsp");
		return "redirect:/user/toindex.do";
	}

	//管理员编辑账户信息
	@RequestMapping(value = "accountAdminEdit.action")
	public String accountAdminEdit(@RequestParam(value = "uid") String str_id, HttpSession session) {

		//先获取特定的user对象，封装入session
		User userForAdmin = userService.getUserById(Integer.parseInt(str_id));
		session.setAttribute("userForAdmin", userForAdmin);
		//跳转到编辑页面
		session.setAttribute("pageIfo", "accountAdminEdit.jsp");
		return "redirect:/user/toindex.do";
	}

	//管理员添加账户信息的页面
	@RequestMapping(value = "accountAddPage.action")
	public String accountAddPage(HttpSession session) {

		//跳转到编辑页面
		session.setAttribute("pageIfo", "accountAdminAdd.jsp");
		return "redirect:/user/toindex.do";
	}

	//管理员添加账户信息提交动作
	@ResponseBody
	@RequestMapping(value = "accountAddSubmit.action")
	public String accountAddSubmit(HttpSession session, User user) {

		//将获得的user信息传入数据库
		userService.insertByAttributeSelective(user);
		//跳转到编辑页面
		session.setAttribute("pageIfo", "accountAdmin.jsp");
		return "1";
	}
}
