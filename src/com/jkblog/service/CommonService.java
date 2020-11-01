package com.jkblog.service;

import com.jkblog.dao.JDBCDAO;
import com.jkblog.entity.Blog;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class CommonService {
    /**
     * 跳转至统一的错误处理页面，提示用户
     * @param errorMsg
     * @param request
     * @param response
     */
    public static void jumpToError(String errorMsg, HttpServletRequest request, HttpServletResponse response){
        request.setAttribute("errorTips",errorMsg);
        try {
            request.getRequestDispatcher("/WEB-INF/view/error.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static List<Blog> serachBlogs(String serachText, Integer page){
        String sql = "SELECT blogId,blogTitle,blogReadTimes,blogUserId,blogCategoryId,blogCommentTimes,blogBriefContent " +
                "FROM blog WHERE MATCH(blogTitle,blogContent) AGAINST(?) limit ?,10";
        List<Blog> blogs = JDBCDAO.serachObject(Blog.class, sql, serachText, (page-1)*10);
        return blogs;
    }

    public static int serachBlogsCount(String serachText){
        String sql = "SELECT count(*) FROM blog WHERE MATCH(blogTitle,blogContent) AGAINST(?)";
        Integer integer = JDBCDAO.selectIntItem(sql, serachText);
        return integer;
    }

}
