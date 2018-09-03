package com.g12.ttxg.pojo;

import java.util.List;

public class SysRoleCustom extends SysRole{
    List<SysPermission> permissions;

    public List<SysPermission> getPermissions() {
        return permissions;
    }

    public void setPermissions(List<SysPermission> permissions) {
        this.permissions = permissions;
    }
}
