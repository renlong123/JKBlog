package com.jkblog.servlet;

import org.apache.log4j.Logger;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

/**
 * 基础Servlet,继承该servlet实现1个servlet处理多个url
 */
public class BaseServlet extends HttpServlet {

    /*日志打印*/
    private static Logger logger = Logger.getLogger(BlogListServlet.class);

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        /*中文乱码问题处理*/
        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("utf-8");

        String method = req.getParameter("method");

        Class clazz = this.getClass();
        try {
            Method m = clazz.getMethod(method,HttpServletRequest.class,HttpServletResponse.class);
            m.invoke(this,req,resp);
        } catch (NoSuchMethodException | IllegalAccessException | InvocationTargetException e) {
            e.printStackTrace();
            logger.error(this.getClass().getName()+ "类"+method+"方法不存在或调用异常");
        }
    }

}
