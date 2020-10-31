package com.jkblog.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "LoginOutServlet",urlPatterns = "/loginOut")
public class LoginOutServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       // logger.info(this.getClass().getName() + "类调用了doGet方法");
        request.getSession().removeAttribute("userName");
        request.getSession().removeAttribute("userId");

        /*cookie不能直接删除，需要用相同路径的cookie覆盖掉*/
        Cookie[] cookies = request.getCookies();
        /*cookie名字一样就行*/
        Cookie cookie = new Cookie("userId","");
        /*路径一定一致*/
        cookie.setPath(request.getContextPath()+"/");
        cookie.setMaxAge(0);
        response.addCookie(cookie);
        response.sendRedirect("index");
    }
}
