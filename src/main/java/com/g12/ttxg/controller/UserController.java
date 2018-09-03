package com.g12.ttxg.controller;


import com.g12.ttxg.pojo.User;
import com.g12.ttxg.service.UserService;
import com.g12.ttxg.utils.ReturnMsg;
import com.github.pagehelper.PageInfo;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class UserController{

	@Autowired
	private UserService userService;
	
	
	
	@RequestMapping(value="loginByUser",method= RequestMethod.POST)
	public String loginByUser(String username,String password) {

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
	public ReturnMsg showUserByCondition(@RequestParam(value = "pn", defaultValue = "1") Integer pn, String condition, @RequestParam(value = "searchType", defaultValue = "1")int searchType){
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
	public ReturnMsg addUser(@RequestParam(value = "pn", defaultValue = "1") Integer pn, String condition, @RequestParam(value = "searchType", defaultValue = "1")int searchType, @Valid User user, BindingResult result ){
		
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
