package com.tos.service;

import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface CityService {
    List<String> getCities();
}
