package com.jkblog.service;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class CommonService {
    /**
     * 跳转至统一的错误处理页面，提示用户
     * @param errorMsg
     * @param request
     * @param response
     */
    public static void jumpToError(String errorMsg, HttpServletRequest request, HttpServletResponse response){
        request.setAttribute("errorTips",errorMsg);
        try {
            request.getRequestDispatcher("/WEB-INF/view/error.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}
