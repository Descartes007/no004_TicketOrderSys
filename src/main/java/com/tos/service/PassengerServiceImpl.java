package com.tos.service;


import com.tos.mapper.PassengerMapper;
import com.tos.pojo.Passenger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class PassengerServiceImpl implements PassengerService {
    @Autowired
    private PassengerMapper passengerMapper;

    @Override
    public Passenger login(String passengerPhone, String passengerPassword) {
        Passenger passenger = passengerMapper.getPassenger(passengerPhone);
        if(passenger == null || !passenger.getPassword().equals(passengerPassword)){
            return null;
        }
        return passenger;
    }



    @Override
    public int register(Map<String, Object> map) {
        Passenger passengerByPhone = passengerMapper.getPassenger((String) map.get("phone"));
        Passenger passengerById = passengerMapper.getPassengerById((String) map.get("passengerId"));
        if(passengerByPhone != null) {
            return 1;
        }else if(passengerById != null) {
            return 2;
        }
        Passenger passenger = new Passenger();
        passenger.setCardId((String) map.get("passengerId"));
        passenger.setPhone((String) map.get("phone"));
        passenger.setPassword((String) map.get("password"));
        passenger.setPassengerName((String) map.get("passengerName"));

        if(passengerMapper.register(passenger)) {
            return 0;
        }
        return 3;
    }

    @Override
    public List<Passenger> getPassengers() {
        return passengerMapper.getPassengers();
    }

    @Override
    public boolean deletePassenger(String passengerPhone) {
        return passengerMapper.deletePassenger(passengerPhone);
    }

    @Override
    public boolean updateInfo(Map<String, Object> map) {
        return passengerMapper.updateInfo(map);
    }

    @Override
    public boolean updateImg(Map<String, Object> map) {
        return passengerMapper.updateImg(map);
    }

    @Override
    public Passenger getPassengerByPhone(String phone) {
        return passengerMapper.getPassenger(phone);
    }
}
