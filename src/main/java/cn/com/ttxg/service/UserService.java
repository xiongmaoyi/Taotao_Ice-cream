package cn.com.ttxg.service;

import javax.validation.Valid;

import com.github.pagehelper.PageInfo;

import cn.com.ttxg.pojo.User;

public interface UserService {
	public PageInfo<User> getUserPage(Integer pn,String condition,int searchType);

	public boolean checkUserName(String username);


	public int addUser(@Valid User user);

	public int deleteById(Integer id);

	public int deleteByIds(String ids);

	public User getUserById(Integer id);

	public int updateUserById(User user);

	
}
