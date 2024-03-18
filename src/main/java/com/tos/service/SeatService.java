package com.tos.service;

import org.springframework.stereotype.Repository;

import java.util.Map;
@Repository
public interface SeatService {

    /**
     * 返回一个座位
     * @param map
     * @return
     */
    String getSeatId(Map<String, Object> map);
}
