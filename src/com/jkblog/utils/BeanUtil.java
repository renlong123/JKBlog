package com.jkblog.utils;

import com.jkblog.entity.UserGender;
import org.apache.log4j.Logger;

import java.lang.reflect.Field;

public class BeanUtil {

    private static Logger logger = Logger.getLogger(BeanUtil.class);

    public static void setProperty(Object object,String propertyName,Object propertyValue){

        try {
            Field field = object.getClass().getDeclaredField(propertyName);
            field.setAccessible(true);
            /*性别用了枚举做特殊处理*/
            if(propertyName.equals("userGender")){
                if(propertyValue.equals("1")){
                    field.set(object,UserGender.男);
                }else if(propertyValue.equals("2")){
                    field.set(object,UserGender.女);
                }else{
                    field.set(object,UserGender.未知);
                }
            }else{
                field.set(object,propertyValue);
            }
        } catch (NoSuchFieldException e) {
            logger.error("没有该值");
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            logger.error("反射访问失败");
            e.printStackTrace();
        }
    }
}
