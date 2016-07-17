package com.jiakaiyang.androider.web.bbs;

import com.jiakaiyang.androider.web.bbs.login.GuardController;

import static com.jiakaiyang.androider.web.bbs.Dispatcher.dispatchGet;
import static spark.Spark.get;

/**
 * 路由器
 */
public class Router {


    public static void init(){
        get("/hello", (req, res) -> "");

        dispatchGet("/hello", new GuardController());
    }
}
