package cn.com.g12.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import cn.com.g12.mapper.UserMapper;
import cn.com.g12.pojo.User;
import cn.com.g12.pojo.UserExample;

@Controller
public class UserController{

	@Autowired
	private UserMapper userMapper;
	
	@RequestMapping("showUserView.action")
	public ModelAndView showView() throws Exception {
		List<User> userList = new ArrayList<User>();

		UserExample example = new UserExample();
		userList = userMapper.selectByExample(example);
		
		
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("userList",userList);
		modelAndView.setViewName("/ShowUser.jsp");
		
		return modelAndView;
	}

}
