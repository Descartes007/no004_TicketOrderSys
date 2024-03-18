package com.tos.controller;

import com.tos.service.CityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/home")
public class IndexController {

    @Autowired
    private CityService cityService;

    @RequestMapping("/toIndex")
    public String toIndex(HttpServletRequest request){
        List<String> cityList = cityService.getCities();
        request.setAttribute("cityList",cityList);
        return "index";
    }


}
