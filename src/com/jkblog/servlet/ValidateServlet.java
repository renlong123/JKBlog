package com.jkblog.servlet;

import com.jkblog.entity.BlogUser;
import com.jkblog.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ValidateServlet",urlPatterns = "/namevalidate")
public class ValidateServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String userName1 = (String)request.getSession().getAttribute("userName");
        String userName = request.getParameter("userName");
        if(userName != null && userName.equals(userName1)){
            response.getWriter().write("yes");
        }else{
            UserService userService = new UserService();
            BlogUser name = userService.getUserByName(userName);
            if( name==null || name.getUserId()==null || name.getUserId() == 0){
                response.getWriter().write("yes");
            }else {
                response.getWriter().write("no");
            }
        }
    }
}
