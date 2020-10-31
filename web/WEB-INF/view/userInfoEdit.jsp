<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    <h3 class="incenter">修改个人信息</h3>
    <form action="userinfo" method="post">
        <div class="form-group row" id="validateUserName">
            <label for="inputUserName" class="col-sm-2 col-form-label">用户名</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="inputUserName" placeholder="请输入用户名" name="userName"
                       pattern="[A-Za-z0-9\u4e00-\u9fa5]{2,50}" required onkeyup="validateUserName($(this))"
                       onblur="validateUserName($(this))" value="${requestScope.user.userName}">
                <div class="invalid-feedback"><small>用户名应为2-50位字母或数字或中文！</small></div>
            </div>
        </div>
        <div class="form-group row"  id="validatePassword">
            <label for="inputPassword3" class="col-sm-2 col-form-label">密码</label>
            <div class="col-sm-10">
                <input type="password" name="userPassword"  class="form-control" id="inputPassword3" placeholder="请输入新密码" pattern="[A-Za-z0-9]{6,30}"
                       required onkeyup="validateHtml5($(this))">
                <div class="invalid-feedback">密码长度至少为六位,只能是大小写字母或数字！</div>
            </div>
        </div>
        <div class="form-group row"  id="validatePasswordConfirm">
            <label for="inputPassword4" class="col-sm-2 col-form-label">密码确认</label>
            <div class="col-sm-10">
                <input type="password"  class="form-control" id="inputPassword4" placeholder="请确认新密码" onkeyup="validatePasswordConfirm($(this))">
                <div class="invalid-feedback">密码不一致</div>
            </div>
        </div>
        <div class="form-group row" id="validateEmail">
            <label for="inputemail" class="col-sm-2 col-form-label">邮箱</label>
            <div class="col-sm-10">
                <input type="email" name="userEmail" class="form-control" id="inputemail" placeholder="name@example.com"
                       required onkeyup="validateHtml5($(this))" value="${requestScope.user.userEmail}">
                <div class="invalid-feedback">邮箱地址格式不正确！</div>
            </div>
        </div>
        <div class="form-group row" id="validatebirth">
            <label for="validationBirthDay" class="col-sm-2 col-form-label">出生日期</label>
            <div class="col-sm-10">
                <input class="form-control" id="validationBirthDay" required name="userBirthDay">
            </div>
        </div>
        <fieldset class="form-group">
            <div class="row">
                <legend class="col-form-label col-sm-2 pt-0">性别</legend>
                <div class="col-sm-10">
                    <div class="form-check">
                        <c:if test="${requestScope.user.userGender == '无'}">
                            <input class="form-check-input" type="radio" name="userGender" id="gridRadios1" value="0" checked>
                        </c:if>
                        <c:if test="${requestScope.user.userGender != '无'}">
                            <input class="form-check-input" type="radio" name="userGender" id="gridRadios1" value="0">
                        </c:if>
                        <label class="form-check-label" for="gridRadios1">
                            保密
                        </label>
                    </div>
                    <div class="form-check">
                        <c:if test="${requestScope.user.userGender == '男'}">
                            <input class="form-check-input" type="radio" name="userGender" id="gridRadios2" value="1" checked>
                        </c:if>
                        <c:if test="${requestScope.user.userGender != '男'}">
                            <input class="form-check-input" type="radio" name="userGender" id="gridRadios2" value="1">
                        </c:if>
                        <label class="form-check-label" for="gridRadios2">
                            男
                        </label>
                    </div>
                    <div class="form-check">
                        <c:if test="${requestScope.user.userGender == '女'}">
                            <input class="form-check-input" type="radio" name="userGender" id="gridRadios3" value="2" checked>
                        </c:if>
                        <c:if test="${requestScope.user.userGender != '女'}">
                            <input class="form-check-input" type="radio" name="userGender" id="gridRadios3" value="2">
                        </c:if>
                        <label class="form-check-label" for="gridRadios3">
                            女
                        </label>
                    </div>
                </div>
            </div>
        </fieldset>
        <div class="form-group row" id="validateDescription">
            <label for="inputDesc" class="col-sm-2 col-form-label">个人简介</label>
            <div class="col-sm-10">
                <input type="text" name="userDescription" class="form-control" id="inputDesc"
                          value="${requestScope.user.userDescription}" rows="3"></input>
            </div>
        </div>
        <div div class="form-group row">
            <label class="col-sm-2 col-form-label"></label>
            <div class="col-sm-10">
                <button class="btn btn-success">提交</button>
            </div>
        </div>
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
       var birthday = "${requestScope.user.userBirthDay}";
       if(birthday == ""){
           var date = new Date();
           var y = date.getFullYear();
           var m = date.getMonth()+1;
           var d = date.getDate();
           var nowDate = y+"-"+m+"-"+d;
           $('#validationBirthDay').val(nowDate);
       }else{
           $('#validationBirthDay').val(birthday);
       }
   });
    /**前端加服务端校验
     */
    function validateUserName(obj) {
        if(!obj[0].checkValidity()){
            obj.siblings(".invalid-feedback").text("用户名应为2-50位字母或数字或中文！");
            obj.removeClass("is-invalid");
            obj.parent().addClass("was-validated");
        }else{
            $.ajax({
                type: "GET",
                url: "namevalidate?userName="+obj.val(),
                success: function (result) {
                    if(result == "yes"){
                        obj.siblings(".invalid-feedback").text("用户名应为2-50位字母或数字或中文！");
                        obj.removeClass("is-invalid");
                        obj.parent().addClass("was-validated");
                    }else{
                        obj.parent().removeClass("was-validated");
                        obj.siblings(".invalid-feedback").text("用户名已经被占用了！");
                        obj.addClass("is-invalid");
                    }
                }
            });
        }
    }

    /*
    * 默认的校验*/
    function validateHtml5(obj) {
        obj.parent().addClass("was-validated");
    }

    /*密码是否一致校验*/
    function validatePasswordConfirm(obj) {
        if($("#inputPassword3").val() == obj.val()){
            obj.removeClass("is-invalid");
            obj.addClass("is-valid");
        }else{
            obj.removeClass("is-valid");
            obj.addClass("is-invalid");
        }
    }

</script>

</body>
</html>
