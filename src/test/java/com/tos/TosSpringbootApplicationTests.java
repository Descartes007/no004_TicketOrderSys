package com.tos;



import com.tos.pojo.Bill;
import com.tos.pojo.Passenger;
import com.tos.service.BillService;
import com.tos.service.PassengerService;
import com.tos.service.TicketService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.HashMap;
import java.util.List;

@SpringBootTest
public class TosSpringbootApplicationTests {

    @Autowired
    BillService billService;
    @Autowired
    PassengerService passengerService;
    @Autowired
    TicketService ticketService;

    @Test
    public void contextLoads() {
        HashMap<String, Object> map = new HashMap<>();
        map.put("passengerId","445323200011021530");
        System.out.println(ticketService.getTicketsByPassenger(map));


    }

}

