package com.jiakaiyang.androider.web.bbs;

import com.jiakaiyang.androider.web.bbs.login.GuardController;
import spark.Route;

import static com.jiakaiyang.androider.web.bbs.Dispatcher.dispatchGet;
import static spark.Spark.get;

/**
 * 路由器
 */
public class Router {

    public static void main(String[] args){
        init();
    }

    public static void init(){
        dispatchGet("/helloj", new GuardController());
    }
}
