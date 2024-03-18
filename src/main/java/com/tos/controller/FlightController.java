package com.tos.controller;

import com.github.pagehelper.PageInfo;
import com.tos.pojo.Flight;
import com.tos.pojo.Passenger;
import com.tos.pojo.Ticket;
import com.tos.service.CityService;
import com.tos.service.FlightService;
import com.tos.service.SeatService;
import com.tos.service.TicketService;
import com.tos.util.Constants;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/flight")
public class FlightController {

    @Autowired
    private FlightService flightService;

    @Autowired
    private TicketService ticketService;

    @Autowired
    private SeatService seatService;

    @Autowired
    private CityService cityService;

    @RequestMapping("/toFlightList")
    public String toFlightList(HttpServletRequest request) {
        List<String> cityList = cityService.getCities();
        request.setAttribute("cityList",cityList);
        return "/flightList";
    }

    @RequestMapping("/toFlightQuery")
    public String toFlightQuery(HttpServletRequest request) {
        List<String> cityList = cityService.getCities();
        request.setAttribute("cityList",cityList);
        return "/flightQuery";
    }

    @RequestMapping("/toFlightInsert")
    public String toFlightInsert(HttpServletRequest request) {
        //List<String> cityList = cityService.getCities();
        //request.setAttribute("cityList",cityList);
        return "flightInsert";
    }

    @RequestMapping("/toFlightStatistics")
    public String toFlightStatistics() {
        return "flightStatistics";
    }

    @RequestMapping("/loadCity")
    @ResponseBody
    public List<String> loadCity(HttpServletRequest request) throws ParseException{
        List<String> cityList = cityService.getCities();
        request.getSession().setAttribute("cityList",cityList);
        return cityService.getCities();
    }

    // 多个查询(分页）,由于时间问题，只搞了首页航班查询的分页
    @RequestMapping("/getFlights")
    public String flightPageQuery(@RequestParam(defaultValue="",value = "srcCity") String srcCity, @RequestParam(defaultValue="",value = "dstCity") String dstCity,
                                            @RequestParam(defaultValue="",value = "queryDate") String queryDateStr, @RequestParam(required = false,defaultValue="1",value="pageNum") int pageNum,
                                               @RequestParam(defaultValue="5",value="pageSize") int pageSize, HttpServletRequest request) throws Exception {
        HashMap<String, Object> map = new HashMap<>();
        boolean isManager = false;
        //判断是否是管理员查询航班
        if (request.getSession().getAttribute(Constants.MANAGER_SESSION) != null) {
            isManager = true;
        }
        Date queryDate = null;
        if (!"".equals(queryDateStr) && queryDateStr != null) {
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
            queryDate = simpleDateFormat.parse(queryDateStr);
        }
        map.put("isManager",isManager);
        map.put("srcCity",srcCity);
        map.put("dstCity",dstCity);
        map.put("queryDate",queryDate);
        List<String> cityList = cityService.getCities();
        request.setAttribute("cityList",cityList);
        request.setAttribute("srcCity",srcCity);
        request.setAttribute("dstCity",dstCity);
        request.setAttribute("queryDate",queryDate);
        request.setAttribute("pageInfo",flightService.flightPageQuery(map,pageNum,pageSize));
        if(isManager) {
            return "flightList";
        }
        return "index";
    }

    @RequestMapping("/getFlightsByManager")
    public String getFlights(HttpServletRequest request) throws ParseException {
        HashMap<String, Object> map = new HashMap<>();
        String srcCity = request.getParameter("srcCity");
        String dstCity = request.getParameter("dstCity");
        String queryDateStr = request.getParameter("queryDate");

        //System.out.println("srcCity = " + srcCity);
        //System.out.println("dstCity = " + dstCity);
        //System.out.println("queryDateStr = " + queryDateStr);
        //System.out.println(queryDateStr);
        boolean isManager = false;
        //判断是否是管理员查询航班
        if (request.getSession().getAttribute(Constants.MANAGER_SESSION) != null) {
            isManager = true;
        }
        Date queryDate = null;
        if (!"".equals(queryDateStr) && queryDateStr != null) {
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
            queryDate = simpleDateFormat.parse(queryDateStr);
        }
        map.put("isManager",isManager);
        map.put("srcCity",srcCity);
        map.put("dstCity",dstCity);
        map.put("queryDate",queryDate);
        List<Flight> flightList = flightService.getFlights(map);
        List<String> cityList = cityService.getCities();
        for(Flight flight : flightList) {
            System.out.println(flight);
        }
        request.setAttribute("cityList",cityList);
        request.setAttribute("flightList",flightList);
        request.setAttribute("srcCity",srcCity);
        request.setAttribute("dstCity",dstCity);
        request.setAttribute("queryDate",queryDate);
        if(isManager) {
            return "flightList";
        }
        return "index";
    }



    @RequestMapping("/bookFlight")
    public String bookFlight(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Ticket ticket = new Ticket();
        //生成机票的各种信息
        Passenger passenger = (Passenger) request.getSession().getAttribute(Constants.Passenger_SESSION);
        //if (passenger == null) {
        //    request.setAttribute("error","请登录!");
        //    return "login_reg";
        //}
        String flightId = request.getParameter("flightId");
        String seatType = request.getParameter("seatType");
        //System.out.println(flightId + " " +seatType);
        int flight_id = Integer.parseInt(flightId);
        int seat_type = Integer.parseInt(seatType);
        HashMap<String, Object> map = new HashMap<>();
        map.put("flightId",flight_id);
        map.put("seatType",seat_type);

        String ticketId = UUID.randomUUID().toString().trim().replaceAll("-", "");
        String seatId = seatService.getSeatId(map);
        if(seatId==null||seatId==""){
            request.setAttribute("bookResult","抱歉 已售空");
            return "confirmBook";
        }
        //System.out.println(seatId);
        Flight flight = flightService.getFlight(flight_id);

        long halfHour = 30*60*1000;
        Date boardTime = new Date(flight.getStartTime().getTime() - halfHour);

        //打包
        ticket.setTicketId(ticketId);
        ticket.setFlightId(flight_id);
        ticket.setSeatId(seatId);
        ticket.setDepartureTime(flight.getStartTime());
        ticket.setBoardTime(boardTime);
        ticket.setCardId(passenger.getCardId());

        boolean success = ticketService.bookFlight(ticket);
        if (success) {
            request.setAttribute("bookResult","订票成功!");
        }else {
            request.setAttribute("bookResult","订票失败!");
        }
        //return "passenger";
        //return "ticketQuery";
        //return "order_list";

/*        List<Ticket> ticketList = ticketService.getTickets(passenger.getPassenger_id());
        System.out.println(ticketList.size());
        request.setAttribute("ticketList",ticketList);*/
        List<String> cityList = cityService.getCities();
        request.setAttribute("cityList",cityList);
        return "confirmBook";
    }

    @RequestMapping("/insertFlight")
    public String insertFlight(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
        //System.out.println("执行了FLIGHTINSETSERVLET");

        String airline = req.getParameter("airline");
        String srcAirport = req.getParameter("SrcAirport");
        String dstAirport = req.getParameter("DstAirport");
        String startTimeStr = req.getParameter("startTime");
        String endTimeStr = req.getParameter("endTime");
        String advancedPriceStr = req.getParameter("AdvancedPrice");
        String economicPriceStr = req.getParameter("EconomicPrice");
        String seatNumStr = req.getParameter("seatNum");
        String AdvancedNumStr = req.getParameter("AdvancedNum");
        String sizeStr= req.getParameter("size");

        //System.out.println("srcAirport = " + srcAirport);
        //System.out.println("startTimeStr = " + startTimeStr);
        //System.out.println("endTimeStr = " + endTimeStr);

        float advancedPrice = new Float(advancedPriceStr);
        float economicPrice = new Float(economicPriceStr);
        int seatNum = new Integer(seatNumStr);
        int advancedNum = new Integer(AdvancedNumStr);
        int size = new Integer(sizeStr);
        int economicNum = seatNum-advancedNum;


        Date startTime = null,endTime=null;
        if(startTimeStr!=null&&startTimeStr!=""){
            try {

                startTime = simpleDateFormat.parse(startTimeStr);
            } catch (ParseException e) {
                e.printStackTrace();
            }
        }
        if(endTimeStr!=null&&endTimeStr!=""){
            try {
                endTime = simpleDateFormat.parse(endTimeStr);
            } catch (ParseException e) {
                e.printStackTrace();
            }
        }

        Flight flightBean = new Flight(0,airline,srcAirport,dstAirport,startTime,endTime,advancedPrice,economicPrice,seatNum,0,advancedNum,economicNum,size);
        //System.out.println(flightBean);
        if(flightService.insertFlight(flightBean)){
            //System.out.println("插入成功");
            req.setAttribute("InsertResult","新建航班成功");
        }
        else{
            req.setAttribute("InsertResult","新建航班失败");
        }
        return "flightInsert";
    }

    @RequestMapping("/flightStatistics")
    public String flightStatistics(HttpServletRequest req) {

        HashMap<String, Object> map = new HashMap<>();
        String airline=req.getParameter("airline");
        String srcCity = req.getParameter("srcCity");
        String dstCity = req.getParameter("dstCity");
        int statisticsTime = 0;

        if(req.getParameter("statisticsTime")!=null){
            statisticsTime= new Integer(req.getParameter("statisticsTime"));
        }

        //System.out.println("srcCity = " + srcCity);
        //System.out.println("dstCity = " + dstCity);
        //System.out.println("airline = " + airline);
        //System.out.println("statisticsTime = " + statisticsTime);

        map.put("airline",airline);
        map.put("srcCity",srcCity);
        map.put("dstCity",dstCity);
        map.put("statisticsTime",statisticsTime);
        List<Flight> flightBeans = flightService.flightStatistics(map);


        if(flightBeans.size()>0){
            //System.out.println("有统计数据");
            req.getSession().setAttribute("statisticsFlights",flightBeans);
        }
        else{
            //System.out.println("没有可统计的航班");
            req.setAttribute("statisticsResult","没有可统计的航班");
        }
        return "flightStatistics";
    }
}
