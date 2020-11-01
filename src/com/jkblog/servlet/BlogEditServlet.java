package com.jkblog.servlet;

import com.jkblog.entity.Blog;
import com.jkblog.service.BlogService;
import com.jkblog.service.CommonService;
import org.apache.log4j.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Map;

@WebServlet(name = "BlogEditServlet",urlPatterns = "/blogedit")
public class BlogEditServlet extends HttpServlet {

    BlogService blogService = new BlogService();

    /*日志打印*/
    private static Logger logger = Logger.getLogger(SerachServlet.class);

    /**
     * 处理博客的新建及修改请求
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String blogId = request.getParameter("blogId");
        String blogTitle = request.getParameter("blogTitle");
        Integer blogCategoryId = Integer.parseInt(request.getParameter("blogCategoryId"));
        String blogContent = request.getParameter("blogContent");

        Blog blog = new Blog();
        blog.setBlogTitle(blogTitle);
        blog.setBlogCategoryId(blogCategoryId);
        blog.setBlogContent(blogContent);
        blog.setBlogUserId((int)request.getSession().getAttribute("userId"));
        if(blogId == null){
            int i = blogService.insertBlog(blog);
            if(i>= 1){
                response.getWriter().write("success");
            }else{
                response.getWriter().write("fail");
            }
        }else{
            Integer blogSetId = Integer.parseInt(blogId);
            blog.setBlogId(blogSetId);
            int i = blogService.updateBlog(blog);
            if(i>= 1){
                response.getWriter().write("success");
            }else{
                response.getWriter().write("fail");
            }
        }
    }

    /**
     * 将编辑的博客所有信息查询出来跳转到指定界面
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //logger.info(this.getClass().getName() + "类调用了doGet方法");

        String blogId = request.getParameter("blogId");
        if(blogId == null || blogId.equals("")){
            request.getRequestDispatcher("/WEB-INF/view/blogEdit.jsp").forward(request,response);
        }else{
            try{
                Integer updateBlogId = Integer.parseInt(blogId);
                BlogService service = new BlogService();
                Map<String, Object> blogAllInfo = service.getBlogAllInfo(updateBlogId);
                if(blogAllInfo != null){
                    request.setAttribute("blogAllInfo",blogAllInfo);
                    request.getRequestDispatcher("/WEB-INF/view/blogEdit.jsp").forward(request,response);
                }else{
                    CommonService.jumpToError("编辑的博客不存在，请重新尝试",request,response);
                }
            }catch (NumberFormatException e){
                CommonService.jumpToError("编辑的博客不存在，请重新尝试",request,response);
            }
        }
    }
}
