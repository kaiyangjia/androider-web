package com.jiakaiyang.androider.web.common.convert;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.JsonPrimitive;

import java.util.Map;

/**
 * 类型转换的工具类,对常用的业务进行封装
 */
public class JsonConverter {

    /**
     * 把一个map类型的实例转换成json格式的字符串
     * @param map
     * @return
     */
    public static String mapToJson(Map<String, Object> map){
        Gson gson = new Gson();

        JsonObject jsonObject = new JsonObject();
        for (Map.Entry<String, Object> entry : map.entrySet()){
            String key = entry.getKey();
            Object value = entry.getValue();

            String valueStr = value instanceof Map
                    ?mapToJson((Map<String, Object>) value)
                    :gson.toJson(value);
            JsonPrimitive jsonPrimitive = new JsonPrimitive(valueStr);
            jsonObject.add(key, jsonPrimitive);
        }

        return jsonObject.getAsString();
    }
}
