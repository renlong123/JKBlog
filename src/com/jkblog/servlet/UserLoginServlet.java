package com.jkblog.servlet;

import com.jkblog.entity.BlogUser;
import com.jkblog.service.UserService;
import org.apache.log4j.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "UserLoginServlet",urlPatterns = "/login")
public class UserLoginServlet extends HttpServlet {

    /*日志打印*/
    private static Logger logger = Logger.getLogger(BlogListServlet.class);

    /**
     * 登录请求
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String rememberMe = request.getParameter("rememberMe");
        String userName = request.getParameter("userName");
        String password = request.getParameter("userPassword");

        logger.info(userName+"======="+password);

        if(userName != null && !userName.equals("")){
            UserService userService = new UserService();
            BlogUser user = userService.getUserByName(userName);
            if(user != null && user.getUserPassword().equals(password)){
                logger.info("登录成功");
                request.getSession().setAttribute("userName",userName);
                request.getSession().setAttribute("userId",user.getUserId());

                if(rememberMe != null && rememberMe.equals("rememberMe")){
                    /*返回cookie所有路径都用，*/
                    Cookie cookie = new Cookie("userId",user.getUserId().toString());
                    cookie.setMaxAge(7*24*60*60);
                    cookie.setPath(request.getContextPath()+"/");
                    response.addCookie(cookie);
                }
                response.sendRedirect("index");
            }else{
                request.setAttribute("loginTips","用户名不存在或与密码不匹配");
                request.getRequestDispatcher("/WEB-INF/view/userLogin.jsp").forward(request,response);
            }
        }else{
            request.setAttribute("loginTips","用户名不合法");
            request.getRequestDispatcher("/WEB-INF/view/userLogin.jsp").forward(request,response);
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        logger.info(this.getClass().getName() + "类调用了doGet方法");
        request.getRequestDispatcher("/WEB-INF/view/userLogin.jsp").forward(request,response);
    }
}
