<%--
  Created by IntelliJ IDEA.
  User: renlo
  Date: 2020/10/29
  Time: 22:44
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

    <title>搜索</title>
</head>

<style>
    .titleInText{
        font-weight: bold;
        cursor: pointer;
    }
    #lesslength{
        width: 80%;
    }
    .myLinkTitle{
        font-family: "Microsoft YaHei UI";
        font-size: 20px;
        cursor: pointer;
        color: darkcyan;
    }
    .myactive{
        background-color: #3a8ee6;
        color: gray;
        cursor: not-allowed;
    }
    li.mylinkActive{
        cursor: pointer;
        color: blue;
    }
</style>

<body>
<nav class="navbar navbar-expand-lg fixed-top navbar-light bg-light">
    <div class="container-fluid">
        <a class="navbar-brand" href="index">JKBlog</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent"<%-- style="margin: auto;text-align: center"--%>>
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="index">主页 <span class="sr-only">(current)</span></a>
                </li>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <form class="form-inline my-2 my-lg-0" >
                    <input class="form-control mr-sm-2 serachClass" type="search" placeholder="Search" aria-label="Search"
                           value="${requestScope.serachText}" pattern="[A-Za-z0-9\u4e00-\u9fa5]{2,50}" required id="serachinput"
                           style="min-width: 450px">
                    <button class="btn btn-outline-success my-2 my-sm-0" type="button" onclick="serachContent(1)">搜索</button>
                </form>
            </ul>

            <form class="form-inline my-2 my-lg-0">
<%--                <input class="form-control mr-sm-2 serachClass" type="search" placeholder="Search" aria-label="Search"
                       value="${requestScope.serachText}" pattern="[A-Za-z0-9\u4e00-\u9fa5]{2,50}" required id="serachinput"
                        style="min-width: 450px">
                <button class="btn btn-outline-success my-2 my-sm-0" type="button" onclick="serachContent(1)">搜索</button>--%>
                &nbsp;&nbsp;&nbsp;&nbsp;
                <ul class="navbar-nav mr-auto">
                    <c:if test="${sessionScope.userName == null}">
                        <li class="nav-item">
                            <a class="nav-link" href="login">登录</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="register">注册</a>
                        </li>
                    </c:if>
                    <c:if test="${sessionScope.userName != null}">
                        <li class="nav-item">
                            <a class="nav-link" href="homepage?userId=${sessionScope.userId}">${sessionScope.userName}</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="loginOut">退出</a>
                        </li>
                    </c:if>
                </ul>
                <%--<span id="login" >登录</span>&nbsp;&nbsp;
                <span id="register">注册</span>--%>
            </form>
        </div>
    </div>
</nav>

<%--
<nav class="navbar navbar-expand-lg fixed-top navbar-light bg-light">
    <div class="container-fluid">
        <a class="navbar-brand" href="index">JKBlog</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                    aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
&lt;%&ndash;            <ul class="navbar-nav mr-auto">
                <li class="nav-item">
                    <a class="nav-link" href="index">主页 <span class="sr-only"></span></a>
                </li>
            </ul>&ndash;%&gt;
        <ul class="navbar-nav mr-auto">
&lt;%&ndash;            <li class="nav-item">
                <a class="nav-link" href="index">主页 <span class="sr-only"></span></a>
            </li>&ndash;%&gt;
&lt;%&ndash;            <div class="input-group mb-3" style="width: 50%">
                <input type="text" class="form-control" placeholder="搜索" aria-label="Recipient's username"
                       aria-describedby="button-addon2" value="${requestScope.serachText}"
                       pattern="[A-Za-z0-9\u4e00-\u9fa5]{2,50}" required id="serachinput">
                <div class="input-group-append">
                    <button class="btn btn-outline-secondary" type="button" id="button-addon2" onclick="serachContent(1)">搜索</button>
                </div>
            </div>&ndash;%&gt;
        </ul>

        &lt;%&ndash;<div class="collapse navbar-collapse" id="navbarSupportedContent">&ndash;%&gt;


&lt;%&ndash;            <form class="nav-item form-inline">
                <input class="form-control mr-sm-2 serachClass" type="search" placeholder="Search" aria-label="Search"
                       value="${requestScope.serachText}" pattern="[A-Za-z0-9\u4e00-\u9fa5]{2,50}" required id="serachinput">
                <button class="btn btn-outline-success  my-2 my-sm-0" type="button" onclick="serachContent(1)">搜索</button>
            </form>&ndash;%&gt;

&lt;%&ndash;            <form class="form-inline my-2 my-lg-0">
                &nbsp;&nbsp;&nbsp;&nbsp;
                <ul class="navbar-nav mr-auto">
                    <c:if test="${sessionScope.userName == null}">
                        <li class="nav-item">
                            <a class="nav-link" href="login">登录</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="register">注册</a>
                        </li>
                    </c:if>
                    <c:if test="${sessionScope.userName != null}">
                        <li class="nav-item">
                            <a class="nav-link" href="homepage?userId=${sessionScope.userId}">${sessionScope.userName}</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="loginOut">退出</a>
                        </li>
                    </c:if>
                </ul>
            </form>&ndash;%&gt;
        &lt;%&ndash;</div>&ndash;%&gt;
    </div>
</nav>
--%>


<div class="container-fluid" id="lesslength">
    <div style="height: 70px"></div>
    <div style="color: red" id="feedback" hidden="hidden">请输入2-50位字母或数字或中文！</div>
    <div id="showResultCount"></div>
    <%--所有文章--%>
    <div style="height: 20px"></div>

    <%--分页--%>
    <nav aria-label="Page navigation example">
        <ul class="pagination justify-content-center" id="pageContainer">
        </ul>
    </nav>

</div>

<%--<%@include file="footer.jsp" %>--%>

<script>

    $(function () {
        /*页面加载完成就做*/
        serachContent(1);
    });

    /**
     * 点击按钮后检测是满足要求，满足再发ajax.
     * @param obj
     */
    function serachContent(page){

        var inputObj = $("#serachinput");
        var serachText = inputObj.val();

        if(checkResult(serachText)){
            $.ajax({
                type: "GET",
                url: "serach?serachText="+serachText+"&page="+page+"&jumpFlag=no",
                dataType: "json",
                success: function (result) {
                    //alert(result);
                    show(result,inputObj,page);
                }
            });
        }
    }

    function checkResult(serachText){
        if(serachText.length < 2 || serachText.length > 50){
            showErrorTips($("#serachinput"));
            return false;
        }else{
            removeErrorTips($("#serachinput"));
            return true;
        }
    }

    function jumpToDetail(blogId) {
        window.location.href = "blogdetail?blogId="+blogId;
    }

    /**
     * 再页面追加返回结果
     * @param result
     * @param inputObj
     */
    function show(result,inputObj,curentPage) {
        //alert(result.count);
        //alert(result.blogs);
        if(result.count == "error"){
            showErrorTips(inputObj);
        }else{
            $("#showResultCount").siblings(".generated").remove();
            if(result.count >= 1) {
                $("#showResultCount").text("一共有" + result.count + "条结果");
                var generated = $("<div class='generated'></div>");
                $.each(result.blogs, function (name,value) {
                    generated.append($("<div style='height: 8px'></div>"));
                    var cardout = $("<div class='card'></div>");
                    var card = $("<div class='card-body'></div>");
                    card.append($("<div onclick='jumpToDetail(" + value.blogId + ")' class='myLinkTitle'>" + value.blogTitle + "</div>"));
                    card.append($("<hr/>"));
                    card.append($("<div>" + value.blogBriefContent + "</div>"));
                    card.append($("<p class=\"statusInText\">\n" +
                        "                    <span class=\"badge badge-primary\">阅读数：" + value.blogReadTimes + "</span>\n" +
                        "                    <span class=\"badge badge-success\">评论数：" + value.blogCommentTimes + "</span>\n" +
                        "                </p>"));

                    cardout.append(card);
                    generated.append(cardout);
                });
                $("#showResultCount").after(generated);
                showPageNav(result.count,curentPage);
            }else{
                $("#showResultCount").text("社么都没有");
                removePageNav();
            }

        }
    }

    function showErrorTips(inputObj) {

        inputObj.removeClass("is-valid");
        inputObj.addClass("is-invalid");
        //alert(1);
        $("#feedback").removeAttr("hidden");
        $("#feedback").show();
        //alert(2);
    }

    function removeErrorTips(inputObj) {
        inputObj.removeClass("is-invalid");
        inputObj.addClass("is-valid");
        $("#feedback").hide();
    }

    /**没有内容时清空页码
     */
    function removePageNav() {
        $("#pageContainer").empty();
    }

    /**显示页码
     */
    function showPageNav(counts,page) {

        var pageNavOut = $("#pageContainer");
        pageNavOut.empty();
        pageNavOut.append($("<li class=\"page-item mylinkActive\" >\n" +
            "        <a class=\"page-link\" onclick=\"serachContent(1)\">首页</a>\n" +
            "        </li>"));
        if(page > 1){
            pageNavOut.append($("<li class=\"page-item mylinkActive\">\n" +
                "        <a class=\"page-link\" onclick=\"serachContent("+(page-1)+")\">上一页</a>\n" +
                "        </li>"));
        }else{
            pageNavOut.append($("<li class=\"page-item disabled myactive\">\n" +
                "        <a class=\"page-link\" aria-disabled=\"true\">上一页</a>\n" +
                "        </li>"));
        }


        var pages = Math.ceil(counts/10);
        var start = page <= 3 ? 1:page-2;
        var end = page > pages-3 ? pages: page + 2;
        for(var i=start;i<=end;i++){
            if(i == page){
                pageNavOut.append($("<li aria-current=\"page\" class=\"page-item myactive disabled\"><a class=\"page-link myactive\" " +
                    " aria-disabled=\"true\" >"+i+"</a></li>"));
            }else{
                pageNavOut.append($(" <li  class=\"page-item mylinkActive\"><a class=\"page-link\" " +
                    "onclick=\"serachContent("+i+")\">"+i+"</a></li>"));
            }
        }
/*    <nav aria-label="...">
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
            </nav>*/

        if(pages <= page){
            pageNavOut.append($("    <li class=\"page-item disabled myactive\">\n" +
                "        <a class=\"page-link\" >下一页</a>\n" +
                "        </li>"));
        }else{
            pageNavOut.append($("    <li class=\"page-item mylinkActive\">\n" +
                "        <a class=\"page-link mylinkActive\" onclick=\"serachContent("+(page+1)+")\">下一页</a>\n" +
                "        </li>"));
        }

        pageNavOut.append($("<li class=\"page-item mylinkActive\">\n" +
            "        <a class=\"page-link mylinkActive\" onclick=\"serachContent("+pages+")\">末页</a>\n" +
            "        </li>"));
    }
</script>
</body>
</html>


