package com.jiakaiyang.androider.web.bbs.base;

/**
 * 一些常量
 */
public class Constants {

    /**
     *  请求成功
     */
    public static final short CODE_SUCCESS = 0;
    public static final String MSG_SUCCESS = "请求成功";



    /**
     * 请求参数错误
     */
    public static final short CODE_PARAM_ERROR = -1;
    public static final String MSG_PARAM_ERROR = "参数错误";

    /**
     * 请求接口不存在
     */
    public static final short CODE_NOT_FOUND = -2;
    public static final String MSG_NOT_FOUND = "请求未找到";


    /**
     * 该用户不被允许进行该请求
     */
    public static final short CODE_FORBIDEN = -3;
    public static final String MSG_FORBIDEN = "无权进行该请求";


    /**
     * 服务器发生错误
     */
    public static final short CODE_SERVER_ERROR = -4;
    public static final String MSG_SERVER_ERROR = "服务器发生错误";



    /**
     * 该用户对该请求的能力已经过期
     */
    public static final short CODE_OUT_OF_TIME = -5;
    public static final String MSG_OUT_OF_TIME = "该请求已经过期";



    /**
     * http 请求返回json
     */
    public static final String JSON_TEXT = "application/json";
}
