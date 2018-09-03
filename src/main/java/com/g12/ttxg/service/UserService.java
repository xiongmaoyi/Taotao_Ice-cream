package com.g12.ttxg.service;


import com.g12.ttxg.pojo.User;
import com.g12.ttxg.pojo.UserCustom;
import com.github.pagehelper.PageInfo;

import javax.validation.Valid;

public interface UserService {
	public PageInfo<User> getUserPage(Integer pn, String condition, int searchType);

	public boolean checkUserName(String username);

	/**
	 * 生成 随机盐 用md5方式加盐散列密码并插入数据库
	 * @param user
	 * @return
	 */
	public int addUser(@Valid User user);

	public int deleteById(Integer id);

	public int deleteByIds(String ids);

	public User getUserById(Integer id);

	public int updateUserById(User user);
	
	public int getUserIdByName(User user);

	public User getUserByName(String username);

	public PageInfo<User> getCustomerPage(Integer pn, String condition, int searchType);
	UserCustom getCompleteUserByName(String username);




	public void changeRole(User user);
}
