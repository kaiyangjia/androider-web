package com.jiakaiyang.androider.web.common.test.convert;

import com.jiakaiyang.androider.web.common.convert.JsonConverter;
import org.junit.Test;

import java.util.HashMap;
import java.util.Map;

/**
 * JsonConverter 单元测试类
 */
public class JsonConverterUnitTest {

    @Test
    public void mapToJson_isRight(){
        Map<String, Object> map = new HashMap<>();
        JsonConverter.mapToJson(map);
    }
}
