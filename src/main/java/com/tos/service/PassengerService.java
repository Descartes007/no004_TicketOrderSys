package com.tos.service;

import com.tos.pojo.Passenger;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;
@Repository
public interface PassengerService {
    /**
     * 旅客登录
     * @param passengerPhone
     * @param passengerPassword
     * @return Passenger
     */
    Passenger login(String passengerPhone, String passengerPassword);

    /**
     * 旅客注册
     * @param map
     * @return 错误类型
     * 0 成功注册
     * 1 手机号重复
     * 2 id重复
     * 3 数据库错误
     */
    int register(Map<String, Object> map);

    List<Passenger> getPassengers();

    boolean deletePassenger(String passengerPhone);

    boolean updateInfo(Map<String,Object> map);

    boolean updateImg(Map<String,Object> map);

    Passenger getPassengerByPhone(String phone);
}
