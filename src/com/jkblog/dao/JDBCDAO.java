package com.jkblog.dao;

import com.jkblog.utils.BeanUtil;
import com.jkblog.utils.DBUtil;

import javax.servlet.http.HttpServletResponse;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 进行数据库基本操作
 */
public class JDBCDAO {

    public static int saveUserHeaderPic(Integer userId,InputStream inputStream){
        String sql = "delete from bloguserheader where userId=?";
        comUpdate(sql,userId);
        sql = "insert into bloguserheader values(?,?)";
        int i = comUpdate(sql, userId, inputStream);
        return i;
    }

    /**
     * 查找头像，查不到输出默认值
     * @param userId
     * @param response
     */
    public static void getUserHeaderPic(Integer userId, HttpServletResponse response){
        String sql = "select userHeaderPic from bloguserheader where userId=?";
        String defaultsql = "select userHeaderPic from bloguserheader where userId=0";
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            con = DBUtil.getConnection();
            ps = con.prepareStatement(sql);
            ps.setObject(1,userId);
            rs = ps.executeQuery();

            if(rs.next()) {
                Blob bb = rs.getBlob(1);

                InputStream in = bb.getBinaryStream();

                /*写出到页面*/
                OutputStream out = response.getOutputStream();
                //OutputStream out = new FileOutputStream("out.jpg");
                byte[] buffer = new byte[1024];
                int length = 0;
                while((length = in.read(buffer))!= -1){
                    out.write(buffer,0,length);
                }
                out.flush();
                out.close();
                in.close();
            }else{
                ps = con.prepareStatement(defaultsql);
                rs = ps.executeQuery();
                if(rs.next()) {
                    Blob bb = rs.getBlob(1);

                    InputStream in = bb.getBinaryStream();

                    /*写出到页面*/
                    OutputStream out = response.getOutputStream();
                    //OutputStream out = new FileOutputStream("out.jpg");
                    byte[] buffer = new byte[1024];
                    int length = 0;
                    while ((length = in.read(buffer)) != -1) {
                        out.write(buffer, 0, length);
                    }
                    out.flush();
                    out.close();
                    in.close();
                }
            }
        }catch(Exception e) {
            e.printStackTrace();
        }finally {
            DBUtil.closeResultSet(rs);
            DBUtil.closeStatement(ps);
            DBUtil.closeConnection(con);
        }
    }

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
    public static int comUpdate(String sql,Object... args){
        Connection con = null;
        PreparedStatement ps = null;
        int update = 0;
        try {
            con = DBUtil.getConnection();
            ps = con.prepareStatement(sql);

            for (int i = 0; i < args.length; i++) {
                ps.setObject(i + 1, args[i]);
            }
            //ps.addBatch();
            update = ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBUtil.closeStatement(ps);
            DBUtil.closeConnection(con);
        }
        return update;
    }

    /**
     * 查找单一字符串
     * @param sql
     * @param args
     * @return
     */
    public static String selectStringItem(String sql,Object... args){
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String string = null;

        try {
            con = DBUtil.getConnection();
            ps = con.prepareStatement(sql);

            /*逐个设置预处理条件*/
            for(int i=0;i<args.length;i++){
                ps.setObject(i+1,args[i]);
            }

            rs = ps.executeQuery();

            if(rs.next()){
                string = rs.getString(1);
            }


        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }finally {
            DBUtil.closeResultSet(rs);
            DBUtil.closeStatement(ps);
            DBUtil.closeConnection(con);
        }
        return string;
    }

    public static int getCount(String sql,Object... args){
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        int count = 0;

        try {
            con = DBUtil.getConnection();
            ps = con.prepareStatement(sql);

            /*逐个设置预处理条件*/
            for(int i=0;i<args.length;i++){
                ps.setObject(i+1,args[i]);
            }

            rs = ps.executeQuery();

            if(rs.next()){
                count = rs.getInt(1);
            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }finally {
            DBUtil.closeResultSet(rs);
            DBUtil.closeStatement(ps);
            DBUtil.closeConnection(con);
        }
        return count;
    }
}
