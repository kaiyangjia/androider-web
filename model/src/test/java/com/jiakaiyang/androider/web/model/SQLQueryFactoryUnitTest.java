package com.jiakaiyang.androider.web.model;

import com.querydsl.sql.SQLQueryFactory;
import org.junit.Test;

/**
 * SQLQueryFactory 单元测试
 */
public class SQLQueryFactoryUnitTest {

    @Test
    public void QueryUnitTest(){
        SQLQueryFactory sqlQueryFactory = DBHelper.getInstance().getSQLQueryFactory();
    }
}
