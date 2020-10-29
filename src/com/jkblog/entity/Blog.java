package com.jkblog.entity;

import java.util.Date;

/**
 * 博客内容类
 */
public class Blog {

    private Integer blogId;
    private String blogTitle;
    private String blogContent;

    private String blogBriefContent;

    private Integer blogReadTimes;
    private Integer blogCommentTimes;

    private Date blogEditTime;
    private Integer blogUserId;
    private Integer blogCategoryId;


    public String getBlogBriefContent() {
        return blogBriefContent;
    }

    public void setBlogBriefContent(String blogBriefContent) {
        this.blogBriefContent = blogBriefContent;
    }

    public Integer getBlogUserId() {
        return blogUserId;
    }

    public void setBlogUserId(Integer blogUserId) {
        this.blogUserId = blogUserId;
    }

    public Integer getBlogCategoryId() {
        return blogCategoryId;
    }

    public void setBlogCategoryId(Integer blogCategoryId) {
        this.blogCategoryId = blogCategoryId;
    }

    public Integer getBlogId() {
        return blogId;
    }

    public void setBlogId(Integer blogId) {
        this.blogId = blogId;
    }

    public String getBlogTitle() {
        return blogTitle;
    }

    public void setBlogTitle(String blogTitle) {
        this.blogTitle = blogTitle;
    }

    public String getBlogContent() {
        return blogContent;
    }

    public void setBlogContent(String blogContent) {
        this.blogContent = blogContent;
    }

    public Integer getBlogReadTimes() {
        return blogReadTimes;
    }

    public void setBlogReadTimes(Integer blogReadTimes) {
        this.blogReadTimes = blogReadTimes;
    }

    public Integer getBlogCommentTimes() {
        return blogCommentTimes;
    }

    public void setBlogCommentTimes(Integer blogCommentTimes) {
        this.blogCommentTimes = blogCommentTimes;
    }

    public Date getBlogEditTime() {
        return blogEditTime;
    }

    public void setBlogEditTime(Date blogEditTime) {
        this.blogEditTime = blogEditTime;
    }

    @Override
    public String toString() {
        return "Blog{" +
                "blogId=" + blogId +
                ", blogTitle='" + blogTitle + '\'' +
                ", blogContent='" + blogContent + '\'' +
                ", blogBriefContent='" + blogBriefContent + '\'' +
                ", blogReadTimes=" + blogReadTimes +
                ", blogCommentTimes=" + blogCommentTimes +
                ", blogEditTime=" + blogEditTime +
                ", blogUserId=" + blogUserId +
                ", blogCategoryId=" + blogCategoryId +
                '}';
    }
}
