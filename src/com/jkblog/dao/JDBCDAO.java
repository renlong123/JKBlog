package com.jkblog.dao;

import com.jkblog.utils.BeanUtil;
import com.jkblog.utils.DBUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 进行数据库基本操作
 */
public class JDBCDAO {

    /**
     * 查询某一对象并将其赋值至实体
     * @param clazz
     * @param sql
     * @param args
     * @param <T>
     * @return
     */
    public static <T> List<T> serachObject(Class<T> clazz, String sql, Object... args){

        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<T> list = new ArrayList<>();
        T entity = null;

        try {
            con = DBUtil.getConnection();
            ps = con.prepareStatement(sql);

            /*逐个设置预处理条件*/
            for(int i=0;i<args.length;i++){
                ps.setObject(i+1,args[i]);
            }

            rs = ps.executeQuery();

            ResultSetMetaData metaData = rs.getMetaData();

            Map<String,Object> map = new HashMap<>();
            /*获取元数据，根据数据的列数及列名称来依次给bean赋值*/
            while(rs.next()){
                for(int i=0;i<metaData.getColumnCount();i++){
                    String s = metaData.getColumnLabel(i+1);
                    Object value = rs.getObject(s);
                    map.put(s,value);
                }
                /**
                 * 给一个bean赋值并加入list.
                 */
                entity = clazz.newInstance();
                for(Map.Entry<String,Object> entry : map.entrySet()){
                    BeanUtil.setProperty(entity,entry.getKey(),entry.getValue());
                }
                list.add(entity);
            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InstantiationException e) {
            e.printStackTrace();
        } finally {
            DBUtil.closeResultSet(rs);
            DBUtil.closeStatement(ps);
            DBUtil.closeConnection(con);
        }

        return list;
    }


    /**
     * 通用的更新方法，可以执行插入，修改，删除
     * @param sql
     * @param args
     */
    public void comUpdate(String sql,Object... args){
        Connection con = null;
        PreparedStatement ps = null;
        try {
            con = DBUtil.getConnection();
            ps = con.prepareStatement(sql);

            for (int i = 0; i < args.length; i++) {
                ps.setObject(i + 1, args[i]);
            }
            //ps.addBatch();
            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBUtil.closeStatement(ps);
            DBUtil.closeConnection(con);
        }
    }

}
