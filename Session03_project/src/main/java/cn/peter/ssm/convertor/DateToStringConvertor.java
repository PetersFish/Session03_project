package cn.peter.ssm.convertor;

import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;

import java.text.SimpleDateFormat;
import java.util.Date;

@Component
public class DateToStringConvertor implements Converter<Date, String> {
	@Override
	public String convert(Date date) {
		String format = new SimpleDateFormat("yyyy-MM-dd").format(date);
		return format;
	}
}
