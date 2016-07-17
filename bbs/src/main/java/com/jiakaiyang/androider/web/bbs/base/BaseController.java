package com.jiakaiyang.androider.web.bbs.base;

import spark.Request;
import spark.Response;
import spark.Route;

/**
 * Controller 的基类
 */
public abstract class BaseController {

    /**
     * 获取该controller的上一级url
     * @return
     */
    public abstract String getParentPath();


    public Route getRoute(String path){
        if(!path.contains(getParentPath())){

        }

        return new Route() {
            @Override
            public Object handle(Request request, Response response) throws Exception {
                return null;
            }
        };
    }
}
