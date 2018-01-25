package cn.peter.ssm.service.impl;

import cn.peter.ssm.pojo.Leaverequest;
import cn.peter.ssm.service.ILeaveService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring-context.xml"})
public class LeaveServiceImplTest {

	@Autowired
	ILeaveService leaveService;

	@Autowired
	Leaverequest leave;

	@Test
	public void selectByAttributeSelective() {
		/*leave.setL_checker("Peter");
		leave.setL_proposer("Peter");
		List<Leaverequest> leaveList = leaveService.selectByAttributeSelective(leave);
		System.out.println(leaveList);*/
	}
}