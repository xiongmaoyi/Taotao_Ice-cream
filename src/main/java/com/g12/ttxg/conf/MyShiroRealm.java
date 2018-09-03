package com.g12.ttxg.conf;


import com.g12.ttxg.pojo.*;
import com.g12.ttxg.service.UserService;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;

import javax.annotation.Resource;

public class MyShiroRealm extends AuthorizingRealm {

    @Resource
    private UserService userService;


    /**
     * 认证
     * @param token
     * @return
     * @throws AuthenticationException
     */

    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
        System.out.println("MyShiroRealm.doGetAuthenticationInfo()，认证方法执行ing。。。。。。。");
        //获取账号

        String username = (String)token.getPrincipal();
        System.out.println(token.getCredentials());


        //根据用户名，获取用户对象
        User user = userService.getUserByName(username);
        if(user == null){
            return null;
        }
        //根据（principal, credentials, realmName）创建认证信息并返回
        SimpleAuthenticationInfo authenticationInfo = new SimpleAuthenticationInfo(
                user.getUsername(), //这里传入的是用户名，如果传入user对象的话，在授权部分就不需要自己重新从数据库里取权限
                user.getPassword(), //正确的密码（散列后的密码，用于和token中的密码散列后做对比）
                ByteSource.Util.bytes(user.getCredentialsSalt()),//salt=username+salt，将用户名加盐参入密码中进行散列，后与password对比
                getName()  //realm name
        );
        return authenticationInfo;
    }

    /**
     * 授权
     * @param principals
     * @return
     */

    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
        System.out.println("权限配置-->MyShiroRealm.doGetAuthorizationInfo()");

        SimpleAuthorizationInfo authorizationInfo = new SimpleAuthorizationInfo();
        //如果授权部分没有传入User对象，这里只能取到userName
        //也就是SimpleAuthenticationInfo构造的时候第一个参数传递需要User对象

        UserCustom user = userService.getCompleteUserByName(principals.getPrimaryPrincipal().toString());
        for(SysRoleCustom role:user.getRoles()){
            //给该用户添加角色
            authorizationInfo.addRole(role.getRole());
            for(SysPermission p:role.getPermissions()){
                //把角色中的权限加给该用户
                authorizationInfo.addStringPermission(p.getPermission());
            }

        }
        return authorizationInfo;
    }



}
