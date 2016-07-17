package com.jiakaiyang.androider.web.bbs;

import com.jiakaiyang.androider.web.bbs.base.BaseController;
import com.jiakaiyang.androider.web.bbs.base.JsonTransformer;

import static spark.Spark.get;

/**
 * 请求分发
 */
public class Dispatcher {
    public static final String JSON_TEXT = "application/json";


    /**
     * 分发get请求给对应的controller处理
     * @param path
     * @param handleController
     */
    public static void dispatchGet(final String path, BaseController handleController){
        get(path, JSON_TEXT, handleController.getRoute(path), new JsonTransformer());
    }
}
