package com.jiakaiyang.androider.web.model.crud;


import com.jiakaiyang.androider.web.model.DBHelper;
import com.querydsl.sql.SQLQueryFactory;

import java.util.List;

/**
 * Created by admin on 2016/7/22.
 */
public class DataGetterImpl<T> implements DataGetter<T>{

    @Override
    public List<T> get(T condition) {
        SQLQueryFactory sqlQueryFactory = DBHelper.getInstance().getSQLQueryFactory();
        return null;
    }

    @Override
    public T getOne(T condition) {
        return null;
    }
}
