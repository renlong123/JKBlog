<%--
  Created by IntelliJ IDEA.
  User: renlo
  Date: 2020/10/28
  Time: 22:30
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
    <script type="text/javascript" src="resources/js/wangEditor.min.js"></script>
    <script type="text/javascript" charset="gbk" src="resources/js/zh.js"></script>
    <title>博客列表</title>


</head>
<style>
    .incenter{
        text-align: center;
    }
    .container-fluid{
        width: 80%;
    }
</style>

<body>

<%@include file="header.jsp" %>
<div class="container-fluid">
    <h3 class="incenter">
        <c:if test="${requestScope.blogAllInfo == null}">
            新建博客
        </c:if>
        <c:if test="${requestScope.blogAllInfo != null}">
            修改博客
        </c:if>
    </h3>
    <form method="post" action="blogedit" id="addBlogForm">
        <c:if test="${requestScope.blogAllInfo != null}">
            <input type="hidden" value="${requestScope.blogAllInfo.blog.blogId}" name="blogId">
        </c:if>
        <div class="mb-3">
            <label for="validationTitle">标题</label>
            <c:if test="${requestScope.blogAllInfo == null}">
                <input class="form-control" id="validationTitle" placeholder="请输入标题，长度大于2，小于255" required name="blogTitle">
            </c:if>
            <c:if test="${requestScope.blogAllInfo != null}">
                <input class="form-control" id="validationTitle" value="${requestScope.blogAllInfo.blog.blogTitle}" required name="blogTitle">
            </c:if>
            <div class="valid-feedback">
                Looks good!
            </div>
            <div class="invalid-feedback">
                Please enter a message in the textarea.
            </div>
        </div>
        <div class="mb-3">
            <div>
                <label for="validationCategory">分类</label>
            </div>
            <select class="custom-select custom-select" id="validationCategory" name="blogCategoryId" style="width: 200px;">

            </select>
            <button class="btn btn-success" type="button" id="categoryAddButton">新增分类</button>
        </div>
        <div class="mb-3">
            <label for="validationContent">正文</label>
            <div id="div1" id="validationContent" name="blogContent">
                <%--<p>欢迎使用 <b>Jodit</b> 富文本编辑器，开始写博客吧</p>--%>
                ${requestScope.blogAllInfo.blog.blogContent}
            </div>
        </div>
        <button class="btn btn-success" type="button" id="addNewBlog">提交</button>
    </form>
</div>

<div class="modal" tabindex="-1" role="dialog" id="categoryAddModal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">新增分类</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <p>
                    <form id="addCategory">
                        <div class="form-group row">
                            <label for="inputEmail3" class="col-sm-2 col-form-label">分类名</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="inputEmail3" name="categoryName">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="inputPassword3" class="col-sm-2 col-form-label">分类描述</label>
                            <div class="col-sm-10">
                                <textarea  class="form-control" id="inputPassword3" rows="3" name="categoryDescription"></textarea>
                            </div>
                        </div>
                    </form>
                </p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary" id="addCategoryBtn">新增</button>
            </div>
        </div>
    </div>
</div>
<%@include file="footer.jsp" %>

<script type="text/javascript">
    const E = window.wangEditor
    const editor = new E('#div1')
    // 或者 const editor = new E( document.getElementById('div1') )
    editor.config.zIndex = 500
    /*上传图片路径*/
    editor.config.uploadImgServer = 'image'
    /*图片最大值*/
    editor.config.uploadImgMaxSize = 50 * 1024 * 1024 // 50M
    editor.create()


    $("#addNewBlog").click(function () {
        var blogTitle = $("#addBlogForm input[name='blogTitle']").val();
        var blogCategoryId = $("#addBlogForm select[name='blogCategoryId']").val();
        var contents =  editor.txt.html();

        if(${requestScope.blogAllInfo != null}){
            var blogId = "${requestScope.blogAllInfo.blog.blogId}";
            $.ajax({
                type: "POST",
                url: "blogedit",
                data: {
                    "blogId": blogId,
                    "blogTitle": blogTitle,
                    "blogCategoryId": blogCategoryId,
                    "blogContent": contents
                },
                success: function (result) {

                    if(result == "success"){
                        window.location.href = "homepage";
                    }else{
                        alert("出错了，请稍后重试！");
                    }
                }
            });
        }else{
            $.ajax({
                type: "POST",
                url: "blogedit",
                data: {
                    "blogTitle": blogTitle,
                    "blogCategoryId": blogCategoryId,
                    "blogContent": contents
                },
                success: function (result) {
                    if(result == "success"){
                        window.location.href = "homepage";
                    }else{
                        alert("出错了，请稍后重试！");
                    }
                }
            });
        }
    });

    /*分类模态框弹出*/
    $("#categoryAddButton").click(function () {
        $('#categoryAddModal').modal('show');
    });

    /*页面加载完成后加载分类*/
    $(function () {
        getCategoryInfo();

    });

    $("#addCategoryBtn").click(addCategory);

    /*发ajax请求新增分类*/
    function addCategory() {
        alert(1);
        var categoryName = $("#addCategory input[name='categoryName']").val();
        var categoryDescription = $("#addCategory textarea[name='categoryDescription']").val();
        $.ajax({
            type: "POST",
            url: "blogcategory",
            data: "categoryName="+categoryName+"&categoryDescription="+categoryDescription,
            success: function (result) {
                if(result == "success"){
                    $('#categoryAddModal').modal('hide');
                    getCategoryInfo();
                }else{
                    alert("添加出错了！");
                }
            },
            error: function () {
                alert("添加出错了！");
            }
        });
    }

    /* 查询并更新
     */
    function getCategoryInfo() {
        $.ajax({
            type: "GET",
            url: "blogcategory",
            dataType: "json",
            success: function (categoryList) {
                updateCategory(categoryList);
            }
        });
    }

    /*更新option选项内容*/
    function updateCategory(categoryList) {
        var categoryOptions = $("#validationCategory");
        categoryOptions.empty();
        alert
        $.each(categoryList,function (name,value) {
            var items;
            /*如果是修改，就选择原来的分类*/
            if("${requestScope.blogAllInfo.category.categoryId}" == value.categoryId) {
                items = $("<option value='"+value.categoryId +"' selected='selected'>"+value.categoryName+"</option>");
            }else{
                items = $("<option value='"+value.categoryId +"'>"+value.categoryName+"</option>");
            }
            categoryOptions.append(items);
        })
    }

</script>
</body>
</html>

