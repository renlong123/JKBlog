package com.jkblog.servlet;

import org.apache.log4j.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "BlogDetailServlet",urlPatterns = "/blogdetail")
public class BlogDetailServlet extends HttpServlet {

    /*日志打印*/
    private static Logger logger = Logger.getLogger(BlogListServlet.class);

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        logger.info(this.getClass().getName() + "类调用了doGet方法");
        req.getRequestDispatcher("/WEB-INF/view/blogDetail.jsp").forward(req,resp);
    }
}
