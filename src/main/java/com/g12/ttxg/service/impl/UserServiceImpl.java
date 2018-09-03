package com.g12.ttxg.service.impl;


import com.g12.ttxg.mapper.SysUserRoleMapper;
import com.g12.ttxg.mapper.UserMapper;
import com.g12.ttxg.pojo.*;
import com.g12.ttxg.service.UserService;
import com.g12.ttxg.utils.Encrypt;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import javax.validation.Valid;
import java.util.ArrayList;
import java.util.List;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserMapper userMapper;
	@Autowired
	private SysUserRoleMapper sysUserRoleMapper;

	
	@Override
	public PageInfo<User> getUserPage(Integer pn, String condition, int searchType) {
		UserExample example = new UserExample();
		if(!StringUtils.isEmpty(condition)){
			if(searchType==1){
				example.createCriteria().andUseridEqualTo(Integer.parseInt(condition));
			}else if(searchType==2){
				example.createCriteria().andUsernameLike("%"+condition+"%");
			}else if(searchType==3){
				example.createCriteria().andNameLike("%"+condition+"%");
			}else if(searchType==4){
				example.createCriteria().andPhoneLike("%"+condition+"%");
			}		
		}
		
		// 从pn页开始查，每页显示5个数据，start后面紧跟的查询就是分页查询
		PageHelper.startPage(pn, 5);
		List<User> userList = userMapper.selectByExample(example);
		PageInfo<User> page = new PageInfo<User>(userList, 5);

		return page;
	
	}

	@Override
	public boolean checkUserName(String username) {
		UserExample example = new UserExample();
		example.createCriteria().andUsernameEqualTo(username);
		long count = userMapper.countByExample(example);
		return count==0;
	}

	@Override
	public int addUser(@Valid User user) {
		Encrypt encrypt = Encrypt.ofEncrypt();
		encrypt.generateSaltAnEcdPwd(user.getUsername(),user.getPassword());
		user.setPassword(encrypt.getEncodedPassword());
		user.setSalt(encrypt.getSalt());

		return userMapper.insert(user);

	}

	@Override
	public int deleteById(Integer id) {
		return userMapper.deleteByPrimaryKey(id);
	}

	@Override
	public int deleteByIds(String ids) {
		List<Integer> idList =new ArrayList<Integer>();
		String[] str_ids = ids.split("-");
		for(String s:str_ids){
			idList.add(Integer.parseInt(s));
		}
		UserExample example = new UserExample();
		example.createCriteria().andUseridIn(idList);
		
		return userMapper.deleteByExample(example);
	}

	@Override
	public User getUserById(Integer id) {	
		return userMapper.selectByPrimaryKey(id);
	}

	@Override
	public int updateUserById(User user) {
		Encrypt encrypt = Encrypt.ofEncrypt();
		encrypt.generateSaltAnEcdPwd(user.getUsername(),user.getPassword());
		user.setSalt(encrypt.getSalt());
		user.setPassword(encrypt.getEncodedPassword());

		changeRole(user);
		return userMapper.updateByPrimaryKeySelective(user);
	}

	@Override
	public int getUserIdByName(User user) {
		UserExample example = new UserExample();
		example.createCriteria().andUsernameEqualTo(user.getUsername());
		List<User> users =  userMapper.selectByExample(example);
		int userid = users.get(0).getUserid();
		return userid;
	}

	@Override
	public User getUserByName(String username) {

		UserExample example = new UserExample();
		example.createCriteria().andUsernameLike(username);
		User user = userMapper.selectByExample(example).get(0);

		return user;
	}

	@Override
	public PageInfo<User> getCustomerPage(Integer pn, String condition, int searchType) {
		UserExample example = new UserExample();
		List<String> typeList =new ArrayList<String>();
		typeList.add("3");
		typeList.add("5");
		UserExample.Criteria criteria = example.createCriteria().andUsertypeIn(typeList);
		if(!StringUtils.isEmpty(condition)){
			if(searchType==1){
				criteria.andUseridEqualTo(Integer.parseInt(condition));
			}else if(searchType==2){
				criteria.andUsernameLike("%"+condition+"%");
			}else if(searchType==3){
				criteria.andNameLike("%"+condition+"%");
			}else if(searchType==4){
				criteria.andPhoneLike("%"+condition+"%");
			}		
		}
		
		// 从pn页开始查，每页显示5个数据，start后面紧跟的查询就是分页查询
		PageHelper.startPage(pn, 5);
		List<User> userList = userMapper.selectByExample(example);
		PageInfo<User> page = new PageInfo<User>(userList, 5);
		
		return page;

	}

	@Override
	public UserCustom getCompleteUserByName(String username) {
		UserExample example = new UserExample();
		example.createCriteria().andUsernameLike(username);
		UserCustom user = userMapper.selectCompleteUser(example).get(0);
		return user;
	}


	public void changeRole(User user){

		SysUserRoleExample example = new SysUserRoleExample();
		example.createCriteria().andUserIdEqualTo(user.getUserid());
		List<SysUserRole> sysUserRoles = sysUserRoleMapper.selectByExample(example);
		int role;
		switch (user.getUsertype()){
			case "1":
				role = 1;
				break;
			case "2":
				role = 2;
				break;
			case "3":
				role = 3;
				break;
			case "4":
				role = 4;
				break;
			default:
				role= 5;
		}

		SysUserRole sysUserRole = new SysUserRole();
		sysUserRole.setRoleId(role);
		sysUserRole.setUserId(user.getUserid());

		if(sysUserRoles.isEmpty()){
			sysUserRoleMapper.insertSelective(sysUserRole);
		}else {
			sysUserRoleMapper.updateByExampleSelective(sysUserRole,example);
		}

	}

}
