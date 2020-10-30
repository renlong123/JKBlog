package com.jkblog.service;

import com.jkblog.dao.JDBCDAO;
import com.jkblog.entity.Blog;
import com.jkblog.entity.BlogCategory;
import com.jkblog.entity.BlogUser;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class BlogService {

    /**
     * 将文章信息及分类作者信息放在同一个map中返回
     * @param blogId
     * @return
     */
    public Map<String,Object> getBlogAllInfo(Integer blogId){
        Map<String,Object> maps = new HashMap<>();
        String serachForBlog = "select * from blog where blogId=?";
        List<Blog> blogs = JDBCDAO.serachObject(Blog.class, serachForBlog, blogId);
        if(blogs != null && blogs.size()>=1) {
            Blog gettedBlog = blogs.get(0);
            maps.put("blog",gettedBlog);
            BlogCategory category = getCategory(gettedBlog.getBlogCategoryId());
            maps.put("category",category);
            BlogUser user = getUser(gettedBlog.getBlogUserId());
            maps.put("user",user);
        }else{
            maps = null;
        }

        return maps;
    }


    /**
     * 根据分类ID查找分类所有信息
     * @param blogCategoryId
     * @return
     */
    public BlogCategory getCategory(Integer blogCategoryId){

        String sql = "select * from blogCategory where categoryId=?";

        List<BlogCategory> categories = JDBCDAO.serachObject(BlogCategory.class, sql, blogCategoryId);
        if(categories!=null&&categories.size()>=1){
            return categories.get(0);
        }else{
            return null;
        }
    }

    /**
     * 根据用户id查找用户完整信息
     * @param blogUserId
     * @return
     */
    public BlogUser getUser(Integer blogUserId){

        String sql = "select * from blogUser where userId=?";

        List<BlogUser> users = JDBCDAO.serachObject(BlogUser.class, sql, blogUserId);

        if(users!=null && users.size()>=1){
            return users.get(0);
        }else{
            return null;
        }
    }

    public int deleteBlogByBlogId(Integer blogId){
        String sql = "delete from blog where blogId=?";
        int update = JDBCDAO.comUpdate(sql, blogId);
        return update;
    }

    public int insertBlog(Blog blog){
        String sql = "insert into blog values(null,?,?,?,?,?,?,?,?)";

        Date now = new Date();
        String content = blog.getBlogContent();
        String subString = content.substring(0,content.length()>50?50:content.length()-1);
        subString = subString.replaceAll("img","图片").replaceAll("<","").replaceAll(">","");

        //System.out.println(blog);

        int i = JDBCDAO.comUpdate(sql, blog.getBlogTitle(), content, 0, 0, now, blog.getBlogUserId(), blog.getBlogCategoryId(), subString);

        return i;
    }

    public int updateBlog(Blog blog){

        String sql = "update blog set blogTitle=?,blogContent=?,blogEditTime=?,blogCategoryId=?,blogBriefContent=? where blogId=?";

        Date now = new Date();
        String content = blog.getBlogContent();
        String subString = content.substring(0,content.length()>50?50:content.length()-1);
        subString = subString.replaceAll("img","图片").replaceAll("<","").replaceAll(">","");

        int i = JDBCDAO.comUpdate(sql, blog.getBlogTitle(), content, now, blog.getBlogCategoryId(), subString, blog.getBlogId());

        return i;

    }

}
