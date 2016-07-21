package com.jiakaiyang.androider.web.bbs.base;

import com.jiakaiyang.androider.web.bbs.base.entity.Answer;
import com.jiakaiyang.androider.web.common.tools.InstanceUtils;
import org.apache.commons.lang3.StringUtils;
import spark.Request;
import spark.Response;
import spark.Route;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

/**
 * Controller 的基类
 */
public abstract class BaseController implements Route{
    private String path;
    public JsonTransformer jsonTransformer = new JsonTransformer();

    /**
     * 获取该controller的上一级url
     * @return
     */
    public abstract String getParentPath();

    public abstract Object index();


    @Override
    public Object handle(Request request, Response response) throws Exception {
        Object result = dispatch(this.getPath(), request);
        return jsonTransformer.render(result);
    }

    /**
     * 根据path的值分发给具体的处理方法
     * @param path
     * @return
     */
    public Object dispatch(String path, Request request){
        if(!path.contains(getParentPath())){
            return new Answer(Constants.CODE_NOT_FOUND);
        }

        path = StringUtils.removeStart(path,getParentPath());
        if(StringUtils.isBlank(path)){
            //返回该controller中的index
            Object obj = index();
            Answer answer = new Answer(Constants.CODE_SUCCESS);
            answer.setData(obj);
            return obj;
        }
        String handlerName = StringUtils.split(path, "/")[0];
        Method method = InstanceUtils.getInstanceMethod(this, handlerName);
        if(method == null){
            return new Answer(Constants.CODE_NOT_FOUND);
        }
        boolean isAccess = method.isAccessible();
        method.setAccessible(true);
        try {
            return method.invoke(this, request);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
            return new Answer(Constants.CODE_FORBIDEN);
        } catch (InvocationTargetException e) {
            e.printStackTrace();
            return new Answer(Constants.CODE_PARAM_ERROR);
        }finally {
            method.setAccessible(isAccess);

        }
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }
}
