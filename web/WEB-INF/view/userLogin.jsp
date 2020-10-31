<%--
  Created by IntelliJ IDEA.
  User: renlo
  Date: 2020/10/29
  Time: 11:18
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

    <div style="height: 50px">
    </div>
    <div class="container-fluid" style="width: 60%">
    <div class="card" style="max-width: 600px;margin: auto;">
        <div class="card-body" style="width: 80%;margin: auto">
            <h5 class="card-title incenter">请登录</h5>
            <p class="card-text">
                <form method="POST" action="login" >
                    <div class="form-group row">
                        <label for="inputusername" class="col-sm-2 col-form-label">用户名</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="inputusername" placeholder="请输入用户名" name="userName">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="inputPassword" class="col-sm-2 col-form-label">密码</label>
                        <div class="col-sm-10">
                            <input type="password"  class="form-control" id="inputPassword" placeholder="请输入密码" name="userPassword">
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-sm-2"></div>
                        <div class="col-sm-10">
                            <div class="form-check">
                                <input type="checkbox"  class="form-check-input" id="rememberMeId" name="rememberMe" value="rememberMe">
                                <label class="form-check-label" for="rememberMeId"  style="font-size: 15px">
                                    七天免登录
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 col-form-label"></label>
                        <div class="col-sm-10">
                            <div style="color: red">
                                ${requestScope.loginTips}
                            </div>
                        </div>
                    </div>
                    <div class="incenter">
                        <button class="btn btn-success" type="submit">登录</button>&nbsp;&nbsp;&nbsp;&nbsp;
                        <button class="btn btn-success" onclick="window.location.href='register';">注册</button>
                    </div>
                </form>
            </p>
        </div>
    </div>
    </div>
    <div style="height: 60px"></div>
    <%@include file="footer.jsp" %>
</body>
</html>
