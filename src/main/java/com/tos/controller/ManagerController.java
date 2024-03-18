package com.tos.controller;

import com.tos.mapper.CityAirport;
import com.tos.pojo.Manager;
import com.tos.pojo.Passenger;
import com.tos.service.ManagerService;
import com.tos.service.PassengerService;
import com.tos.util.Constants;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/admin")
public class ManagerController {

    @Autowired
    private ManagerService managerService;

    @Autowired
    private PassengerService passengerService;

    @RequestMapping("/toLogin")
    public String toLogin() {
        return "managerLogin";
    }



    @RequestMapping("/toManagerFrame")
    public String toManagerFrame(HttpServletRequest request) {
        //if(request.getSession().getAttribute(Constants.MANAGER_SESSION) == null) {
        //    return "managerLogin";
        //}
        return "managerFrame";
    }

    @RequestMapping("/toWelcomeManager")
    public String toWelcomeManager(HttpServletRequest request) {
        //if(request.getSession().getAttribute(Constants.MANAGER_SESSION) == null) {
        //    return "managerLogin";
        //}
        return "welcomeManager";
    }

    @RequestMapping("/toPassengerList")
    public String toPassengerList(HttpServletRequest request) {
        //if(request.getSession().getAttribute(Constants.MANAGER_SESSION) == null) {
        //    return "managerLogin";
        //}
        List<Passenger> passengerList = passengerService.getPassengers();
        request.setAttribute("passengerList",passengerList);
        return "passengerList";
    }

    @RequestMapping("/login")
    public String managerLogin(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String userName =request.getParameter("userName");
        String password =request.getParameter("password");

        if(password==null){
            request.setAttribute("mess","密码空");
            RequestDispatcher view = request.getRequestDispatcher("/managerLogin.jsp");
            view.forward(request, response);
        }

        //System.out.println("userName="+userName);
        Manager managerbean = managerService.getManager(userName);

        if(managerbean == null){
            request.setAttribute("mess","用户不存在");
            return "managerLogin";
        }

        if(password != null && password.equals(managerbean.getPassword())){
            //保存管理员信息到session
            request.getSession().setAttribute(Constants.MANAGER_SESSION,managerbean);
            //加载城市机场信息
            CityAirport cityAirport = new CityAirport();
            HttpSession session = request.getSession();
            session.setAttribute("cityAirport",cityAirport.loadAirport());
            //System.out.println("机场加载完成");

            //页面跳转
            //request.setAttribute("mess","登录成功");
            return "managerFrame";
        }else{
            request.setAttribute("mess","密码错误，请重新输入");
            return "managerLogin";
        }
    }

    @RequestMapping("/logout")
    public String logout(HttpServletRequest request) {
        request.getSession().setAttribute(Constants.MANAGER_SESSION,null);
        return "index";
    }

    @RequestMapping("/deletePassenger")
    public String deletePassenger(HttpServletRequest request) {
        //System.out.println(request.getParameter("phone"));
        passengerService.deletePassenger(request.getParameter("phone"));
        return "passengerList";
    }

}
