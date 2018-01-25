package cn.peter.ssm.service.impl;

import cn.peter.ssm.mapper.LeaverequestMapper;
import cn.peter.ssm.pojo.Leaverequest;
import cn.peter.ssm.service.ILeaveService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LeaveServiceImpl implements ILeaveService {

	@Autowired
	LeaverequestMapper leaveMapper;

	@Override
	public List<Leaverequest> selectByAttributeSelective(Leaverequest record) {

		return leaveMapper.selectByAttributeSelective(record);
	}

	@Override
	public int insertSelective(Leaverequest record) {
		return leaveMapper.insertSelective(record);
	}

	@Override
	public Leaverequest selectByPrimaryKey(Integer l_id) {

		return leaveMapper.selectByPrimaryKey(l_id);
	}

	@Override
	public int updateByPrimaryKeySelective(Leaverequest record) {
		return leaveMapper.updateByPrimaryKeySelective(record);
	}
}
