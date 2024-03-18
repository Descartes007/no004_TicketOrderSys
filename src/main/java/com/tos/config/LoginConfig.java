package com.tos.config;

import com.tos.filter.ManagerInterceptor;
import com.tos.filter.PassengerInterceptor;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import java.util.ArrayList;
import java.util.List;

@Configuration
public class LoginConfig implements WebMvcConfigurer {

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        //注册Interceptor拦截器
        InterceptorRegistration PassengerRegi = registry.addInterceptor(new PassengerInterceptor());
        InterceptorRegistration ManagerRegi = registry.addInterceptor(new ManagerInterceptor());
        List<String> excludeList = new ArrayList<>();
        //当被任意一个拦截器拦截后，默认拦截所有的页面，需要自定义放行的页面
        excludeList.add("/home/toIndex");
        excludeList.add("/flight/toFlightList");
        excludeList.add("/flight/toFlightQuery");
        excludeList.add("/flight/getFlights");
        //html静态资源
        excludeList.add("/**/*.html");
        //js静态资源
        excludeList.add("/**/*.js");
        //css静态资源
        excludeList.add( "/**/*.css" );
        //img
        excludeList.add("/**/*.jpg");
        excludeList.add("/**/*.jpeg");
        excludeList.add("/**/*.png");
        //所有路径都被拦截
        PassengerRegi.addPathPatterns("/**");
        ManagerRegi.addPathPatterns("/**");
        //添加不拦截路径
        PassengerRegi.excludePathPatterns(excludeList);
        ManagerRegi.excludePathPatterns(excludeList);

    }
}

