package com.jkblog.servlet;

import com.jkblog.entity.Blog;
import com.jkblog.entity.BlogUser;
import com.jkblog.service.UserService;
import org.apache.log4j.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "HomePageServlet",urlPatterns = "/homepage")
public class HomePageServlet extends HttpServlet {

    /*日志打印*/
    private static Logger logger = Logger.getLogger(SerachServlet.class);

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        logger.info(this.getClass().getName() + "调用了dopost方法");
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("userId");
        if(userId == null || userId.equals("")){
            response.sendRedirect("login");
        }else{
            UserService userService = new UserService();
            BlogUser user = userService.getUserByUserId(userId);
            request.setAttribute("user",user);
            List<Blog> blogs = userService.getHotBlogsByUserId(userId);
            request.setAttribute("blogs",blogs);
            request.getRequestDispatcher("/WEB-INF/view/userHomePage.jsp").forward(request,response);

        }
    }
}
