package com.jkblog.service;

import com.jkblog.dao.JDBCDAO;
import com.jkblog.entity.Blog;
import com.jkblog.entity.BlogUser;

import java.util.List;

public class UserService {

    public String getPassword(String userName){
        String sql = "select userPassword from blogUser where userName=?";
        String stringItem = JDBCDAO.selectStringItem(sql, userName);
        return stringItem;
    }

    public BlogUser getUserByName(String userName){
        String sql = "select * from blogUser where userName=?";

        List<BlogUser> users = JDBCDAO.serachObject(BlogUser.class, sql, userName);
        if(users!= null && users.size()>=1){
            return users.get(0);
        }else {
            return null;
        }
    }

    public BlogUser getUserByUserId(Integer userId){
        BlogService blogService = new BlogService();
        return blogService.getUser(userId);
    }

    public List<Blog> getHotBlogsByUserId(Integer userId){
        String sql = "select blogId,blogTitle,blogReadTimes,blogCategoryId,blogCommentTimes,blogBriefContent " +
                "from blog where blogUserId=? order by blogReadTimes desc limit 0,5";
        List<Blog> blogs = JDBCDAO.serachObject(Blog.class, sql,userId);
        return blogs;
    }

    public List<Blog> getBlogsByUserIdLimit(Integer userId,Integer page,Integer size){
        String sql = "select blogId,blogTitle,blogReadTimes,blogCategoryId,blogCommentTimes,blogEditTime,blogBriefContent " +
                "from blog where blogUserId=? order by blogEditTime desc limit ?,?";
        System.out.println();
        List<Blog> blogs = JDBCDAO.serachObject(Blog.class, sql,userId,page-1,size);
        return blogs;
    }

    public int blogCount(Integer userId){
        String sql = "select count(*) from blog where blogUserId=?";
        int count = JDBCDAO.getCount(sql, userId);
        return count;
    }

/*    public int getUserByUserName(String userName){

    }*/
}
