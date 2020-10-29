<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: renlo
  Date: 2020/10/28
  Time: 17:10
  To change this template use File | Settings | File Templates.

  所有博客列表展示页面
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%
    String contextPath = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+contextPath+"/";
%>

<html>
<head>
    <%--设置基础路径为项目根目录--%>
    <base href="<%=basePath%>"/>
    <%--标题图标--%>
    <link rel="icon" href="resources/img/javalogo.jpg" type="image/x-icon" />
    <link rel="shortcut icon" href="resources/img/javalogo.jpg" type="image/x-icon">
    <%--bootstrap 引入--%>
    <link rel="stylesheet" href="resources/css/bootstrap.min.css" type="text/css">
    <script type="text/javascript" rel="script" src="resources/js/jquery-3.5.1.min.js"></script>
    <script type="text/javascript" rel="script" src="resources/js/bootstrap.bundle.min.js"></script>
    <script type="text/javascript" rel="script" src="resources/js/bootstrap.min.js"></script>
    <title>博客详情</title>
</head>

<style>
    .titlefont{
        font-size: 30px;
        font-weight: bold;
    }
    .smallfont{
        font-size: 10px;
    }
</style>

<body>

<%@include file="header.jsp" %>

<div class="container-fluid">
    <div class="row">
        <div class="col-9">
            <div class="alert alert-info" role="alert">
                <h3 class="alert-heading">
                    ${requestScope.allInfo.blog.blogTitle}
                </h3>
                <hr>
                <p class="mb-0 smallfont" >
                    发布时间：
                    <fmt:formatDate value="${requestScope.allInfo.blog.blogEditTime}" pattern="yyyy-MM-dd HH:mm:ss"/>&nbsp;&nbsp;&nbsp;&nbsp;
                    阅读数：${requestScope.allInfo.blog.blogReadTimes} &nbsp;&nbsp;&nbsp;&nbsp;
                    评论数：${requestScope.allInfo.blog.blogCommentTimes}
                </p>
            </div>

            <div class="card content">
                <div class="card-body">
                    <p>
                        ${requestScope.allInfo.blog.blogContent}
                    </p>
                </div>
            </div>
        </div>
        <div class="col-3">
            <div style="padding-left: 1rem">
                <div class="card">
                    <div class="text-center">
                        <img src="resources/img/javalogo.jpg" class="rounded card-img-top" alt="头像不见了" style="width: 50px;height: 50px">
                    </div>
                    <div class="card-body text-center">
                        <h5 class="card-title">${requestScope.allInfo.user.userName}</h5>
                        <p class="card-text">
                            <span class="badge badge-secondary">${requestScope.allInfo.user.userGender}</span>
                            <span class="badge badge-secondary">
                                加入时间:
                                <fmt:formatDate value="${requestScope.allInfo.user.userCreateTime}" pattern="yyyy-MM-dd"/>
                            </span>
                        </p>
                        <p class="card-text">${requestScope.allInfo.user.userDescription}</p>
                        <a href="#" class="btn btn-primary">加关注</a>
                    </div>
                </div>
                <div style="height: 10px"></div>
                相关文章
                <div style="height: 10px"></div>
                <div class="card">
                    <div class="card-body">
                        This is some text within a card body.
                    </div>
                </div>
                <div style="height: 10px"></div>
                <div class="card">
                    <div class="card-body">
                        This is some text within a card body.
                    </div>
                </div>
                <div style="height: 10px"></div>
                <div class="card">
                    <div class="card-body">
                        This is some text within a card body.
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>
