package com.jiakaiyang.androider.web.bbs.login;

import com.jiakaiyang.androider.web.bbs.base.BaseController;
import spark.Request;
import spark.Response;
import spark.Route;

/**
 * 用户的登入、登出、注册、注销等功能的controller
 */
public class GuardController extends BaseController{
    public static final String PARENT_PATH = "/";


    @Override
    public String getParentPath() {
        return PARENT_PATH;
    }
}
