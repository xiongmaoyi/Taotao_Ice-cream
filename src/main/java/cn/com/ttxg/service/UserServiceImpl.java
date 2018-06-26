package cn.com.ttxg.service;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.forwardedUrl;

import java.util.ArrayList;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alibaba.druid.sql.ast.statement.SQLIfStatement.Else;
import com.alibaba.druid.util.StringUtils;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import cn.com.ttxg.mapper.UserMapper;
import cn.com.ttxg.pojo.GoodsCustom;
import cn.com.ttxg.pojo.User;
import cn.com.ttxg.pojo.UserExample;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserMapper userMapper;
	
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
		return userMapper.updateByPrimaryKeySelective(user);
	}

}
