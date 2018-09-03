package com.g12.ttxg.service.impl;


import com.g12.ttxg.service.HomeService;
import com.g12.ttxg.utils.LoginResult;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Service;

@Service
public class HomeServiceImpl implements HomeService {
    @Override
    public LoginResult login(String username, String password) {
        LoginResult loginResult = new LoginResult();

        if(username==null || username.isEmpty())
        {
            loginResult.setLogin(false);
            loginResult.setResult("用户名为空");
            return loginResult;
        }
        String msg="";
        // 1、获取Subject实例对象
        Subject currentUser = SecurityUtils.getSubject();

        // 2、将用户名和密码封装到UsernamePasswordToken
        UsernamePasswordToken token = new UsernamePasswordToken(username, password);

        // 3、认证
        try {
            currentUser.login(token);// 传到 MyAuthorizingRealm 类中的方法进行认证

            Session session = currentUser.getSession();
            session.setAttribute("userName", username);

            //登陆状态设置为true
            loginResult.setLogin(true);
            return loginResult;
        }catch (UnknownAccountException e)
        {
            e.printStackTrace();
            msg = "UnknownAccountException -- > 账号不存在：";
        }
        catch (IncorrectCredentialsException e)
        {
            msg = "IncorrectCredentialsException -- > 密码不正确：";
        }
        catch (AuthenticationException e) {
            e.printStackTrace();
            msg="用户验证失败";
        }


        loginResult.setLogin(false);
        loginResult.setResult(msg);

        return loginResult;
    }


    /**
     * 注销
     */
    @Override
    public void logout() {
        Subject subject = SecurityUtils.getSubject();
        subject.logout();
    }

}
