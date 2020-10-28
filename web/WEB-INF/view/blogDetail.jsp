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

    <%--        <script type="text/javascript" rel="script" src="resources/js/vue.js"></script>
        <!-- 引入elementui样式 -->
            <link rel="stylesheet" href="resources/css/elementui.css" type="text/css">
        <!-- 引入elementui组件库 -->
            <script type="text/javascript" rel="script" src="resources/js/elementui.js"></script>--%>
    <title>博客详情</title>


</head>

<style>
    .titlefont{
        font-size: 30px;
        font-weight: bold;
    }
</style>

<body>


<nav class="navbar navbar-expand-lg fixed-top navbar-light bg-light">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">JKBlog</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="#">主页 <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">发博客</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        更多
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="#">关于博客</a>
                        <a class="dropdown-item" href="#">关注</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="#">退出登录</a>
                    </div>
                </li>
                <li class="nav-item">
                    <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">其他事务</a>
                </li>
            </ul>
            <form class="form-inline my-2 my-lg-0">
                <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-success my-2 my-sm-0" type="submit">搜索</button>
                &nbsp;&nbsp;&nbsp;&nbsp;
                <span id="login">登录</span>&nbsp;&nbsp;
                <span id="register">注册</span>
            </form>
        </div>
    </div>
</nav>


<div style="height: 70px"></div>

<div class="container-fluid">
    <div class="row">
        <div class="col-9">

            <div class="alert alert-info" role="alert">
                <h3 class="alert-heading">
                    博客标题这地方就爱看快乐的农夫煞风景
                </h3>
                <hr>
                <p class="mb-0">
                    发布时间：2020-10-28 &nbsp;&nbsp;&nbsp;&nbsp;
                    阅读数：368 &nbsp;&nbsp;&nbsp;&nbsp;
                    评论数：34
                </p>
            </div>


            <div class="card content">
                <div class="card-body">
                    This is some text within a card body.

                    正文内容显示
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
                        <h5 class="card-title">头顶的星空</h5>
                        <p class="card-text">
                            <span class="badge badge-secondary">男</span>
                            <span class="badge badge-secondary">年龄：29</span>
                            <span class="badge badge-secondary">等级：6</span>
                        </p>
                        <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
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
