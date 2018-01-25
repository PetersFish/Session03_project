package cn.peter.ssm.service;

import cn.peter.ssm.pojo.Leaverequest;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface ILeaveService {

	//通过属性查询leaveList
	List<Leaverequest> selectByAttributeSelective(Leaverequest record);

	//动态属性插入一条leave数据
	int insertSelective(Leaverequest record);

	//通过id获得leave
	Leaverequest selectByPrimaryKey(Integer l_id);

	//通过id选择性修改leave属性
	int updateByPrimaryKeySelective(Leaverequest record);
}
