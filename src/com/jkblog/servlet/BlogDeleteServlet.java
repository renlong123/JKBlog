package com.jkblog.servlet;

import com.jkblog.service.BlogService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "BlogDeleteServlet",urlPatterns = "/blogdelete")
public class BlogDeleteServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Integer blogId = Integer.parseInt(request.getParameter("blogId"));
        //System.out.println(blogId);
        if(blogId != null && !blogId.equals("")){
            BlogService service = new BlogService();
            int i = service.deleteBlogByBlogId(blogId);
        }
        response.sendRedirect("homepage");
    }
}
