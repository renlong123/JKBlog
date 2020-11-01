package com.jkblog.servlet;

import com.jkblog.entity.BlogUser;
import com.jkblog.service.BlogService;
import com.jkblog.service.CommonService;
import com.jkblog.service.UserService;
import org.apache.log4j.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

@WebServlet(name = "UserInfoServlet",urlPatterns = "/userinfo")
public class UserInfoServlet extends HttpServlet {
    /*日志打印*/
    private static Logger logger = Logger.getLogger(SerachServlet.class);

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Integer userId = (Integer)request.getSession().getAttribute("userId");
        String userName = request.getParameter("userName");
        String userPassword = request.getParameter("userPassword");
        String userEmail = request.getParameter("userEmail");
        String userBirthDay = request.getParameter("userBirthDay");
        String userGender = request.getParameter("userGender");
        String userDescription = request.getParameter("userDescription");

        BlogUser user = new BlogUser();
        user.setUserId(userId);
        user.setUserName(userName);
        user.setUserPassword(userPassword);
        user.setUserEmail(userEmail);
        user.setUserDescription(userDescription);
        try {
            user.setUserBirthDay(new SimpleDateFormat("yyyy-MM-dd").parse(userBirthDay));
        } catch (ParseException e) {
            e.printStackTrace();
        }

        int i = new UserService().updateUser(user, userGender);

        if(i >= 1){
            response.sendRedirect("homepage");
        }else{
            CommonService.jumpToError("更新出错了",request,response);
        }
    }

    /**
     * 当进入编辑页面时用get请求
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Integer userId = (Integer)request.getSession().getAttribute("userId");

        if(userId == null || userId.equals("")){
            response.sendRedirect("login");
        }else{
            BlogUser user = new BlogService().getUser(userId);
            if(user == null){
                response.sendRedirect("login");
            }else{
                request.setAttribute("user",user);
                request.getRequestDispatcher("/WEB-INF/view/userInfoEdit.jsp").forward(request,response);
            }
        }
    }
}
