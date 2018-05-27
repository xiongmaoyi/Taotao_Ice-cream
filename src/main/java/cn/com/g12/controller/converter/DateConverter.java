package cn.com.g12.controller.converter;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.core.convert.converter.Converter;

public class DateConverter implements Converter<String, Date>{
	@Override
	public Date convert(String source) {
		// TODO Auto-generated method stub
		//日期串转日期类型 （yyyy-MM-dd: hh:mm:ss）
		SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		try {
			//转换成功直接返回
			return simpleDateFormat.parse(source);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//转换失败，返回空
		return null;
	}

}
