package com.tos.mapper;

import com.tos.pojo.Flight;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;
@Mapper
public interface FlightMapper {
    /**
     * 根据id获取航班
     * @param flightId
     * @return
     */
    Flight getFlight(int flightId);

    /**
     * 获取符合条件的航班
     * @param map
     * @return
     */
    List<Flight> getFlights(Map<String, Object> map);


    /**
     * 增加航班
     * @param flight
     * @return
     */
    boolean addFlight(Flight flight);

    /**
     * 统计航班信息
     * @param map
     * @return
     */
    List<Flight> flightStatistics(Map<String, Object> map);
}
