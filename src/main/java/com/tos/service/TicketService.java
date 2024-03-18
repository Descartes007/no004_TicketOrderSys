package com.tos.service;

import com.tos.pojo.Ticket;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;
import java.util.Map;
@Repository
public interface TicketService {
    /**
     * 旅客订票
     * @param ticket
     * @return
     */
    boolean bookFlight(Ticket ticket);

    /**
     * 根据id和时间返回机票
     * @param cardId
     * @return
     */
    List<Ticket> getTickets(String cardId);

    /**
     * 管理员查询所有机票
     * @return
     */
    List<Ticket> getTicketsByManager();

    /**
     * 根据id和指定条件返回机票
     * @param map
     * @return
     */
    List<Ticket> getTicketsByPassenger(Map<String, Object> map);

    List<Date> getTimes();
    /**
     * 旅客退票
     * @param ticketId
     * @return
     */
    boolean refund(String ticketId);
}
