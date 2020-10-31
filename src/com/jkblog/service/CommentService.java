package com.jkblog.service;

import com.jkblog.dao.JDBCDAO;
import com.jkblog.entity.BlogComment;

import java.util.ArrayList;
import java.util.List;

public class CommentService {

    public int insertComment(BlogComment blogComment){

        String sql = "insert into blogcomment values(null,?,?,?,?,?,?,0)";

        int i = JDBCDAO.comUpdate(sql, blogComment.getBlogCommentContents(), blogComment.getCommentTime(), blogComment.getCommentUserId(),
                blogComment.getCommentBlogId(), blogComment.getCommentFather(), blogComment.getCommentUserName());

        if(i == 1){
            String sql1 = "update blog set blogCommentTimes=blogCommentTimes+1 where blogId=?";
            int i1 = JDBCDAO.comUpdate(sql1, blogComment.getCommentBlogId());
            if(i1 == 1){
                if(blogComment.getCommentFather()!=0){
                    String sql2 = "update blogcomment set commentSonCount=commentSonCount+1 where blogCommentId=?";
                    int i2 = JDBCDAO.comUpdate(sql2, blogComment.getCommentFather());
                    if(i2==1){
                        return 1;
                    }else {
                        return 0;
                    }
                }else {
                    return 1;
                }
            }else {
                return 0;
            }
        }else{
            return 0;
        }
    }

    public List<BlogComment> getAllCommentByFatherId(Integer commentFather){

        List<BlogComment> allBlogComments = new ArrayList<>();

        String sql = "select * from blogcomment where commentFather=?";
        List<BlogComment> blogComments = JDBCDAO.serachObject(BlogComment.class, sql, commentFather);

        if(blogComments != null){
            for(BlogComment blogComment: blogComments){
                List<BlogComment> comments = getAllCommentByFatherId(blogComment.getBlogCommentId());
                allBlogComments.addAll(comments);
            }
            allBlogComments.addAll(blogComments);
            return allBlogComments;
        }else{
            return null;
        }
    }
}
