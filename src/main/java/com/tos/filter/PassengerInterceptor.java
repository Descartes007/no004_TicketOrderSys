package com.tos.filter;


import com.tos.pojo.Manager;
import com.tos.pojo.Passenger;
import com.tos.util.Constants;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@Component
public class PassengerInterceptor extends LoginInterceptor {
    public PassengerInterceptor() {
        whiteList.add("/");
        whiteList.add("/flight/loadCity");
        whiteList.add("/passenger/toLogin");
        whiteList.add("/admin/toLogin");
        whiteList.add("/passenger/login");
        whiteList.add("/passenger/register");
        whiteList.add("/admin/login");

        //需要把管理员相关的页面放行
        whiteList.add("/flight/toFlightList");
        whiteList.add("/flight/toFlightInsert");
        whiteList.add("/flight/toFlightStatistics");
        whiteList.add("/flight/getFlightsByManager");
        whiteList.add("/flight/insertFlight");
        whiteList.add("/flight/flightStatistics");

        whiteList.add("/ticket/toTicketList");

        whiteList.add("/admin/toManagerFrame");
        whiteList.add("/admin/toWelcomeManager");
        whiteList.add("/admin/toPassengerList");
        whiteList.add("/admin/logout");
        whiteList.add("/admin/deletePassenger");

    }
    @Override
    protected Object getLoginObject(HttpSession session) {
        return session.getAttribute(Constants.Passenger_SESSION);
    }

    @Override
    protected String getRedirectPath(HttpServletRequest request) {
        return request.getContextPath()+"/passenger/toLogin";
    }

}
