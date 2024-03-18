package com.tos;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan("com.tos.mapper")
public class TosSpringbootApplication {

    public static void main(String[] args) {
        SpringApplication.run(TosSpringbootApplication.class, args);
    }

}
