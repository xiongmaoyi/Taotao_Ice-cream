package com.g12.ttxg.pojo;

import java.util.List;

public class UserCustom extends User {


    List<SysRoleCustom> roles;

    public String getCredentialsSalt(){
        return super.getUsername()+super.getSalt();
    }

    public List<SysRoleCustom> getRoles() {
        return roles;
    }

    public void setRoles(List<SysRoleCustom> roles) {
        this.roles = roles;
    }
}
