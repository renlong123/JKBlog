package com.jkblog.servlet;

import com.google.gson.Gson;
import com.jkblog.dao.JDBCDAO;
import com.jkblog.service.UserService;
import com.jkblog.utils.ImageUpload;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

@WebServlet(name = "HeaderPicServlet",urlPatterns = "/headerpic")
public class HeaderPicServlet extends HttpServlet {

    UserService userService = new UserService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        DiskFileItemFactory factory = new DiskFileItemFactory();
        ServletFileUpload upload = new ServletFileUpload(factory);

        List items = null;
        try {
            items = upload.parseRequest(request);
        } catch (FileUploadException e) {
            e.printStackTrace();
        }
        Iterator iter = items.iterator();
        if (iter.hasNext()) {
            FileItem item = (FileItem) iter.next();
            /*必须为非普通表单数据*/
            if (!item.isFormField()) {
                InputStream is = item.getInputStream();
                Integer userId = (Integer)request.getSession().getAttribute("userId");
                int i = JDBCDAO.saveUserHeaderPic(userId, is);

                if(i>=1){
                    Gson gson = new Gson();
                    response.getWriter().write(gson.toJson("success"));
                }
            }
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Integer userId = Integer.parseInt(request.getParameter("userId"));

        JDBCDAO.getUserHeaderPic(userId,response);

    }
}
