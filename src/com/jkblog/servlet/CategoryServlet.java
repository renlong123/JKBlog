package com.jkblog.servlet;

import com.google.gson.Gson;
import com.jkblog.entity.BlogCategory;
import com.jkblog.service.CategoryService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "CategoryServlet",urlPatterns = "/blogcategory")
public class CategoryServlet extends HttpServlet{

    CategoryService categoryService = new CategoryService();

    /*
    处理添加及修改信息
     */
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html;charset=utf-8");

        BlogCategory category = new BlogCategory();
        int result = 0;
        String categoryId = req.getParameter("categoryId");
        String categoryName = req.getParameter("categoryName");
        String categoryDescription = req.getParameter("categoryDescription");
        category.setCategoryName(categoryName);
        category.setCategoryDescription(categoryDescription);

        if(categoryId == null || categoryId.equals("")){
            result = categoryService.insertCategory(category);
        }else{
            category.setCategoryId(Integer.parseInt(categoryId));
            result = categoryService.updateCategory(category);
        }

        if(result >= 1){
            resp.getWriter().write("success");
        }else{
            resp.getWriter().write("fail");
        }
    }

    /**
     * 处理查询信息
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("application/json;charset=utf-8");
        List<BlogCategory> categories = categoryService.getAllCategories();
        Gson gson = new Gson();
        String json = gson.toJson(categories);
        resp.getWriter().write(json);
    }

    /**
     * 处理删除信息
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
/*    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doDelete(req, resp);
    }*/
}
