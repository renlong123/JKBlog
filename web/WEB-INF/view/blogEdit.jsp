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
    <h3 class="incenter">新建博客</h3>
    <form>
        <div class="mb-3">
            <label for="validationTitle">标题</label>
            <input class="form-control" id="validationTitle" placeholder="请输入标题，长度大于2，小于255" required name="blogTitle"></input>
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
            <select class="custom-select custom-select" id="validationCategory" name="blogCategory" style="width: 200px;">
                <option selected>请选择</option>
                <option value="1">One</option>
                <option value="2">Two</option>
                <option value="3">Three</option>
            </select>
            <button class="btn btn-success" id="categoryAddButton">新增分类</button>
        </div>
        <div class="mb-3">
            <label for="validationContent">正文</label>
            <div id="div1" id="validationContent">
                <p>欢迎使用 <b>Jodit</b> 富文本编辑器,，开始写博客吧</p>
            </div>
        </div>
        <button class="btn btn-success">提交</button>
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
                    <form>
                        <div class="form-group row">
                            <label for="inputEmail3" class="col-sm-2 col-form-label">分类名</label>
                            <div class="col-sm-10">
                                <input type="email" class="form-control" id="inputEmail3">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="inputPassword3" class="col-sm-2 col-form-label">分类描述</label>
                            <div class="col-sm-10">
                                <textarea  class="form-control" id="inputPassword3" rows="3"></textarea>
                            </div>
                        </div>
                    </form>
                </p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary">Save changes</button>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript" src="resources/js/wangEditor.min.js"></script>
<script type="text/javascript">
    const E = window.wangEditor
    const editor = new E('#div1')
    // 或者 const editor = new E( document.getElementById('div1') )
    editor.config.zIndex = 500
    editor.create()


    $("#categoryAddButton").click(function () {
        $('#categoryAddModal').modal('show');
    });

</script>
</body>
</html>

