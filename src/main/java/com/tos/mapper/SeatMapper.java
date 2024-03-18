package com.tos.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.Map;
@Mapper
public interface SeatMapper {

    /**
     * 根据flightId和seatType返回一个座位
     * @param map
     * @return
     */
    String getSeatId(Map<String, Object> map);
}
