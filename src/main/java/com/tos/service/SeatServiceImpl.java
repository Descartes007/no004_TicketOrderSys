package com.tos.service;

import com.tos.mapper.SeatMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Map;
@Service
public class SeatServiceImpl implements SeatService {
    @Autowired
    private SeatMapper seatMapper;


    @Override
    public synchronized String getSeatId(Map<String, Object> map) {
        return seatMapper.getSeatId(map);
    }
}
