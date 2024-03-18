package com.tos.service;

import com.tos.mapper.CityMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class CityServiceImpl implements CityService{
    @Autowired
    private CityMapper cityMapper;


    @Override
    public List<String> getCities() {
        return cityMapper.getCities();
    }
}
