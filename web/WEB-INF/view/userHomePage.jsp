<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: renlo
  Date: 2020/10/28
  Time: 22:07
  To change this template use File | Settings | File Templates.
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

    <%--        <script type="text/javascript" rel="script" src="resources/js/vue.js"></script>
        <!-- 引入elementui样式 -->
            <link rel="stylesheet" href="resources/css/elementui.css" type="text/css">
        <!-- 引入elementui组件库 -->
            <script type="text/javascript" rel="script" src="resources/js/elementui.js"></script>--%>
    <title>博客列表</title>


</head>

<style>
    .jumbotron{
        height: 350px;
        background: url("resources/img/jk002.jpg") center;
    }

    .titleInText{
        font-weight: bold;
        cursor: pointer;
    }
    .incenter{
        text-align: center;
    }
</style>

<body>
<%@include file="header.jsp" %>

<div class="container-fluid">
    <div class="row">
        <div class="col-10">
            <div class="jumbotron incenter">
                <div class="text-center">
                    <img src="resources/img/javalogo.jpg" class="rounded card-img-top" alt="头像不见了" style="width: 80px;height: 80px">
                </div>
                <h3>${requestScope.user.userName}</h3>
                <p class="lead">${requestScope.user.userDescription}</p>
                <p>
                    <span class="badge badge-secondary">UID: ${requestScope.user.userId}</span>
                    <span class="badge badge-secondary">${requestScope.user.userGender}</span>
                    <span class="badge badge-secondary">
                        加入时间：
                        <fmt:formatDate value="${requestScope.user.userCreateTime}" pattern="yyy-MM-dd"></fmt:formatDate>
                    </span>
                </p>
                <button type="button" class="btn btn-primary" onclick="window.location.href='userinfo'">修改信息</button>
                <button type="button" class="btn btn-success" onclick="window.location.href='blogedit'">发博客</button>
            </div>
            <%--最热文章--%>
            <p>
                热门文章
                <button class="btn btn-success btn-sm" onclick="window.location.href='blogs/page'" style="float: right">
                    查看全部
                </button>
            </p>
            <c:forEach items="${requestScope.blogs}" var="blog">
                <div style="height: 10px"></div>
                <div class="card">
                    <div class="card-body">
                        <p class="titleInText"
                           onclick="contentDetail(${blog.blogId})">
                                ${blog.blogTitle}
                        </p>
                        <hr/>
                        <p class="contentInText">
                                ${blog.blogBriefContent}
                        </p>
                        <p class="statusInText">
                            <span class="badge badge-primary">阅读数：${blog.blogReadTimes}</span>
                            <span class="badge badge-success">评论数：${blog.blogCommentTimes}</span>
                        </p>
                        <button class="btn btn-danger btn-sm" onclick="window.location.href='blogdetail?blogId=${blog.blogId}'">查看</button>
                        <button class="btn btn-danger btn-sm" onclick="window.location.href='blogedit?blogId=${blog.blogId}'">编辑</button>
                        <button class="btn btn-danger btn-sm" id="blogDeleteButton" onclick="deleteBlog('${blog.blogTitle}','${blog.blogId}')">删除</button>
                    </div>
                </div>
            </c:forEach>
        </div>
        <div class="col-2">
            <div style="padding-left: 1rem">
                <p class="text-left">热门博客</p>
                <p class="text-left">个人中心</p>
                <p class="text-left">博客页面</p>
            </div>
        </div>
    </div>
</div>

<div class="modal" tabindex="-1" role="dialog" id="blogDeleteModal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">删除博客</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div>
                    你确定要删除该博客吗？
                </div>
                <hr/>
                <div id="titleDescription"></div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary" id="deleteConfirm">确定删除</button>
            </div>
        </div>
    </div>
</div>

<script>
    function contentDetail(blogId) {
        window.location.href = "blogdetail?blogId="+blogId;
    }

    function deleteBlog(blogTitle,blogId){
        $('#titleDescription').html(blogTitle);
        $('#blogDeleteModal').modal('show');
        $("#deleteConfirm").click(function () {
            window.location.href = "blogdelete?blogId="+blogId;
        });
    }

    $(function () {



    });

</script>
</body>
</html>

