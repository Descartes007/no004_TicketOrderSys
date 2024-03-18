package com.tos.service;


import com.tos.mapper.TicketMapper;
import com.tos.pojo.Ticket;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
@Service
public class TicketServiceImpl implements TicketService {
    @Autowired
    private TicketMapper ticketMapper;

    @Override
    public boolean bookFlight(Ticket ticket) {
        return ticketMapper.bookFlight(ticket);
    }

    @Override
    public List<Ticket> getTickets(String cardId) {
        HashMap<String, Object> map = new HashMap<>();
        Date now = new Date(System.currentTimeMillis());
        //System.out.println(passengerId);
        map.put("cardId",cardId);
        map.put("now",now);
        return ticketMapper.getTickets(map);
    }

    @Override
    public List<Ticket> getTicketsByManager() {
        return ticketMapper.getTicketsByManager();
    }

    @Override
    public List<Ticket> getTicketsByPassenger(Map<String, Object> map) {
        return ticketMapper.getTicketsByPassenger(map);
    }


    @Override
    public List<Date> getTimes() {
        return ticketMapper.getTimes();
    }

    @Override
    public  boolean refund(String ticketId) {
        return ticketMapper.refund(ticketId);
    }


}
