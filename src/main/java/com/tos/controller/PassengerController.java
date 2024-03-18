package com.tos.controller;


import cn.hutool.core.io.FileUtil;
import com.tos.pojo.Passenger;
import com.tos.service.CityService;
import com.tos.service.PassengerService;
import com.tos.util.Constants;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;

@CrossOrigin
@Controller
@RequestMapping("/passenger")
public class PassengerController {
    @Autowired
    private PassengerService passengerService;

    @Autowired
    private CityService cityService;

    @RequestMapping("/toLogin")
    public String toLogin(){
        return "login_reg";
    }

    @RequestMapping("/toRegister")
    public String toRegister(){
        return "/WEB-INF/oldJsp/register.jsp";
    }

    @RequestMapping("/toPassengerCenter")
    public String toPassengerCenter(HttpServletRequest request) {
        //if(request.getSession().getAttribute(Constants.Passenger_SESSION) == null) {
        //    return "login_reg";
        //}
        List<String> cityList = cityService.getCities();
        request.setAttribute("cityList",cityList);
        return "passengerCenter";
    }

    @RequestMapping("/toPassengerInfo")
    public String toPassengerInfo(HttpServletRequest request) {
        //if(request.getSession().getAttribute(Constants.Passenger_SESSION) == null) {
        //    return "login_reg";
        //}
        return "passenger_info";
    }

    @RequestMapping("/toEditInfo")
    public String toEditInfo(HttpServletRequest request) {
        Passenger passenger = (Passenger) request.getSession().getAttribute(Constants.Passenger_SESSION);
        //if(passenger == null) {
        //    return "login_reg";
        //}
        request.setAttribute("passengerInfo",passenger);
        return "editInfoPage";
    }

    @RequestMapping("/login")
    public String login(HttpServletRequest request, String phone, String password, Model model) {
        //System.out.println("phone = " + phone);
        Passenger passenger = passengerService.login(phone,password);
        //System.out.println("password = " + password);
        if (passenger == null) {
            model.addAttribute("error","账号或者密码错误!");
            return "login_reg";
        }
        request.getSession().setAttribute(Constants.Passenger_SESSION,passenger);
        //return "passenger";
        //return "passengerCenter";
        return "index";
    }
    @RequestMapping("/logout")
    public String logout(HttpServletRequest request) {
        request.getSession().setAttribute(Constants.Passenger_SESSION,null);
        return "index";
    }

    @RequestMapping("/register")
    public String register(HttpServletRequest request, HttpServletResponse response,String phone, String password,String passengerName,String passengerId,String password2) throws Exception {
//     //   HashMap<String, Object> map = getPassengerFromReq(request);
        HashMap<String, Object> map = new HashMap<>();
        map.put("phone",phone);
        map.put("password",password);
        map.put("password1",password2);
        map.put("passengerName",passengerName);
        map.put("passengerId",passengerId);
        int result = passengerService.register(map);
        PrintWriter out = response.getWriter();
        if (result == 0) {
            out.println("alert('注册成功!');");
            return "login_reg";
        }else if(result == 1){
            request.setAttribute("error","注册失败!用户名已存在!");
        }else if(result == 2) {
            request.setAttribute("error","注册失败!身份证已存在!");
        }else {
            request.setAttribute("error","注册失败!数据库错误!");
        }
        request.setAttribute("passengerId",map.get("passengerId"));
        request.setAttribute("passengerName",map.get("passengerName"));
        request.setAttribute("phone",map.get("phone"));
        request.setAttribute("password",map.get("password"));
        return "login_reg";

    }

    //Ajax实时修改头像
    @RequestMapping("/uploadImg")
    @ResponseBody
    public String uploadImg(@RequestParam( value="files",required=false) MultipartFile fileList, HttpServletResponse response, HttpServletRequest request) throws IOException {
        //项目中保存文件的文件夹的绝对路径
        String absolutepath = request.getServletContext().getRealPath("upload");
        String picname = new String(fileList.getOriginalFilename().getBytes("ISO-8859-1"), "UTF-8");
        //获取文件格式
        String ext = picname.substring(picname.lastIndexOf("."));
        //随机生成文件名
        String end_filename = UUID.randomUUID().toString() + ext;
        //获取项目根目录地址
        String rootFilePath = absolutepath + "/" + end_filename;
        //将文件写入对应地址中的文件夹
        FileUtil.writeBytes(fileList.getBytes(), rootFilePath);
        //同步更新数据库
        HashMap<String, Object> map = new HashMap<>();
        map.put("phone",((Passenger) request.getSession().getAttribute(Constants.Passenger_SESSION)).getPhone());
        map.put("avatarImg",end_filename);
        passengerService.updateImg(map);
        //同步更新session
        Passenger passenger = (Passenger) request.getSession().getAttribute(Constants.Passenger_SESSION);
        passenger.setAvatarImg(end_filename);
        request.getSession().setAttribute(Constants.Passenger_SESSION,passenger);
        return end_filename;
    }

    @RequestMapping("/updateInfo")
    public String updateInfo(HttpServletRequest request,HttpServletResponse response) throws Exception {
        HashMap<String, Object> map = getPassengerFromReq(request);
        //更新数据库用户信息
        boolean success = passengerService.updateInfo(map);
        //返回结果
        PrintWriter out = response.getWriter();
        response.setContentType("text/html;charset=utf-8");
        if(!success){
            out.println("修改失败！");
            return "editInfoPage";
        }
        //更新session用户信息
        request.getSession().setAttribute(Constants.Passenger_SESSION,passengerService.getPassengerByPhone((String) map.get("phone")));
        return "passenger_info";
    }

    //表单修改头像，有缺陷，不可以修改其他信息，并且不能实时显示
/*    public String updateInfo(HttpServletRequest request,HttpServletResponse response) throws Exception {
        //由于是文件上传的表单，所以其他的参数是无法获取到的！只能通过session
        HashMap<String, Object> map = getPassengerFromReq(request);
        //文件标志
        //使用Apache Commons FileUpload组件上传文件时总是返回null，调试发现ServletFileUpload对象为空，
        //在Spring Boot中有默认的文件上传组件，在使用ServletFileUpload时需要关闭Spring Boot的默认配置 ，禁用MultipartResolverSpring提供的默认值
        boolean flag = ServletFileUpload.isMultipartContent(request);
        //String phone = ((Passenger)request.getSession().getAttribute(Constants.Passenger_SESSION)).getPhone();
        //如果是文件上传操作，则进入if处理
        if (flag) {
            DiskFileItemFactory factory = new DiskFileItemFactory();
            ServletFileUpload upload = new ServletFileUpload(factory);
            List<FileItem> fileList = upload.parseRequest(request);
            Iterator<FileItem> myitor = fileList.iterator();
            //先保存文件到web应用程序的upload目录
            while (myitor.hasNext()) {
                FileItem item = myitor.next();
                if (item != null) {
                    String filename = item.getName();
                    if (filename != null) {
                        String path = "upload";
                        //项目中保存文件的文件夹的绝对路径
                        String absolutepath = request.getServletContext().getRealPath(path);
                        File file = new File(filename);
                        String file_name = file.getName();
                        //如果没有头像文件上传，则跳过
                        if(file_name.lastIndexOf(".") <= 0) {
                            continue;
                        }
                        //获取文件格式
                        String ext = file_name.substring(file_name.lastIndexOf("."));
                        //随机生成文件名
                        String end_filename = UUID.randomUUID().toString() + ext;
                        File uploadFile = new File(absolutepath, end_filename);
                        //如果文件名存在，则删除并替换
                        if (uploadFile.exists()) {
                            uploadFile.delete();
                        }
                        //保存文件
                        item.write(uploadFile);
                        //在数据库保存文件名
                        map.put("end_filename", end_filename);
                    }
                }
            }
            boolean success = passengerService.updateInfo(map);
            //返回结果
            PrintWriter out = response.getWriter();
            response.setContentType("text/html;charset=utf-8");
            if(!success){
                out.println("修改失败！");
                return "editInfoPage";
            }
        }
        //return toEditInfo(request);
        return "passenger_info";
    }*/

    private HashMap<String,Object> getPassengerFromReq(HttpServletRequest request) {
        Passenger passenger = (Passenger) request.getSession().getAttribute(Constants.Passenger_SESSION);
        HashMap<String,Object> map = new HashMap<>();
        map.put("passengerId",passenger.getPassengerId());
        map.put("cardId",request.getParameter("cardId"));
        map.put("passengerName",request.getParameter("passengerName"));
        map.put("phone",request.getParameter("phone"));
        map.put("password",request.getParameter("password"));
        //map.put("avatarImg",request.getParameter("avatarImg"));
        map.put("nickName",request.getParameter("nickName"));
        map.put("city",request.getParameter("city"));
        map.put("email",request.getParameter("email"));
        map.put("wechat",request.getParameter("wechat"));
        return map;
    }




}
