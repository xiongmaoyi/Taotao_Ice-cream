package com.g12.ttxg.controller;


import com.g12.ttxg.mapper.UserMapper;
import com.g12.ttxg.pojo.SysUserRole;
import com.g12.ttxg.pojo.UserCustom;
import com.g12.ttxg.service.HomeService;
import com.g12.ttxg.utils.LoginResult;
import com.g12.ttxg.utils.ReturnMsg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

@Controller
public class HomeController {


    @Autowired
    private HomeService homeService;
    @Autowired
    private UserMapper userMapper;

    @RequestMapping(value = {"/index","/"})
    public String index(){
        return "index";
    }


    @RequestMapping(value ="/login",method = RequestMethod.GET)
    public String toLogin(Map<String, Object> map, HttpServletRequest request){

        return "login";
    }



    @RequestMapping(value ="/login",method = RequestMethod.POST)
    public String login(HttpServletRequest request, Map<String, Object> map) throws Exception{
        System.out.println("HomeController.login()");

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        LoginResult loginResult = homeService.login(username,password);

        if(loginResult.isLogin()) {
            return "index";
        }else {
            map.put("msg",loginResult.getResult());
            map.put("username",username);
            return "login";
        }

    }

    /**
     * 页面跳转
     * @param map
     * @param request
     * @return
     */
    @RequestMapping(value ="/html/MyDeliver",method = RequestMethod.GET)
    public String toMyDeliver(Map<String, Object> map, HttpServletRequest request){
        return "html/MyDeliver";
    }
    @RequestMapping(value ="/html/CustomerManage",method = RequestMethod.GET)
    public String toCustomerManage(Map<String, Object> map, HttpServletRequest request){
        return "html/CustomerManage";
    }
    @RequestMapping(value ="/html/GoodsManage",method = RequestMethod.GET)
    public String toGoodsManage(Map<String, Object> map, HttpServletRequest request){
        return "html/GoodsManage";
    }
    @RequestMapping(value ="/html/InStorehouse",method = RequestMethod.GET)
    public String toInStorehouse(Map<String, Object> map, HttpServletRequest request){
        return "html/InStorehouse";
    }
    @RequestMapping(value ="/html/OfflineSale",method = RequestMethod.GET)
    public String toOfflineSale(Map<String, Object> map, HttpServletRequest request){
        return "html/OfflineSale";
    }

    @RequestMapping(value ="/html/OrderMsg",method = RequestMethod.GET)
    public String toOrderMsg(Map<String, Object> map, HttpServletRequest request,@RequestParam("orderid")String orderid){
        request.setAttribute("orderid",orderid);

        System.out.println("xxx88--------------->>>>>>>>>"+orderid);
        return "html/OrderMsg";
    }
    @RequestMapping(value ="/html/Purchase",method = RequestMethod.GET)
    public String toPurchase(Map<String, Object> map, HttpServletRequest request){
        return "html/Purchase";
    }
    @RequestMapping(value ="/html/SearchPurchase",method = RequestMethod.GET)
    public String toSearchPurchase(Map<String, Object> map, HttpServletRequest request){
        return "html/SearchPurchase";
    }
    @RequestMapping(value ="/html/SearchSale",method = RequestMethod.GET)
    public String toSearchSale(Map<String, Object> map, HttpServletRequest request){
        return "html/SearchSale";
    }
    @RequestMapping(value ="/html/Statistics",method = RequestMethod.GET)
    public String toStatistics(Map<String, Object> map, HttpServletRequest request){
        return "html/Statistics";
    }
    @RequestMapping(value ="/html/UnDeliver",method = RequestMethod.GET)
    public String toUnDeliver(Map<String, Object> map, HttpServletRequest request){
        return "html/UnDeliver";
    }
    @RequestMapping(value ="/html/UserManage",method = RequestMethod.GET)
    public String toUserManage(Map<String, Object> map, HttpServletRequest request){
        return "html/UserManage";
    }
    @RequestMapping(value ="/html/OrderManage",method = RequestMethod.GET)
    public String toOrderManage(Map<String, Object> map, HttpServletRequest request){
        return "html/OrderManage";
    }
    @RequestMapping(value ="/html/BrandManage",method = RequestMethod.GET)
    public String toBrandManage(Map<String, Object> map, HttpServletRequest request){
        return "html/BrandManage";
    }





    @RequestMapping("/main-img")
    public String toMainImg(){
        return "main-img";
    }


    @RequestMapping("/403")
    public String unauthorizedRole(){
        System.out.println("------没有权限-------");
        return "403";
    }

    @ResponseBody
    @RequestMapping("/test")
    public ReturnMsg test(){

        System.out.println("------userlist-------");
        List<UserCustom> userList = userMapper.selectCompleteUser(null);
        System.out.println("------userlist-------");


        return ReturnMsg.success().add("users",userList);
    }




}
