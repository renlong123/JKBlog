package com.jkblog.utils;

import com.jkblog.servlet.BlogListServlet;
import org.apache.log4j.Logger;

import java.io.IOException;
import java.io.InputStream;
import java.sql.*;
import java.util.Properties;

/**
 * 数据库连接工具类
 * */
public class DBUtil {

    /*日志打印*/
    private static Logger logger = Logger.getLogger(DBUtil.class);

    private static Properties info = new Properties();
    private static String driverClass = null;
    private static String url = null;
    private static String user = null;
    private static String password = null;

    /**
     * 类加载时就加载数据库驱动，解析properties文件
     */
    static{
        InputStream in = DBUtil.class.getClassLoader().getResourceAsStream("jdbc.properties");

        try {
            info.load(in);
        } catch (IOException e) {
            e.printStackTrace();
            logger.error(DBUtil.class.getName()+"加载properties失败！");
        }

        driverClass = info.getProperty("jdbc.driver");
        url = info.getProperty("jdbc.url");
        user = info.getProperty("jdbc.username");
        password = info.getProperty("jdbc.password");

        try {
            Class.forName(driverClass);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            logger.error(DBUtil.class.getName()+"加载驱动失败！");
        }
    }

    /**
     * 用于获取数据库连接
     * @return 数据库连接
     */
    public static Connection getConnection(){

        Connection con = null;
        try {
            con = DriverManager.getConnection(url, user, password);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
            logger.error(DBUtil.class.getName()+"数据库连接失败！");
        }

        return con;

    }

    /**
     * 关闭连接
     * @param connection
     */
    public static void closeConnection(Connection connection){
        if(connection != null){
            try {
                connection.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
                logger.error(DBUtil.class.getName()+"connection关闭异常！");
            }
        }
    }

    /**
     * 关闭statement
     * @param statement
     */
    public static void closeStatement(Statement statement){
        if(statement != null){
            try {
                statement.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
                logger.error(DBUtil.class.getName()+"statement关闭异常！");
            }
        }
    }

    public static void closeResultSet(ResultSet rs ){
        if(rs != null){
            try {
                rs.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
                logger.error(DBUtil.class.getName()+"resultset关闭异常！");
            }
        }
    }
}
