package com.jkblog.entity;

import java.util.Date;

public class BlogComment {

    private Integer blogCommentId;
    private String blogCommentContents;

    private Date commentTime;
    private Integer commentUserId;
    private Integer commentBlogId;
    private Integer commentFather;
    private String commentUserName;
    private Integer commentSonCount;

    public Integer getCommentSonCount() {
        return commentSonCount;
    }

    public void setCommentSonCount(Integer commentSonCount) {
        this.commentSonCount = commentSonCount;
    }

    public String getCommentUserName() {
        return commentUserName;
    }

    public void setCommentUserName(String commentUserName) {
        this.commentUserName = commentUserName;
    }

    @Override
    public String toString() {
        return "BlogComment{" +
                "blogCommentId=" + blogCommentId +
                ", blogCommentContents='" + blogCommentContents + '\'' +
                ", commentTime=" + commentTime +
                ", commentUserId=" + commentUserId +
                ", commentBlogId=" + commentBlogId +
                ", commentFather=" + commentFather +
                '}';
    }

    public Integer getBlogCommentId() {
        return blogCommentId;
    }

    public void setBlogCommentId(Integer blogCommentId) {
        this.blogCommentId = blogCommentId;
    }

    public String getBlogCommentContents() {
        return blogCommentContents;
    }

    public void setBlogCommentContents(String blogCommentContents) {
        this.blogCommentContents = blogCommentContents;
    }

    public Date getCommentTime() {
        return commentTime;
    }

    public void setCommentTime(Date commentTime) {
        this.commentTime = commentTime;
    }

    public Integer getCommentUserId() {
        return commentUserId;
    }

    public void setCommentUserId(Integer commentUserId) {
        this.commentUserId = commentUserId;
    }

    public Integer getCommentBlogId() {
        return commentBlogId;
    }

    public void setCommentBlogId(Integer commentBlogId) {
        this.commentBlogId = commentBlogId;
    }

    public Integer getCommentFather() {
        return commentFather;
    }

    public void setCommentFather(Integer commentFather) {
        this.commentFather = commentFather;
    }
}
