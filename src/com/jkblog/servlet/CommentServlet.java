package com.jkblog.servlet;

import com.google.gson.Gson;
import com.jkblog.entity.BlogComment;
import com.jkblog.service.CommentService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;
import java.util.List;

@WebServlet(name = "CommentServlet",urlPatterns = "/comment")
public class CommentServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String blogCommentContents = request.getParameter("blogCommentContents");
        Date commentTime = new Date();
        Integer commentUserId = (Integer)request.getSession().getAttribute("userId");
        Integer commentBlogId = Integer.parseInt(request.getParameter("commentBlogId"));
        Integer commentFather = Integer.parseInt(request.getParameter("commentFather"));
        String commentUserName = (String)request.getSession().getAttribute("userName");

        BlogComment blogComment = new BlogComment();
        blogComment.setBlogCommentContents(blogCommentContents);
        blogComment.setCommentTime(commentTime);
        blogComment.setCommentUserId(commentUserId);
        blogComment.setCommentBlogId(commentBlogId);
        blogComment.setCommentFather(commentFather);
        blogComment.setCommentUserName(commentUserName);

        int i = new CommentService().insertComment(blogComment);
        if(i==1){
            response.getWriter().write("success");

        }else{
            response.getWriter().write("fail");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Integer blogCommentId = Integer.parseInt(request.getParameter("blogCommentId"));

        List<BlogComment> allComments = new CommentService().getAllCommentByFatherId(blogCommentId);

        Gson gson = new Gson();
        response.getWriter().write(gson.toJson(allComments));
    }
}
