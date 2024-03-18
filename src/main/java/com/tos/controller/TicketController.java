package com.tos.controller;

import com.alibaba.fastjson.JSONArray;
import com.tos.pojo.Flight;
import com.tos.pojo.Passenger;
import com.tos.pojo.Ticket;
import com.tos.service.CityService;
import com.tos.service.FlightService;
import com.tos.service.TicketService;
import com.tos.util.Constants;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

@Controller
@RequestMapping("/ticket")
public class TicketController {
    @Autowired
    private TicketService ticketService;

    @Autowired
    private FlightService flightService;

    @Autowired
    private CityService cityService;

    @RequestMapping("/toConfirmBook")

    public String toConfirmBook(HttpServletRequest request) {
        //if(request.getSession().getAttribute(Constants.Passenger_SESSION) == null) {
        //    request.setAttribute("error","请登录!");
        //    return "login_reg";
        //}
        int flight_id=Integer.parseInt(request.getParameter("flightId"));
        Flight flight = flightService.getFlight(flight_id);
        request.getSession().setAttribute("flight",flight);
        int seatType = Integer.parseInt(request.getParameter("seatType"));
        String Type=null;
        float price=0;
        if(seatType==1){
            Type="头等舱";
            price=flight.getAdvancedPrice();
        }
        else{
            Type="经济舱";
            price=flight.getEconomicPrice();
        }
        request.getSession().setAttribute("Type",Type);
        request.getSession().setAttribute("price",price);
        request.getSession().setAttribute("seatType",seatType);
        return "confirmBook";
    }

    @RequestMapping("/toTicketList")
    public String toTicketList(HttpServletRequest request) {
        List<Ticket> ticketList = ticketService.getTicketsByManager();
        request.setAttribute("ticketList",ticketList);
        return "ticketList";
    }

    @RequestMapping("/toTicketPage")
    public String toTicketPage(HttpServletRequest request) {
/*        Passenger passenger = (Passenger) request.getSession().getAttribute(Constants.Passenger_SESSION);
        if (passenger == null) {
            return "login_reg";
        }
        List<Ticket> ticketList = ticketService.getTickets(passenger.getPassenger_id());
        request.setAttribute("ticketList",ticketList);*/
        return "ticketPage";
    }

    @RequestMapping("/getTickets")
    public String getTicketsByPassenger(HttpServletRequest request) throws ParseException {
        HashMap<String, Object> map = new HashMap<>();
        String srcCity = request.getParameter("srcCity");
        String dstCity = request.getParameter("dstCity");
        String queryDateStr = request.getParameter("queryDate");
        Passenger passenger = (Passenger) request.getSession().getAttribute(Constants.Passenger_SESSION);
        String cardId = passenger.getCardId();

        Date queryDate = null;
        if (!queryDateStr.equals("")) {
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
            queryDate = simpleDateFormat.parse(queryDateStr);
            //System.out.println(queryDate);
        }

        map.put("cardId",cardId);
        map.put("srcCity",srcCity);
        map.put("dstCity",dstCity);
        map.put("queryDate",queryDateStr);
        List<Ticket> ticketList = ticketService.getTicketsByPassenger(map);
        //System.out.println(ticketList.get(0));
        //System.out.println(ticketList.size());
        List<String> cityList = cityService.getCities();

        request.setAttribute("cityList",cityList);
        request.setAttribute("ticketList",ticketList);
        request.setAttribute("srcCity",srcCity);
        request.setAttribute("dstCity",dstCity);
        request.setAttribute("queryDate",queryDate);

        //return "ticketQuery";
        return "ticketPage";
    }

    @RequestMapping("/refund")
    public void refund(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String ticketId = request.getParameter("ticketId");
        HashMap<String, String> resultMap = new HashMap<>();
        //System.out.println(ticketId);
        if(ticketService.refund(ticketId)){
            resultMap.put("result", "true");
        }else{
            resultMap.put("result", "false");
        }

        //把resultMap转换成json对象输出
        response.setContentType("application/json");
        PrintWriter outPrintWriter = response.getWriter();
        outPrintWriter.write(JSONArray.toJSONString(resultMap));
        outPrintWriter.flush();
        outPrintWriter.close();
    }
}
