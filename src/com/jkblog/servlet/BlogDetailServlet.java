package com.jkblog.servlet;

import com.jkblog.service.BlogService;
import org.apache.log4j.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Map;

import static com.jkblog.service.CommonService.jumpToError;

@WebServlet(name = "BlogDetailServlet",urlPatterns = "/blogdetail")
public class BlogDetailServlet extends HttpServlet {

    /*日志打印*/
    private static Logger logger = Logger.getLogger(SerachServlet.class);

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        logger.info(this.getClass().getName() + "类调用了doGet方法");

        String blogId = req.getParameter("blogId");
        if(blogId != null){
            Integer blogIntId = Integer.parseInt(blogId);
            BlogService blogService = new BlogService();
            Map<String, Object> allInfo = blogService.getBlogAllInfo(blogIntId);
            /*数据库无内容时跳转至错误页*/
            if(allInfo == null){
                jumpToError("博客不存在",req,resp);
            }else{
                blogService.updateBlogReaderTimes(blogIntId);
                req.setAttribute("allInfo",allInfo);
                req.getRequestDispatcher("/WEB-INF/view/blogDetail.jsp").forward(req,resp);
            }
        }else{
            jumpToError("博客地址不正确",req,resp);
        }

    }


}
