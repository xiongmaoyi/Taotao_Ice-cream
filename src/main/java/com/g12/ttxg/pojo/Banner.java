package com.g12.ttxg.pojo;

public class Banner {
    private Integer bannerid;

    private String image;

    private Integer optionban;

    public Integer getBannerid() {
        return bannerid;
    }

    public void setBannerid(Integer bannerid) {
        this.bannerid = bannerid;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image == null ? null : image.trim();
    }

    public Integer getOptionban() {
        return optionban;
    }

    public void setOptionban(Integer optionban) {
        this.optionban = optionban;
    }
}