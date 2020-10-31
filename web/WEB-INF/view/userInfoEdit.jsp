<%--
  Created by IntelliJ IDEA.
  User: renlo
  Date: 2020/10/29
  Time: 12:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%
    String contextPath = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+contextPath+"/";
%>

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
        <%--日期控件引入--%>
    <link rel="stylesheet" href="resources/css/bootstrap-datetimepicker.min.css" type="text/css">
    <script type="text/javascript" rel="script" src="resources/js/bootstrap-datetimepicker.min.js"></script>
    <script type="text/javascript" rel="script" src="resources/js/bootstrap-datetimepicker.zh-CN.js"></script>

    <%--bootstrap文件上传组件--%>
    <link type="text/css" rel="stylesheet" href="resources/css/fileinput.css" />
    <script type="text/javascript" src="resources/js/fileinput.js"></script>
    <script type="text/javascript" src="resources/js/zh.js"></script>

    <title>登录</title>

</head>

<style>
    .incenter{
        text-align: center;
    }

    .imgIco{
        width: 80px;
        height: 80px;
    }

    .container-fluid{
        width: 80%;
    }
</style>

<body>

<%@include file="header.jsp" %>

<div class="container-fluid">
    <h3 class="incenter">个人信息</h3>
    <form enctype="multipart/form-data">
        <div class="mb-3">
            <label for="validationTitle">用户名</label>
            <input class="form-control" id="validationTitle" placeholder="请输入标题，长度大于2，小于255" required name="blogTitle"></input>
            <div class="valid-feedback">
                Looks good!
            </div>
            <div class="invalid-feedback">
                Please enter a message in the textarea.
            </div>
        </div>
        <div class="mb-3">
            <label for="validationPassword">密码</label>
            <input type="password" class="form-control" id="validationPassword" placeholder="请输入新密码" required name="userPassword"></input>
            <div class="valid-feedback">
                Looks good!
            </div>
            <div class="invalid-feedback">
                Please enter a message in the textarea.
            </div>
        </div>
        <div class="mb-3">
            <label for="validationEmail">邮箱</label>
            <input type="email" class="form-control" id="validationEmail" placeholder="请输入新密码" required name="userEmail"></input>
            <div class="valid-feedback">
                Looks good!
            </div>
            <div class="invalid-feedback">
                Please enter a message in the textarea.
            </div>
        </div>
        <div class="mb-3">
            <label for="validationBirthDay">出生日期</label>
            <input class="form-control" id="validationBirthDay" required></input>
            <div class="valid-feedback">
                Looks good!
            </div>
            <div class="invalid-feedback">
                Please enter a message in the textarea.
            </div>
        </div>
        <div class="form-group">
            <label for="exampleFormControlFile">头像</label>
            <img src="resources/img/javalogo.jpg" style="width: 20px;height: 20px">
            <input type="file" name="image" class="file" id="exampleFormControlFile"/>
            <p class="help-block">支持jpg、jpeg、png、gif格式，大小不超过10.0M</p>
        </div>
        <div class="mb-3">
            <label for="validationContent">个人简介</label>
            <input type="text" class="form-control" id="validationContent" required></input>
        </div>
        <div class="form-group row" >
            <label for="exampleRadios" class="col-sm-2 col-form-label">性别</label>
            <div class="col-sm-10" id="exampleRadios">
                <input class="form-check-input" type="radio" name="exampleRadios" id="exampleRadios1" value="option1" checked>
                <label class="form-check-label" for="exampleRadios1">
                    保密
                </label>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input class="form-check-input" type="radio" name="exampleRadios" id="exampleRadios2" value="option2">
                <label class="form-check-label" for="exampleRadios2">
                    男
                </label>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input class="form-check-input" type="radio" name="exampleRadios" id="exampleRadios3" value="option3">
                <label class="form-check-label" for="exampleRadios3">
                    女
                </label>
            </div>
        </div>
        <button class="btn btn-success">提交</button>
    </form>
</div>
<%@include file="footer.jsp" %>
<script>

    $('#validationBirthDay').datetimepicker({
        language: 'zh-CN',//显示中文
        format: 'yyyy-mm-dd',//显示格式
        minView: "month",//设置只显示到月份
        initialDate: new Date(),//初始化当前日期
        autoclose: true,//选中自动关闭
        todayBtn: true,//显示今日按钮
        language: 'zh-CN',
    })

    $("#exampleFormControlFile").fileinput({
        language: 'zh',
        uploadUrl: "<%=basePath%>userIco", //上传的地址
        allowedFileExtensions : ['jpg', 'png','gif','jpeg'],//接收的文件后缀
        showUpload: true, //是否显示上传按钮
        showCaption: true,//是否显示标题
        browseClass: "btn btn-primary", //按钮样式
        dropZoneEnabled: false,//是否显示拖拽区域
        maxImageWidth: 1000,//图片的最大宽度
        maxImageHeight: 1000,//图片的最大高度
        maxFileSize: 10240,//单位为kb，如果为0表示不限制文件大小
    });

   $(function () {
       var date = new Date();
       var y = date.getFullYear();
       var m = date.getMonth()+1;
       var d = date.getDate();
       var nowDate = y+"-"+m+"-"+d;
       $('#validationBirthDay').val(nowDate);
   });

</script>

</body>
</html>
