package com.jiakaiyang.androider.web.bbs;

import com.google.gson.Gson;
import org.apache.commons.lang3.StringUtils;
import org.junit.Test;

import static org.junit.Assert.assertTrue;

/**
 * 测试某些方法的测试类，不针对具体的方法,只是用来验证某些依赖库中方法的使用情况
 */
public class DebugUnitTest {

    @Test
    public void apacheStringUtilsTest(){
        String[] result = StringUtils.split("/parent/book", "/");
        assertTrue(result.length == 2);

        String child = StringUtils.removeStart("/parent/book", "/parent");
        assertTrue(child.equals("/book"));

        result = StringUtils.split("/book", "/");
        assertTrue(result.length == 1);

        result = StringUtils.split("book", "/");
        assertTrue(result.length == 1);
    }


    @Test
    public void gsonUnitTest(){
        Gson gson =  new Gson();
        String result = gson.toJson("json");
        assertTrue(result != null);
    }
}
