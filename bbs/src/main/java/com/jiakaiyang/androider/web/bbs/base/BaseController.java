package com.jiakaiyang.androider.web.bbs.base;

import com.jiakaiyang.androider.web.common.tools.InstanceUtils;
import lombok.Getter;
import lombok.Setter;
import org.apache.commons.lang3.StringUtils;
import org.eclipse.jetty.util.StringUtil;
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

    /**
     * 获取该controller的上一级url
     * @return
     */
    public abstract String getParentPath();

    public abstract Object index();


    @Override
    public Object handle(Request request, Response response) throws Exception {
        String result = (String) dispatch(this.getPath(), request);
        response.type("application/json");
        response.body(result);
        return result;
    }

    /**
     * 根据path的值分发给具体的处理方法
     * @param path
     * @return
     */
    public Object dispatch(String path, Request request){
        if(!path.contains(getParentPath())){
            //TODO 404 处理
            return 404;
        }

        path = StringUtils.removeStart(path,getParentPath());
        if(StringUtils.isBlank(path)){
            //返回该controller中的index
            index();
            return 404;
        }
        String handlerName = StringUtils.split(path, "/")[0];
        Method method = InstanceUtils.getInstanceMethod(this, handlerName);
        boolean isAccess = method.isAccessible();
        method.setAccessible(true);
        try {
            return method.invoke(this, request);
        } catch (IllegalAccessException e) {
            //TODO 403处理
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            //TODO 参数错误
            e.printStackTrace();
        }

        method.setAccessible(isAccess);
        return null;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }
}
