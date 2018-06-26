package cn.com.ttxg.pojo;

import javax.validation.constraints.Pattern;

public class User {
    private Integer userid;

    private String usertype;
    @Pattern(regexp="^(?!_)(?!.*?_$)[a-zA-Z0-9_\\u4e00-\\u9fa5]+$",message="服务端：请输入正确的用户名")
    private String username;
    @Pattern(regexp="^[a-zA-Z\\d_]{6,}$",message="服务端：请输入6位以上的密码")
    private String password;
    @Pattern(regexp="^[1][3,4,5,7,8][0-9]{9}$",message="服务端：请输入正确的手机号")
    private String phone;

    private String address;
    @Pattern(regexp="^(?!_)(?!.*?_$)[a-zA-Z0-9_\\u4e00-\\u9fa5]+$",message="服务端：请输入正确的姓名")
    private String name;

    private String state;

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public String getUsertype() {
        return usertype;
    }

    public void setUsertype(String usertype) {
        this.usertype = usertype == null ? null : usertype.trim();
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone == null ? null : phone.trim();
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state == null ? null : state.trim();
    }
}