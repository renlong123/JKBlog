package com.jkblog.service;

import com.jkblog.dao.JDBCDAO;
import com.jkblog.entity.Blog;

import java.util.List;

public class IndexService {

    public List<Blog> getHotBlogs(){

        String sql = "select blogId,blogTitle,blogReadTimes,blogUserId,blogCategoryId,blogCommentTimes,blogBriefContent from blog order by blogReadTimes desc limit 0,10";
        List<Blog> blogs = JDBCDAO.serachObject(Blog.class, sql);

        return blogs;
    }

}
