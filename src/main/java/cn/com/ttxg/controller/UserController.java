package cn.com.ttxg.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;

import cn.com.ttxg.pojo.User;
import cn.com.ttxg.service.UserService;

@Controller
public class UserController{

	@Autowired
	private UserService userService;
	
	
	
	@RequestMapping(value="loginByUser",method=RequestMethod.POST)
	public String loginByUser(String username,String password) {
//		 //1、获取securityManager factory
//        Factory<SecurityManager> factory = new IniSecurityManagerFactory("classpath:shiro.ini");
//        //2、根据factory得到 securityManager实例
//        SecurityManager securityManager = factory.getInstance();
//        //3、把实例绑定给securityUtils
//        SecurityUtils.setSecurityManager(securityManager);
//        //4、从securitytils获得subject(重要)
        
		Subject subject = SecurityUtils.getSubject();
        
		if (!subject.isAuthenticated()) {
        	UsernamePasswordToken token = new UsernamePasswordToken(username,password);
        	token.setRememberMe(true);
        
        	try{
        		//登陆
        		subject.login(token);
        		return "redirect:/ttxg_main.jsp";
        	}catch (AuthenticationException ae) {
				System.out.println("登录失败："+ae.getMessage());
				return "redirect:/ttxg_login.jsp";
			}
	
		}else{
			UsernamePasswordToken token = new UsernamePasswordToken(username,password);
        	token.setRememberMe(true);
			try{
        		//登陆
        		subject.login(token);
        		return "redirect:/ttxg_main.jsp";
        	}catch (AuthenticationException ae) {
				System.out.println("登录失败："+ae.getMessage());
				return "redirect:/ttxg_login.jsp";
			}
		}
        
		
	}
	
	
	
	
	
	
	
	@ResponseBody
	@RequestMapping(value="showUserByCondition",method=RequestMethod.GET)
	public ReturnMsg showUserByCondition(@RequestParam(value = "pn", defaultValue = "1") Integer pn,String condition,@RequestParam(value = "searchType", defaultValue = "1")int searchType){	
		PageInfo<User> page = userService.getUserPage(pn, condition, searchType);	
		return ReturnMsg.success().add("page", page);
	}
	@ResponseBody
	@RequestMapping(value="showCustomerByCondition",method=RequestMethod.GET)
	public ReturnMsg showCustomerByCondition(@RequestParam(value = "pn", defaultValue = "1") Integer pn,String condition,@RequestParam(value = "searchType", defaultValue = "1")int searchType){	
		PageInfo<User> page = userService.getCustomerPage(pn, condition, searchType);	
		return ReturnMsg.success().add("page", page);
	}
	
	
	
	
	@ResponseBody
	@RequestMapping("checkUserName")
	public ReturnMsg checkGoodsName(String username){
		boolean hasntSameName = userService.checkUserName(username);
		if(hasntSameName){
			return ReturnMsg.success();
		}else {
			return ReturnMsg.fail();
		}
		
	}
	
	
	@ResponseBody
	@RequestMapping(value="addUser",method=RequestMethod.POST)
	public ReturnMsg addUser(@RequestParam(value = "pn", defaultValue = "1") Integer pn,String condition,@RequestParam(value = "searchType", defaultValue = "1")int searchType,@Valid User user,BindingResult result ){
		
		if(result.hasErrors()){
			List<FieldError> errors = result.getFieldErrors();
			Map<String, Object> map = new HashMap<String, Object>();
			for(FieldError fieldError:errors){
				//错误字段名 getfiledid   错误信息 getdefaultmessage
				map.put(fieldError.getField(), fieldError.getDefaultMessage());
			}
			return ReturnMsg.fail().add("errorMap", map);
		}else {
			
			int a = userService.addUser(user);
			
			PageInfo<User> page = userService.getUserPage(pn, condition, searchType);
			return ReturnMsg.success().add("page", page);
		}

	}
	@ResponseBody
	@RequestMapping(value="deleteUserById/{ids}",method=RequestMethod.DELETE)
	public ReturnMsg deleteUserById(@PathVariable("ids") String ids){
		int a;
		//判断字符串是否含有 -
		if(ids.contains("-")){
			a=userService.deleteByIds(ids);		
			return ReturnMsg.success();
		}else{
			//删除成功返回1删除失败返回0
			Integer id = Integer.parseInt(ids);
			a=userService.deleteById(id);
			return ReturnMsg.success();	
		}

	}
	@ResponseBody
	@RequestMapping(value="getUserById/{id}",method=RequestMethod.GET)
	public ReturnMsg getUserById(@PathVariable("id") Integer id){
		User user = userService.getUserById(id);
		
		return ReturnMsg.success().add("user", user);
	}
	
	
	@ResponseBody
	@RequestMapping(value="updateUserById/{userid}",method=RequestMethod.PUT)
	public ReturnMsg updateUserById(@PathVariable("userid") Integer id,User user){
		int a = userService.updateUserById(user);
		
		return ReturnMsg.success();
	}
	
	@ResponseBody
	@RequestMapping(value="getUserIdByName",method=RequestMethod.GET)
	public ReturnMsg getUserIdByName(User user){
		int userid = userService.getUserIdByName(user);
		return ReturnMsg.success().add("userid", userid);
	}

}
