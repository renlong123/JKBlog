package com.jkblog.entity;

import java.util.Date;

/**
 * 博客用户实体类
 */
public class BlogUser {

    private Integer userId;
    private String userName;
    private String userPassword;
    private String userDescription;
    private UserGender userGender;
    private Date userCreateTime;
    private Date userBirthDay;
    private Integer userBlogCount;
    private String userEmail;

    public Date getUserBirthDay() {
        return userBirthDay;
    }

    public void setUserBirthDay(Date userBirthDay) {
        this.userBirthDay = userBirthDay;
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }

    public String getUserPassword() {
        return userPassword;
    }

    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword;
    }



    public Date getUserBirthTime() {
        return userBirthDay;
    }

    public void setUserBirthTime(Date userBirthDay) {
        this.userBirthDay = userBirthDay;
    }



    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserDescription() {
        return userDescription;
    }

    public void setUserDescription(String userDescription) {
        this.userDescription = userDescription;
    }

    public UserGender getUserGender() {
        return userGender;
    }

    public void setUserGender(UserGender userGender) {
        this.userGender = userGender;
    }

    public Date getUserCreateTime() {
        return userCreateTime;
    }

    public void setUserCreateTime(Date userCreateTime) {
        this.userCreateTime = userCreateTime;
    }

    public Integer getUserBlogCount() {
        return userBlogCount;
    }

    public void setUserBlogCount(Integer userBlogCount) {
        this.userBlogCount = userBlogCount;
    }

    @Override
    public String toString() {
        return "BlogUser{" +
                "userId=" + userId +
                ", userName='" + userName + '\'' +
                ", userDescription='" + userDescription + '\'' +
                ", userGender=" + userGender +
                ", userCreateTime=" + userCreateTime +
                ", userBlogCount=" + userBlogCount +
                '}';
    }
}
