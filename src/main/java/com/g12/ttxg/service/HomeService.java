package com.g12.ttxg.service;


import com.g12.ttxg.utils.LoginResult;

public interface HomeService {
    LoginResult login(String userName, String password);
    void logout();
}
