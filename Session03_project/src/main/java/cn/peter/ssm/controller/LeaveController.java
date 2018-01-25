package cn.peter.ssm.controller;

import cn.peter.ssm.pojo.Leaverequest;
import cn.peter.ssm.pojo.User;
import cn.peter.ssm.service.ILeaveService;
import cn.peter.ssm.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping(value = "/leave")
public class LeaveController {

	@Autowired
	ILeaveService leaveService;

	@Autowired
	IUserService userService;

	@Autowired
	Leaverequest leaverequest;

	@Autowired
	User user;

	//跳转到请假页面
	@RequestMapping(value = "/leave.action")
	public String leave(HttpSession session) {

		//查询请假清单，封装入session
		//通过用户权限以及用户昵称进行查询
		/*
		 * 1、如果是管理员权限，通过查l_checker（审批人）以及l_proposer（申请人）来查询；
		 * 2、如果是普通用户权限，只通过l_proposer（申请人）进行查询
		 * */
		user = (User) session.getAttribute("user");
		String nickname = user.getNickname();
		leaverequest.setL_proposer(nickname);

		List<Leaverequest> leaverequestList = leaveService.selectByAttributeSelective(leaverequest);
		leaverequest.setL_proposer(null);
		session.setAttribute("leaverequestList", leaverequestList);
		session.setAttribute("pageIfo", "leaveSheet.jsp");
		return "redirect:/user/toindex.do";
	}

	//跳转到审核页面
	@RequestMapping(value = "/leaveCheck.action")
	public String leaveCheck(HttpSession session) {

		//查询请假清单，封装入session
		//通过用户权限以及用户昵称进行查询
		user = (User) session.getAttribute("user");
		String nickname = user.getNickname();
		leaverequest.setL_checker(nickname);

		List<Leaverequest> leavecheckList = leaveService.selectByAttributeSelective(leaverequest);
		leaverequest.setL_checker(null);
		session.setAttribute("leavecheckList", leavecheckList);
		session.setAttribute("pageIfo", "leaveCheckSheet.jsp");
		return "redirect:/user/toindex.do";
	}

	//跳转到写请假条的页面
	@RequestMapping(value = "/leaveWrite.action")
	public String leaveWrite(HttpSession session) {

		//在跳转之前，要将管理员名单传过去
		user.setAuthority(1);
		List<User> adminList = userService.selectByAttributeSelective(user);

		session.setAttribute("adminList", adminList);
		session.setAttribute("pageIfo", "leaveForm.jsp");
		return "redirect:/user/toindex.do";
	}

	//存储leave表单
	@ResponseBody
	@RequestMapping(value = "/leaveFormSave.action")
	public String leaveFormSave(Leaverequest leaverequest) {

		//存储传过来的leaverequest
		leaveService.insertSelective(leaverequest);

		return "1";
	}

	//跳转到leave审核页面
	@RequestMapping(value = "leaveFormCheck.action")
	public String leaveFormCheck(HttpSession session, @RequestParam(value = "l_id") String str_id) {

		//通过id获取需要审核的leave的
		Leaverequest leaveForCheck = leaveService.selectByPrimaryKey(Integer.parseInt(str_id));
		session.setAttribute("leaveForCheck", leaveForCheck);
		session.setAttribute("pageIfo", "leaveCheckForm.jsp");
		return "redirect:/user/toindex.do";
	}

	//审核leave表单
	@ResponseBody
	@RequestMapping(value = "approveLeaveAsk.action")
	public String approveLeaveAsk(Leaverequest leaverequest) {
		//设置leave对象的l_approve属性，需要leave的id信息
		leaveService.updateByPrimaryKeySelective(leaverequest);
		return "1";
	}
}
