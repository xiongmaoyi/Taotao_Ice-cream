package com.g12.ttxg.utils;

import org.apache.shiro.crypto.SecureRandomNumberGenerator;
import org.apache.shiro.crypto.hash.SimpleHash;


public class Encrypt {

    private String encodedPassword;
    private String salt;


    /**
     * 生成随机的盐，并据其加密密码
     * @param username
     * @param password
     * @return
     */

    public void generateSaltAnEcdPwd(String username,String password){
        String algorithmName = "md5";
        String salt1 = username;
        String salt2 = new SecureRandomNumberGenerator().nextBytes().toHex();
        //散列次数
        int hashIterations = 3;
        SimpleHash hash = new SimpleHash(algorithmName, password,
                salt1 + salt2, hashIterations);
        String encodedPassword = hash.toHex();
        this.setSalt(salt2);
        this.setEncodedPassword(encodedPassword);
    }
    //构造方法私有化
    private Encrypt(){}
    //对外提供构造方式（非单例）
    public static Encrypt ofEncrypt(){
        return new Encrypt();
    }


    public String getEncodedPassword() {
        return encodedPassword;
    }

    public void setEncodedPassword(String encodedPassword) {
        this.encodedPassword = encodedPassword;
    }

    public String getSalt() {
        return salt;
    }

    public void setSalt(String salt) {
        this.salt = salt;
    }
}
