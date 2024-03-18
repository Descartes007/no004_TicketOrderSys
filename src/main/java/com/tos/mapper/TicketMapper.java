package com.tos.mapper;

import com.tos.pojo.Ticket;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;
import java.util.Map;
@Mapper
public interface TicketMapper {
    /**
     * 旅客订票
     * @param ticket
     * @return 订票结果
     */
    boolean bookFlight(Ticket ticket);
    /**
     * 根据旅客id和时间获取所有的机票(除了过期的)
     * @return
     */
    List<Ticket> getTickets(Map<String, Object> map);

    /**
     * 管理员根据多个条件查询机票
     * @return
     */
    List<Ticket> getTicketsByManager();

    /**
     * 根据旅客id和多个条件查询机票
     * @param map
     * @return
     */
    List<Ticket> getTicketsByPassenger(Map<String, Object> map);

    List<Date> getTimes();
    /**
     * 旅客退票，退哪张票?
     * @param ticketId
     * @return 退票结果
     */
    boolean refund(String ticketId);
}
