package com.jkblog.servlet;

import com.jkblog.entity.BlogUser;
import com.jkblog.service.CommonService;
import com.jkblog.service.UserService;
import org.apache.log4j.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;

@WebServlet(name = "UserRegisterServlet",urlPatterns = "/register")
public class UserRegisterServlet extends HttpServlet {
    /*日志打印*/
    private static Logger logger = Logger.getLogger(SerachServlet.class);

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //request.setCharacterEncoding("UTF-8");

        UserService userService = new UserService();
        int status = 0;
        String userName = request.getParameter("userName");
        String userPassword = request.getParameter("userPassword");
        String userGender = request.getParameter("userGender");
        String email = request.getParameter("userEmail");

        if(userName == null || userName.length()< 2 || userName.length()> 50){
            status = 1;
        }
        if(userPassword == null || userPassword.length() < 6 || userPassword.length()> 50){
            status = 1;
        }
        if(userGender == null || (!(userGender.equals("0") || userGender.equals("1") ||userGender.equals("2")))){
            status = 1;
        }
        if(email == null || email.length()<2){
            status = 1;
        }
        if(status == 1){
            CommonService.jumpToError("用户信息有误，请稍后重试",request,response);
        }else{
            BlogUser blogUser = new BlogUser();
            blogUser.setUserName(userName);
            blogUser.setUserPassword(userPassword);
            //blogUser.setUserGender(UserGender.getEnum(userGender));
            blogUser.setUserEmail(email);
            blogUser.setUserCreateTime(new Date());
            blogUser.setUserDescription("还没有写");
            int i = userService.insertUser(blogUser,userGender);

            if( i>= 1){
                response.sendRedirect("login");
            }else{
                CommonService.jumpToError("注册出错了，请稍后再试",request,response);
            }
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        logger.info(this.getClass().getName() + "类调用了doGet方法");
        request.getRequestDispatcher("/WEB-INF/view/userRegister.jsp").forward(request,response);
    }
}
