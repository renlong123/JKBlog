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

    .fixheight{
        height: 400px;
    }

    #thefirst{
        height: 150px;
    }
    #thesecond{
        height: 200px;
    }
    #thethird{
        height: 250px;
    }
    .incenter{
        text-align: center;
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
        <div class="col-10">
            <div class="jumbotron">
                <div class="text-center">
                    <img src="resources/img/javalogo.jpg" class="rounded card-img-top" alt="头像不见了" style="width: 80px;height: 80px">
                </div>
                <h3>头顶的星空</h3>
                <p class="lead">欢迎来到JKBlog,你可以记录学习的心得，知识点，笔记。<br/>这里是值得依赖的地方</p>
                <p>
                    <span class="badge badge-secondary">男</span>
                    <span class="badge badge-secondary">年龄：29</span>
                    <span class="badge badge-secondary">等级：6</span>
                    <span class="badge badge-secondary">等级：6</span>
                    <span class="badge badge-secondary">等级：6</span>
                </p>
                <button type="button" class="btn btn-primary">修改信息</button>
                <button type="button" class="btn btn-success">发博客</button>
            </div>
            <%--最热文章--%>
            热门文章
            <div style="height: 10px"></div>
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Card title</h5>
                    <h6 class="card-subtitle mb-2 text-muted">Card subtitle</h6>
                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                    <a href="#" class="card-link">Card link</a>
                    <a href="#" class="card-link">Another link</a>
                </div>
            </div>
            <div style="height: 10px"></div>
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Card title</h5>
                    <h6 class="card-subtitle mb-2 text-muted">Card subtitle</h6>
                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                    <a href="#" class="card-link">Card link</a>
                    <a href="#" class="card-link">Another link</a>
                </div>
            </div>
            <div style="height: 10px"></div>
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Card title</h5>
                    <h6 class="card-subtitle mb-2 text-muted">Card subtitle</h6>
                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                    <a href="#" class="card-link">Card link</a>
                    <a href="#" class="card-link">Another link</a>
                </div>
            </div>


            <div style="height: 20px"></div>
            全部文章
            <div style="height: 10px"></div>
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Card title</h5>
                    <h6 class="card-subtitle mb-2 text-muted">Card subtitle</h6>
                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                    <a href="#" class="card-link">Card link</a>
                    <a href="#" class="card-link">Another link</a>
                </div>
            </div>
            <div style="height: 10px"></div>
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Card title</h5>
                    <h6 class="card-subtitle mb-2 text-muted">Card subtitle</h6>
                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                    <a href="#" class="card-link">Card link</a>
                    <a href="#" class="card-link">Another link</a>
                </div>
            </div>
            <div style="height: 10px"></div>
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Card title</h5>
                    <h6 class="card-subtitle mb-2 text-muted">Card subtitle</h6>
                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                    <a href="#" class="card-link">Card link</a>
                    <a href="#" class="card-link">Another link</a>
                </div>
            </div>
            <div style="height: 10px"></div>
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Card title</h5>
                    <h6 class="card-subtitle mb-2 text-muted">Card subtitle</h6>
                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                    <a href="#" class="card-link">Card link</a>
                    <a href="#" class="card-link">Another link</a>
                </div>
            </div>
            <div style="height: 10px"></div>
            <div class="incenter">
                <nav aria-label="..." >
                    <ul class="pagination">
                        <li class="page-item disabled">
                            <a class="page-link" href="#" tabindex="-1" aria-disabled="true">Previous</a>
                        </li>
                        <li class="page-item"><a class="page-link" href="#">1</a></li>
                        <li class="page-item active" aria-current="page">
                            <a class="page-link" href="#">2 <span class="sr-only">(current)</span></a>
                        </li>
                        <li class="page-item"><a class="page-link" href="#">3</a></li>
                        <li class="page-item">
                            <a class="page-link" href="#">Next</a>
                        </li>
                    </ul>
                </nav>
            </div>

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


</body>
</html>

