package com.jiakaiyang.androider.web.common.tools;

import java.lang.reflect.Field;
import java.lang.reflect.Method;

/**
 * 对实例的成员、方法等进行的常用操作。主要采用反射实现
 */
public class InstanceUtils {


    /**
     * 获取一个对象的某个类成员的值
     * @param instance 类对象
     * @param fieldName 需要获取的成员的名称
     * @return
     */
    public static Object getInstanceFieldValue(Object instance,String fieldName){
        Field[] fields = instance.getClass().getDeclaredFields();
        Object result = null;

        for(Field field : fields){
            String tName = field.getName();
            if(tName.equals(fieldName)){
                boolean access = field.isAccessible();
                if(!access)field.setAccessible(true);
                try {
                    result = field.get(instance);
                } catch (IllegalAccessException e) {
                    e.printStackTrace();
                }
                break;
            }
        }
        return result;
    }


    /**
     * 获取一个对象指定的方法对象
     * @param instance
     * @param methodName
     * @return
     */
    public static Method getInstanceMethod(Object instance,String methodName){
        Method[] methods = instance.getClass().getDeclaredMethods();

        for (Method method : methods){
            String name = method.getName();
            if(methodName.endsWith(name)){
                return method;
            }
        }

        return null;
    }
}
