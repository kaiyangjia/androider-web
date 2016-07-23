package com.jiakaiyang.androider.web.model;

import com.querydsl.sql.SQLQueryFactory;
import org.junit.Test;

/**
 * DBHepler 的单元测试类
 */
public class DBHelperUnitTest {

    @Test
    public void DBHelper_Test(){
        //DBHelper 在第一次调用getInstance时会初始化一些资源，相对比较耗时
        long i = System.currentTimeMillis();
        SQLQueryFactory sqlQueryFactory = DBHelper.getInstance().getSQLQueryFactory();
        long j = System.currentTimeMillis();

        long time = j -i;
        System.out.print(time);

        i = System.currentTimeMillis();
        SQLQueryFactory sqlQueryFactory1 = DBHelper.getInstance().getSQLQueryFactory();
        j = System.currentTimeMillis();
        long time2 = j - i;
    }
}
