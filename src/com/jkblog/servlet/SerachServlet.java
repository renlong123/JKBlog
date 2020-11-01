package com.jkblog.servlet;

import com.google.gson.Gson;
import com.jkblog.entity.Blog;
import com.jkblog.service.CommonService;
import org.apache.log4j.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet(name = "BlogListServlet",urlPatterns = "/serach")
public class SerachServlet extends HttpServlet {

    /*日志打印*/
    private static Logger logger = Logger.getLogger(SerachServlet.class);

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        logger.info(this.getClass().getName() + "调用了dopost方法");
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        logger.info(this.getClass().getName() + "类调用了doGet方法");

        String jumpFlag = request.getParameter("jumpFlag");
        String serachText = request.getParameter("serachText");
        if(jumpFlag != null && jumpFlag.equals("no")){
            String page = request.getParameter("page");
            Map<String,Object> maps = new HashMap<>();
            /**
             * 输入数据不合要求直接返回
             */
            if(serachText == null || serachText.equals("") || serachText.length() < 2 || serachText.length() > 40){
                maps.put("pages","error");
                response.getWriter().write(new Gson().toJson(maps));
            }else{
                List<Blog> blogs = null;
                if(page == null || page.equals("")){
                    blogs = CommonService.serachBlogs(serachText,1);
                }else{
                    blogs = CommonService.serachBlogs(serachText, Integer.parseInt(page));
                }
                int i = CommonService.serachBlogsCount(serachText);

                maps.put("count",i);
                maps.put("blogs",blogs);
                response.getWriter().write(new Gson().toJson(maps));
            }
        }else{
            request.setAttribute("serachText",serachText);
            request.getRequestDispatcher("/WEB-INF/view/serachResult.jsp").forward(request,response);
        }
    }
}
