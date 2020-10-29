package com.jkblog.servlet;

import org.apache.log4j.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "UserInfoServlet",urlPatterns = "/userinfo")
public class UserInfoServlet extends HttpServlet {
    /*日志打印*/
    private static Logger logger = Logger.getLogger(BlogListServlet.class);

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        logger.info(this.getClass().getName() + "类调用了doGet方法");
        request.getRequestDispatcher("/WEB-INF/view/userInfoEdit.jsp").forward(request,response);
    }
}
