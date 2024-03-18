package com.tos.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.tos.pojo.Flight;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;
@Repository
public interface FlightService {
    /**
     * 获取航班
     * @param flightId
     * @return
     */
    Flight getFlight(int flightId);

    /**
     * 获取指定条件的航班
     * @param map
     * @return
     */
    List<Flight> getFlights(Map<String, Object> map);

    /**
     * 分页查询航班
     * @param map
     * @param pageNum
     * @param pageSize
     * @return
     */
    PageInfo<Flight> flightPageQuery(Map<String, Object> map, int pageNum, int pageSize);

    /**
     * 新增航班
     * @param flight
     * @return
     */
    boolean insertFlight(Flight flight);


    /**
     * 返回航班信息
     * @param map
     * @return
     */
    List<Flight> flightStatistics(Map<String, Object> map);
}
