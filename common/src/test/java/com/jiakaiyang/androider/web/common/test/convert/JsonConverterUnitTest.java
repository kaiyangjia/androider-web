package com.jiakaiyang.androider.web.common.test.convert;

import com.jiakaiyang.androider.web.common.convert.JsonConverter;
import org.junit.Test;

import java.util.HashMap;
import java.util.Map;

import static org.junit.Assert.assertFalse;

/**
 * JsonConverter 单元测试类
 */
public class JsonConverterUnitTest {

    @Test
    public void mapToJson_isRight(){
        Map<String, Object> map = new HashMap<>();
        map.put("name", "jia");
        map.put("age", 23);
        Map<String, Object> childMap = new HashMap<>();
        childMap.put("name", "zhang");
        childMap.put("age", 24);
        map.put("friend", childMap);
        String str = JsonConverter.mapToJson(map);
        assertFalse("".equals(str));
    }
}
