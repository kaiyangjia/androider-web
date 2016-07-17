package com.jiakaiyang.androider.web.bbs.base;

import spark.Request;
import spark.Response;
import spark.Route;

/**
 * 请求异常情况下的Route返回值
 */
public class ExceptionRoute implements Route {
    private byte code;
    private String msg;


    public ExceptionRoute(byte code, String msg) {
        this.code = code;
        this.msg = msg;
    }

    @Override
    public Object handle(Request request, Response response) throws Exception {
        return null;
    }
}
