package com.tos.filter;

import com.tos.util.Constants;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class ManagerInterceptor extends LoginInterceptor{
    public ManagerInterceptor() {
        whiteList.add("/");
        whiteList.add("/flight/loadCity");
        whiteList.add("flight/flightStatistics");
        whiteList.add("/admin/toLogin");
        whiteList.add("/passenger/toLogin");
        whiteList.add("/passenger/login");
        whiteList.add("/admin/login");

        //需要把旅客相关的页面放行
        whiteList.add("/bill/toBillPage");
        whiteList.add("/bill/getBills");
        whiteList.add("/bill/deleteBill");
        whiteList.add("/bill/downloadBill");

        whiteList.add("/flight/bookFlight");

        whiteList.add("/note/toNotePage");
        whiteList.add("/note/getNotes");
        whiteList.add("/note/deleteNote");
        whiteList.add("/note/downloadNote");
        whiteList.add("/passenger/toRegister");
        whiteList.add("/passenger/toPassengerCenter");
        whiteList.add("/passenger/toPassengerInfo");
        whiteList.add("/passenger/toEditInfo");
        whiteList.add("/passenger/logout");
        whiteList.add("/passenger/register");
        whiteList.add("/passenger/uploadImg");
        whiteList.add("/passenger/updateInfo");

        whiteList.add("/ticket/toConfirmBook");
        whiteList.add("/ticket/toTicketPage");
        whiteList.add("/ticket/getTickets");
        whiteList.add("/ticket/refund");
    }
    @Override
    protected Object getLoginObject(HttpSession session) {
        return session.getAttribute(Constants.MANAGER_SESSION);
    }

    @Override
    protected String getRedirectPath(HttpServletRequest request) {
        return request.getContextPath()+"/admin/toLogin";
    }
}
