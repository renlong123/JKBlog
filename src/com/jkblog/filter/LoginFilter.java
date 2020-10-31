package com.jkblog.filter;

import com.jkblog.service.UserService;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebFilter(filterName = "Filter2_LoginFilter",urlPatterns = "/*")
public class LoginFilter implements Filter {

    private String[] excludedPathNoLogin = {"/blogedit","/loginOut","/blogdelete","/userinfo"};
    private String[] excludedPathLogined = {"/register","/login"};
    private String[] excludedPathCookie = {"/resources"};

    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {

        boolean isLogined = false;
        HttpServletRequest request = (HttpServletRequest) req;

        /*指定当前页面是否拦截*/
        boolean needFilter = true;
        String servletPath = request.getServletPath();
        for(String path: excludedPathCookie){
            if(servletPath.equals(path)){
                needFilter = false;
                break;
            }
        }

        System.out.println("LoginFilter执行了========"+ servletPath);

        /**/
        if(needFilter) {
            Integer userId = (Integer) request.getSession().getAttribute("userId");

            /*当session中没有用户时，查看当前cookie是否有登录信息*/
            if (userId == null || userId.equals("")) {
                Cookie[] cookies = request.getCookies();
                if(cookies!=null) {
                    for (Cookie cookie : cookies) {
                        if ("userId".equals(cookie.getName())) {
                            System.out.println(cookie.getPath());
                            String value = cookie.getValue();
                            Integer userIdCookie = Integer.parseInt(value);
                            if (userIdCookie == null || userIdCookie.equals("")) {
                                /*把无用的cookie删了*/
                                deleteCookie(request, (HttpServletResponse) resp);
                            } else {
                                String userNameByUserId = new UserService().getUserNameByUserId(userIdCookie);
                                if (userNameByUserId == null || userNameByUserId.equals("")) {
                                    /*把无用的cookie删了*/
                                    deleteCookie(request, (HttpServletResponse) resp);
                                } else {
                                    request.getSession().setAttribute("userId", userIdCookie);
                                    request.getSession().setAttribute("userName", userNameByUserId);
                                    isLogined = true;
                                }
                            }
                        }
                    }
                }
            } else {
                isLogined = true;
            }

            if (!isLogined) {
                System.out.println("未登录，已拦截");

                boolean targetPath = false;
                for (String path : excludedPathNoLogin) {
                    if (servletPath.equals(path)) {
                        targetPath = true;
                        break;
                    }
                }
                /*没登录后就不能访问指定界面*/
                if (targetPath == true) {
                    ((HttpServletResponse) resp).sendRedirect("login");
                } else {
                    chain.doFilter(req, resp);
                }
            } else {
                System.out.println("已登录，已拦截");
                boolean targetPath = false;
                for (String path : excludedPathLogined) {
                    if (servletPath.equals(path)) {
                        targetPath = true;
                        break;
                    }
                }
                /*登录后就不用再进入登录及注册界面了*/
                if (targetPath == true) {
                    ((HttpServletResponse) resp).sendRedirect("homepage");
                } else {
                    chain.doFilter(req, resp);
                }
            }
        }else{
            System.out.println("LoginFilter静态资源直接放行========");
            chain.doFilter(req, resp);
        }
    }

    public void init(FilterConfig config) throws ServletException {

    }

    public void deleteCookie(HttpServletRequest request,HttpServletResponse response){
        /*cookie不能直接删除，需要用相同路径的cookie覆盖掉*/
        /*cookie名字一样就行*/
        Cookie cookie = new Cookie("userId","");
        /*路径一定一致*/
        cookie.setPath(request.getContextPath()+"/");
        cookie.setMaxAge(0);
        response.addCookie(cookie);
    }

}
