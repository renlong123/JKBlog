package com.jkblog.servlet;

import com.google.gson.Gson;
import com.jkblog.utils.ImageUpload;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.log4j.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.*;

@WebServlet(name = "ImageServlet",urlPatterns = "/image")
public class ImageServlet extends HttpServlet {

    private static final Logger logger = Logger.getLogger(ImageServlet.class);

    public static String filename = null;

    /*虚拟路径的映射*/
    public static final String localUrl;
    public static final String mappedUrl;

    static {
        Properties properties = new Properties();
        InputStream inputStream = ImageServlet.class.getClassLoader().getResourceAsStream("path.properties");
        try {
            properties.load(inputStream);
        } catch (IOException e) {
            e.printStackTrace();
        }
        localUrl = properties.getProperty("localurl");
        mappedUrl = properties.getProperty("mappedurl");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //request.setCharacterEncoding("UTF-8");

        DiskFileItemFactory factory = new DiskFileItemFactory();
        ServletFileUpload upload = new ServletFileUpload(factory);

        ImageUpload imageUpload = new ImageUpload();
        List<String> picUrl = new ArrayList<>();

        List items = null;
        try {
            items = upload.parseRequest(request);
        } catch (FileUploadException e) {
            e.printStackTrace();
        }
        Iterator iter = items.iterator();
        while(iter.hasNext()){
            FileItem item = (FileItem) iter.next();
            /*必须为非普通表单数据*/
            if(!item.isFormField()){
                logger.info("获取到文件名："+item.getName());

                String originalName = item.getName();
                String[] lists = originalName.split("\\.");

                //新名字
                String newName = UUID.randomUUID()+"."+lists[lists.length-1];
                logger.info("新名字为："+newName);

                filename = System.currentTimeMillis() + ".jpg";

                File localUrlAddr = new File(localUrl+"/"+lists[lists.length-1]);
                if(!localUrlAddr.exists()){
                    localUrlAddr.mkdirs();
                }
                String finalUrl = localUrlAddr +"/"+newName;
                String fianlMappedUrl = mappedUrl + "/"+lists[lists.length-1]+"/"+newName;

                InputStream is = item.getInputStream();
                FileOutputStream fos = new FileOutputStream(finalUrl);

                byte[] b = new byte[1024];
                int length = 0;
                while (-1 != (length = is.read(b))) {
                    fos.write(b, 0, length);
                }

                fos.flush();
                fos.close();
                imageUpload.setErrno(0);
                picUrl.add(fianlMappedUrl);
            }
        }

        imageUpload.setData(picUrl);
        Gson gson = new Gson();
        String json = gson.toJson(imageUpload);
        response.getWriter().write(json);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
