package com.jiakaiyang.androider.web.bbs;


import spark.servlet.SparkApplication;

import static spark.Spark.*;

/**
 * app入口程序
 */
public class Application implements SparkApplication {

    @Override
    public void init() {
        Router.init();
    }

    @Override
    public void destroy() {

    }
}
