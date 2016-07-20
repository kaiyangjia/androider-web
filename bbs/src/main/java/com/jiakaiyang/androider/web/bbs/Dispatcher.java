package com.jiakaiyang.androider.web.bbs;

import com.jiakaiyang.androider.web.bbs.base.BaseController;
import com.jiakaiyang.androider.web.bbs.base.JsonTransformer;
import com.jiakaiyang.androider.web.bbs.login.GuardController;
import com.sun.glass.ui.SystemClipboard;
import spark.Route;
import spark.Spark;

import static spark.Spark.get;

/**
 * 请求分发
 */
public class Dispatcher{


    /**
     * 分发get请求给对应的controller处理
     * @param path
     */
    public static void dispatchGet(final String path, BaseController handleController){
        handleController.setPath(path);
        get(path, handleController);
    }
}
