<%--
  Created by IntelliJ IDEA.
  User: renlo
  Date: 2020/10/29
  Time: 11:30
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

    <title>登录</title>

</head>

<style>
    .incenter{
        text-align: center;
    }

    body{
        background-color: white;
    }
    .imgIco{
        width: 80px;
        height: 80px;
    }
</style>

<body>

<%@include file="header.jsp" %>
<div style="height: 50px"></div>
<div class="container-fluid" style="width: 60%">
    <div class="card">
        <div class="card-body">
            <h3 class="card-title" style="text-align: center">欢迎注册</h3>
            <p class="card-text">
            <form action="register" method="POST" >
                <div class="form-group row" id="validateUserName">
                    <label for="inputUserName" class="col-sm-2 col-form-label">用户名</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="inputUserName" placeholder="请输入用户名" name="userName"
                               pattern="[A-Za-z0-9\u4e00-\u9fa5]{2,50}" required onkeyup="validateUserName($(this))" onblur="validateUserName($(this))">
                        <div class="invalid-feedback"><small>用户名应为2-50位字母或数字或中文！</small></div>
                    </div>
                </div>
                <div class="form-group row"  id="validatePassword">
                    <label for="inputPassword3" class="col-sm-2 col-form-label">密码</label>
                    <div class="col-sm-10">
                        <input type="password"  class="form-control" id="inputPassword3" placeholder="请输入密码" pattern="[A-Za-z0-9]{6,30}"
                               required onkeyup="validateHtml5($(this))">
                        <div class="invalid-feedback">密码长度至少为六位,只能是大小写字母或数字！</div>
                    </div>
                </div>
                <div class="form-group row"  id="validatePasswordConfirm">
                    <label for="inputPassword4" class="col-sm-2 col-form-label">密码确认</label>
                    <div class="col-sm-10">
                        <input type="password"  class="form-control" id="inputPassword4" placeholder="请确认密码" onkeyup="validatePasswordConfirm($(this))">
                        <div class="invalid-feedback">密码不一致</div>
                    </div>
                </div>
                <div class="form-group row" id="validateEmail">
                    <label for="inputemail" class="col-sm-2 col-form-label">邮箱</label>
                    <div class="col-sm-10">
                        <input type="email" class="form-control" id="inputemail" placeholder="name@example.com" required onkeyup="validateHtml5($(this))">
                        <div class="invalid-feedback">邮箱地址格式不正确！</div>
                    </div>
                </div>

                <fieldset class="form-group">
                    <div class="row">
                        <legend class="col-form-label col-sm-2 pt-0">性别</legend>
                        <div class="col-sm-10">
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="userGender" id="gridRadios1" value="0" checked>
                                <label class="form-check-label" for="gridRadios1">
                                    保密
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="userGender" id="gridRadios2" value="1">
                                <label class="form-check-label" for="gridRadios2">
                                    男
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="userGender" id="gridRadios3" value="2">
                                <label class="form-check-label" for="gridRadios3">
                                    女
                                </label>
                            </div>
                        </div>
                    </div>
                </fieldset>
                <p class="incenter">
                    <button class="btn btn-success" type="submit">注册</button>&nbsp;&nbsp;&nbsp;&nbsp;
                    <button class="btn btn-success" type="button">登录</button>
                </p>
            </form>
            </p>
        </div>
    </div>
</div>

<script>

    $(function () {

    });

    /**前端加服务端校验
     */
    function validateUserName(obj) {
        console.log(!obj[0].checkValidity());
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

    function userInfoValidate() {
        $("#validateUserName input")
    }

</script>

</body>
</html>
