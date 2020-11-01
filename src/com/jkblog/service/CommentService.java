package com.jkblog.service;

import com.jkblog.dao.JDBCDAO;
import com.jkblog.entity.Blog;
import com.jkblog.entity.BlogComment;
import com.jkblog.utils.DBUtil;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CommentService {

    /**
     * 插入操作，增加事务处理，评论数要么成功，要么全部失败。
     * @param blogComment
     * @return
     */
    public int insertComment(BlogComment blogComment){

        int result = 0;
        Connection con = DBUtil.getConnection();

        try {
            con.setTransactionIsolation(Connection.TRANSACTION_SERIALIZABLE);
            con.setAutoCommit(false);

            String sql = "insert into blogcomment values(null,?,?,?,?,?,?,0)";

            int i = JDBCDAO.comUpdate(con,sql, blogComment.getBlogCommentContents(), blogComment.getCommentTime(), blogComment.getCommentUserId(),
                    blogComment.getCommentBlogId(), blogComment.getCommentFather(), blogComment.getCommentUserName());

            if(i == 1){
                String sql1 = "update blog set blogCommentTimes=blogCommentTimes+1 where blogId=?";
                int i1 = JDBCDAO.comUpdate(con,sql1, blogComment.getCommentBlogId());
                if(i1 == 1){
                    if(blogComment.getCommentFather()!=0){
                        int i2 = updateAlComments(con,blogComment.getCommentFather());
                        result = i2;
                    }else {
                        result = 1;
                    }
                }else {
                    result = 0;
                }
            }else{
                result = 0;
            }

            if(result == 0){
                con.rollback();
            }else{
                con.commit();
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
            try {
                con.rollback();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }finally{
            DBUtil.closeConnection(con);
            return result;
        }
    }

    /**
     * 一次冒泡更新
     * @param commentFather
     * @return
     */
    public int updateAlComments(Connection con,Integer commentFather){
        if(commentFather != 0){
            String sql2 = "update blogcomment set commentSonCount=commentSonCount+1 where blogCommentId=?";
            int i2 = JDBCDAO.comUpdate(con,sql2, commentFather);
            if(i2==1){
                String sql = "select commentFather from blogcomment where blogCommentId=?";
                Integer integer = JDBCDAO.selectIntItem(sql, commentFather);
                int i = updateAlComments(con,integer);
                return i;
            }else {
                return 0;
            }
        }else{
            return 1;
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
