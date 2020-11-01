<%--
  Created by IntelliJ IDEA.
  User: renlo
  Date: 2020/10/28
  Time: 17:10
  To change this template use File | Settings | File Templates.

  所有博客列表展示页面
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page isELIgnored="false" %>

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

  <title>博客列表</title>

</head>

<style>
  .jumbotron{
    height: 400px;
    background: url("resources/img/background.jpg") center;
  }

  .fixheight{
    height: 400px;
  }

  #thefirst{
    height: 150px;
    background-color: gold;
    line-height: 150px;
  }
  #thesecond{
    height: 170px;
    background-color: #b3b7bb;
    line-height: 200px;
  }
  #thethird{
    height: 190px;
    background-color: lightyellow;
    line-height: 250px;
  }
  .incenter{
    text-align: center;
  }
  .hotBlog{
    font-size: 80px;
    text-align: center;
  }

  .titleInText{
    font-weight: bold;
    cursor: pointer;
  }
  li{
    list-style: none;
  }
/*  .fixedLabel{
    margin-left: 10px;
    color: #7abaff;
    cursor: pointer;
    font-size: 16px;
    font-family: "Microsoft YaHei UI";
    line-height: 30px;
  }*/
</style>

<body>

<%@include file="header.jsp" %>

<div class="container-fluid" style="width: 85%;min-width: 800px">
  <div class="row">
    <div class="col-10">
      <div class="jumbotron">
        <h1 class="display-4">JKBlog</h1>
        <p class="lead">欢迎来到JKBlog,你可以记录学习的心得，知识点，笔记。<br/>这里是值得依赖的地方</p>
        <hr class="my-4">
        <p>加入JKBlog开放更多功能</p>
        <a class="btn btn-primary btn-lg" href="login" role="button">现在开始</a>
      </div>

      <%--前三--%>
      <div class="row">
        <div class="col-4 incenter">
          <div class="card fixheight">
            <div id="thesecond" class="card-img-top">
              <div class="hotBlog">2</div>
            </div>
            <div class="card-body">
              <c:if test="${requestScope.blogs.size() > 1}" >
                <p class="titleInText"
                   onclick="contentDetail(${requestScope.blogs[1].blogId})">
                    ${requestScope.blogs[1].blogTitle}
                </p>
                <hr/>
                <p class="contentInText">
                  ${requestScope.blogs[1].blogBriefContent}
                </p>
                <p class="statusInText">
                  <span class="badge badge-primary">阅读数：${requestScope.blogs[1].blogReadTimes}</span>
                  <span class="badge badge-success">评论数：${requestScope.blogs[1].blogCommentTimes}</span>
                </p>
              </c:if>
            </div>
          </div>
        </div>
        <div class="col-4 incenter">
          <div class="card fixheight">
            <div id="thefirst" class="card-img-top">
              <div class="hotBlog">1</div>
            </div>
            <div class="card-body">
              <p class="card-text">
                <c:if test="${requestScope.blogs.size() > 0}" >
                <p class="titleInText"
                   onclick="contentDetail(${requestScope.blogs[0].blogId})">
                  ${requestScope.blogs[0].blogTitle}
                </p>
                <hr/>
                <p class="contentInText">
                  ${requestScope.blogs[0].blogBriefContent}
                </p>
                <p class="statusInText">
                  <span class="badge badge-primary">阅读数：${requestScope.blogs[0].blogReadTimes}</span>
                  <span class="badge badge-success">评论数：${requestScope.blogs[0].blogCommentTimes}</span>
                </p>
              </c:if>
              </p>
            </div>
          </div>
        </div>
        <div class="col-4 incenter">
          <div class="card fixheight">
            <div id="thethird" class="card-img-top">
              <div class="hotBlog">3</div>
            </div>
            <div class="card-body">
              <c:if test="${requestScope.blogs.size() > 2}" >
              <p class="titleInText"
                 onclick="contentDetail(${requestScope.blogs[2].blogId})">
                ${requestScope.blogs[2].blogTitle}
              </p>
              <hr/>
              <p class="contentInText">
                ${requestScope.blogs[2].blogBriefContent}
              </p>
              <p class="statusInText">
                <span class="badge badge-primary">阅读数：${requestScope.blogs[2].blogReadTimes}</span>
                <span class="badge badge-success">评论数：${requestScope.blogs[2].blogCommentTimes}</span>
              </p>
              </c:if>
            </div>
          </div>
        </div>
      </div>

      <%--后面的--%>
      <div style="height: 10px"></div>

      <c:if test="${requestScope.blogs.size() > 3}">
      <c:forEach items="${requestScope.blogs}" var="blog" begin="3" end="${requestScope.blogs.size() - 1 }">
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
            <a href="blogdetail?blogId=${blog.blogId}" class="card-link">查看</a>
            <a href="blogdetail?blogId=${blog.blogId}" class="card-link">其他</a>
          </div>
        </div>
      </c:forEach>
      </c:if>
      <div style="height: 20px"></div>
      <ul class="list-group">
        <li class="list-group-item"> 请登录以查看更多</li>
      </ul>
    </div>
    <div class="col-2">
    </div>


<%--  <div style="padding-left: 1rem">
        <p class="text-left">热门博客</p>
        <p class="text-left">个人中心</p>
        <p class="text-left">博客页面</p>
      </div>
    </div>
  </div>--%>
</div>

    <div id="dg" style="z-index: 9999; position: fixed ! important; /*right: 0px;*/ top: 70px;width: 85%;margin: auto;min-width: 800px">
      <div class="container-fluid" style="margin: auto">
        <div class="row">
          <div class="col-10">
          </div>
          <div class="col-2" style="margin: auto">
              <div class="fixedLabel">JAVA</div>
              <div class="fixedLabel">C++</div>
              <div class="fixedLabel">SPRING</div>
              <div class="fixedLabel">SPRINGBOOT</div>
              <div class="fixedLabel">SPRINGCLOUD</div>
              <div class="fixedLabel">JAVA虚拟机</div>
              <div class="fixedLabel">分类</div>
              <div class="fixedLabel">分类</div>
              <div class="fixedLabel">分类</div>
              <div class="fixedLabel">分类</div>
          </div>
        </div>
      </div>
    </div>

<%@include file="footer.jsp" %>
<script>

  function contentDetail(blogId) {
    window.location.href = "blogdetail?blogId="+blogId;
  }

</script>

</body>
</html>
