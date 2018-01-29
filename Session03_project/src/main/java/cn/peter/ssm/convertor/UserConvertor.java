package cn.peter.ssm.convertor;

import cn.peter.ssm.pojo.Leaverequest;
import cn.peter.ssm.pojo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

@Component
public class UserConvertor implements Converter<Map<String, String>, Leaverequest> {

	@Autowired
	Leaverequest leaverequest;

	@Override
	public Leaverequest convert(Map<String, String> map) {
		if (map != null) {
			try {
				Date beginTime = new SimpleDateFormat("yyyy-MM-dd").parse(map.get("l_beginTime"));
				Date endTime = new SimpleDateFormat("yyyy-MM-dd").parse(map.get("l_endTime"));
				leaverequest.setL_id(Integer.valueOf(map.get("l_id")));
				leaverequest.setL_proposer(map.get("l_proposer"));
				leaverequest.setL_beginTime(beginTime);
				leaverequest.setL_endTime(endTime);
				leaverequest.setL_days(Integer.valueOf(map.get("l_days")));
				leaverequest.setL_approve(Integer.valueOf(map.get("l_approve")));
				leaverequest.setL_reason(map.get("l_reason"));
				leaverequest.setL_checker(map.get("l_checker"));
				return leaverequest;
			} catch (ParseException e) {
				e.printStackTrace();
				return null;
			}
		}
		return null;
	}
}
