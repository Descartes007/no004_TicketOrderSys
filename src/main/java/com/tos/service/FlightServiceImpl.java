package com.tos.service;


import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.tos.mapper.FlightMapper;
import com.tos.pojo.Flight;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
@Service
public class FlightServiceImpl implements FlightService{
    @Autowired
    private FlightMapper flightMapper;

    @Override
    public Flight getFlight(int flightId) {
        return flightMapper.getFlight(flightId);
    }

    @Override
    public List<Flight> getFlights(Map<String, Object> map) {
        return flightMapper.getFlights(map);
    }

    @Override
    public PageInfo<Flight> flightPageQuery(Map<String, Object> map, int pageNum, int pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<Flight> list = flightMapper.getFlights(map);
        PageInfo<Flight> result = new PageInfo<>(list);
        //System.out.println(result.getPageSize());
        return result;
    }

    @Override
    public boolean insertFlight(Flight flight) {
        return flightMapper.addFlight(flight);
    }

    @Override
    public List<Flight> flightStatistics(Map<String, Object> map) {
        return flightMapper.flightStatistics(map);
    }


}
