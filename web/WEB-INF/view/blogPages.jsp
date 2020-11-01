<%--
  Created by IntelliJ IDEA.
  User: renlo
  Date: 2020/10/29
  Time: 22:44
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    #lesslength{
        width: 80%;
    }
</style>

<body>
<%@include file="header.jsp" %>

<div class="container-fluid" id="lesslength">
    <%--所有文章--%>
    <p style="text-align: center">
        <h2 style="margin: auto">所有文章</h2>
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
        <div style="height: 20px"></div>

    <nav aria-label="Page navigation example">
        <ul class="pagination justify-content-center">
            <li class="page-item">
                <a class="page-link" href="blogs/page">首页</a>
            </li>

            <c:if test="${requestScope.page > 1}">
                <li class="page-item">
                    <a class="page-link" href="blogs/page?page=${requestScope.page - 1}" tabindex="-1">上一页</a>
                </li>
            </c:if>
            <c:if test="${requestScope.page <= 1}">
                <li class="page-item disabled">
                    <a class="page-link" href="#" tabindex="-1" aria-disabled="true">上一页</a>
                </li>
            </c:if>

            <c:if test="${requestScope.pages < 5}">
                <c:forEach begin="1" end="${requestScope.pages}" var="number">
                    <c:if test="${requestScope.page == number}">
                        <li class="page-item active disabled"><a class="page-link" href="#" aria-disabled="true">${number}</a></li>
                    </c:if>
                    <c:if test="${requestScope.page != number}">
                        <li class="page-item"><a class="page-link" href="blogs/page?page=${number}">${number}</a></li>
                    </c:if>
                </c:forEach>
            </c:if>

            <c:if test="${requestScope.pages >= 5}">
                <c:forEach begin="${requestScope.page-2}" end="${requestScope.page+2}" var="number">
                    <c:if test="${requestScope.page == number}">
                        <li class="page-item disabled"><a class="page-link" href="#" aria-disabled="true">${number}</a></li>
                    </c:if>
                    <c:if test="${requestScope.page != number}">
                        <li class="page-item"><a class="page-link" href="blogs/page?page=${number}">${number}</a></li>
                    </c:if>
                </c:forEach>
            </c:if>

            <c:if test="${requestScope.pages > requestScope.page}">
            <li class="page-item">
                <a class="page-link" href="blogs/page?page=${requestScope.page + 1}">下一页</a>
            </li>
            </c:if>
            <c:if test="${requestScope.pages <= requestScope.page}">
            <li class="page-item disabled">
                <a class="page-link" href="#" aria-disabled="true">下一页</a>
            </li>
            </c:if>

            <li class="page-item">
                <a class="page-link" href="blogs/page?page=${requestScope.pages}">末页</a>
            </li>
        </ul>
    </nav>
</div>
<%@include file="footer.jsp" %>
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


