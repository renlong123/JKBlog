package com.jkblog.servlet;

import com.jkblog.entity.Blog;
import com.jkblog.service.IndexService;
import org.apache.log4j.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * web应用主页，默认进入该页面
 */
@WebServlet(name = "IndexServlet",urlPatterns = {"/index","/","/hello"})/*"/index","/hello",*/
public class IndexServlet extends HttpServlet {
    /*日志打印*/
    private static Logger logger = Logger.getLogger(IndexServlet.class);

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("index进入一次");

        IndexService indexService = new IndexService();
        List<Blog> blogs = indexService.getHotBlogs();
        logger.info(blogs);
        request.setAttribute("blogs",blogs);

        request.getRequestDispatcher("/WEB-INF/view/index.jsp").forward(request,response);
    }
}
