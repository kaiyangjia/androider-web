package com.jiakaiyang.androider.web.model.crud;


import com.jiakaiyang.androider.web.model.DBHelper;
import com.jiakaiyang.elf.java.statistics.condition.ConditionContract;
import com.querydsl.sql.SQLQueryFactory;

import java.util.List;

/**
 * DataGetter 的sql查询实现，用于获取关系型数据库中的数据
 */
public class SQLDataGetter<T> implements DataGetter<T>{

    @Override
    public List<T> get(T condition) {
        SQLQueryFactory sqlQueryFactory = DBHelper.getInstance().getSQLQueryFactory();
        return null;
    }

    @Override
    public List<T> get(String fieldName, Object fieldValue) {
        return null;
    }

    @Override
    public List<T> get(ConditionContract conditon) {
        return null;
    }

    @Override
    public T getOne(T condition) {
        return null;
    }
}
