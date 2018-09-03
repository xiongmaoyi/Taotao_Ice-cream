package com.g12.ttxg.pojo;

public class Storehouse {
    private Integer storehouseid;

    private String storehousename;

    public Integer getStorehouseid() {
        return storehouseid;
    }

    public void setStorehouseid(Integer storehouseid) {
        this.storehouseid = storehouseid;
    }

    public String getStorehousename() {
        return storehousename;
    }

    public void setStorehousename(String storehousename) {
        this.storehousename = storehousename == null ? null : storehousename.trim();
    }
}