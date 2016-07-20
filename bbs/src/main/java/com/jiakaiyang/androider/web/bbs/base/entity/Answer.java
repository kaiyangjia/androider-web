package com.jiakaiyang.androider.web.bbs.base.entity;

import com.jiakaiyang.androider.web.bbs.base.Constants;

/**
 * 接口返回的数据的封装类
 */
public class Answer {

    /**
     * 返回的消息
     */
    private String msg;

    /**
     * 返回的状态码
     */
    private short code;


    /**
     * 存放数据的类对象
     */
    private Object data;


    public Answer(short code) {
        this.code = code;
        switch (code){
            case Constants.CODE_SUCCESS:
                this.msg = Constants.MSG_SUCCESS;
                break;
            case Constants.CODE_FORBIDEN:
                this.msg = Constants.MSG_FORBIDEN;
                break;
            case Constants.CODE_NOT_FOUND:
                this.msg = Constants.MSG_NOT_FOUND;
                break;
            case Constants.CODE_OUT_OF_TIME:
                this.msg = Constants.MSG_OUT_OF_TIME;
                break;
            case Constants.CODE_PARAM_ERROR:
                this.msg = Constants.MSG_PARAM_ERROR;
                break;
            case Constants.CODE_SERVER_ERROR:
                this.msg = Constants.MSG_SERVER_ERROR;
                break;
        }
    }


    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }


    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }

    public short getCode() {
        return code;
    }

    public void setCode(short code) {
        this.code = code;
    }
}
