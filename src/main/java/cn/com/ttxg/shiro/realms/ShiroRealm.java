package cn.com.ttxg.shiro.realms;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthenticatingRealm;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;

import cn.com.ttxg.mapper.UserMapper;
import cn.com.ttxg.pojo.User;
import cn.com.ttxg.pojo.UserExample;

public class ShiroRealm extends AuthorizingRealm  {

	@Autowired
	UserMapper userMapper;
	
	private int usertype;
	
	//认证
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
		UsernamePasswordToken upToken = (UsernamePasswordToken) token;
		String username = upToken.getUsername();
		
		UserExample example = new UserExample();
		example.createCriteria().andUsernameEqualTo(username);
		List<User> userList = userMapper.selectByExample(example);
		
		
		if(userList.size()==0){
			throw new AuthenticationException("用户名不存在");
		}else{
			usertype = Integer.parseInt(userList.get(0).getUsertype());
		}
		
		if (!String.valueOf(upToken.getPassword()).equals(userList.get(0).getPassword())) {
			throw new IncorrectCredentialsException("密码不正确");
		}
		
		//principal 认证的实体信息 ，可以是username 可以是实体类对象
		Object principal = username;
		//密码
		Object credentials = userList.get(0).getPassword();
		//realmname
		String realmName = getName();
		SimpleAuthenticationInfo info = new SimpleAuthenticationInfo(principal, credentials, realmName);
		
		return info;
	}

	//授权
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
		//获得用户名
		Object principal = principals.getPrimaryPrincipal();
		Set<String> roles = new HashSet<String>();
		if(usertype==1){
			roles.add("admin");
			roles.add("sale");
			roles.add("delivery");
			roles.add("customer");
			roles.add("ssm");
		}else if(usertype==2){
			roles.add("sale");
			roles.add("ssm");
		}else if(usertype==3){
			roles.add("lv3");
		}else if(usertype==4){
			roles.add("delivery");
			roles.add("ssm");
		}else if(usertype==5){
			roles.add("customer");
		}
		SimpleAuthorizationInfo info = new SimpleAuthorizationInfo(roles);
		return info;
	}

	

}
