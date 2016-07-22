package com.jiakaiyang.androider.web.model;

import com.alibaba.druid.pool.DruidDataSource;
import com.querydsl.sql.Configuration;
import com.querydsl.sql.PostgreSQLTemplates;
import com.querydsl.sql.SQLQueryFactory;
import com.querydsl.sql.SQLTemplates;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;

/**
 * 数据库操作工具类
 */
public class DBHelper {
    private SQLTemplates sqlTemplates =  new PostgreSQLTemplates();
    private Configuration configuration = new Configuration(sqlTemplates);
    private DruidDataSource druidDataSource = new DruidDataSource();

    private static DBHelper instance = new DBHelper();


    public static DBHelper getInstance(){
        return instance;
    }

    protected DBHelper() {
        init();
    }

    public void init(){
        Properties jdbcProperties = new Properties();
        try {
            jdbcProperties.load(new FileInputStream("model/jdbc.properties"));
        } catch (IOException e) {
            e.printStackTrace();
        }

        druidDataSource.setConnectProperties(jdbcProperties);
    }

    /**
     * 获取一个SQLQueryFactory 对象
     * @return
     */
    public SQLQueryFactory getSQLQueryFactory(){
        SQLQueryFactory sqlQueryFactory = new SQLQueryFactory(configuration,druidDataSource);
        return sqlQueryFactory;
    }
}
