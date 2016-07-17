package com.jiakaiyang.androider.web.bbs.base;

import com.jiakaiyang.androider.web.common.convert.JsonConverter;
import spark.ResponseTransformer;

import java.util.Map;

/**
 * 把返回值处理成json格式的字符串
 */
public class JsonTransformer implements ResponseTransformer {


    @Override
    public String render(Object model) throws Exception {
        if(model instanceof Map){
            return JsonConverter.mapToJson((Map<String, Object>)model);
        }

        return null;
    }
}
