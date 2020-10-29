package com.jkblog.servlet;

import com.jkblog.entity.Blog;
import com.jkblog.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "BlogPageServlet",urlPatterns = "/blogs/page")
public class BlogPageServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String page = request.getParameter("page");
        String size = request.getParameter("size");
        Integer userId = (Integer)request.getSession().getAttribute("userId");

        if(page == null){
            page = "1";
        }
        if(size == null){
            size = "5";
        }

        UserService userService = new UserService();

        Integer total = userService.blogCount(userId);
        List<Blog> blogs = userService.getBlogsByUserIdLimit(userId, Integer.parseInt(page), Integer.parseInt(size));
        int pages = (total % Integer.parseInt(size) == 0 ? total/Integer.parseInt(size):total/Integer.parseInt(size)+1);
        System.out.println(blogs.size());
        request.setAttribute("pages",pages);
        request.setAttribute("blogs",blogs);
        request.setAttribute("page",page);

        request.getRequestDispatcher("/WEB-INF/view/blogPages.jsp").forward(request,response);
    }
}
