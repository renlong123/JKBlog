package com.jkblog.service;

import com.jkblog.dao.JDBCDAO;
import com.jkblog.entity.BlogCategory;

import java.util.List;

public class CategoryService {



    public List<BlogCategory> getAllCategories(){
        String sql = "select * from blogcategory";
        List<BlogCategory> categories = JDBCDAO.serachObject(BlogCategory.class, sql);
        return categories;
    }

    public int updateCategory(BlogCategory category){
        String sql = "update table blogcategory set categoryName=? and categoryDescription=? where categoryId=?";

        int i = JDBCDAO.comUpdate(sql, category.getCategoryName(), category.getCategoryDescription(), category.getCategoryId());

        return i;
    }

    public int insertCategory(BlogCategory category){
        String sql = "insert into blogcategory values(null,?,?)";

        int i = JDBCDAO.comUpdate(sql, category.getCategoryName(), category.getCategoryDescription());

        return i;
    }
}
