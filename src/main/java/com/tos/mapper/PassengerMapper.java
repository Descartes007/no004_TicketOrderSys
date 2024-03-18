package com.tos.mapper;

import com.tos.pojo.Passenger;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;
@Mapper
public interface PassengerMapper {

    /**
     * 从passenger表获取用户信息，登录、注册验证
     * @param passengerPhone
     * @return
     */
    Passenger getPassenger(String passengerPhone);

    /**
     * 根据身份证号获取用户
     * @param cardId
     * @return
     */
    Passenger getPassengerById(String cardId);

    /**
     * 管理员获取用户列表
     * @return
     */
    List<Passenger> getPassengers();

    /**
     * 删除指定用户
     * @param passengerPhone
     * @return
     */
    boolean deletePassenger(String passengerPhone);


    /**
     * 旅客注册
     * @param passenger
     * @return
     */
    boolean register(@Param("passenger") Passenger passenger);

    /**
     * 修改用户非头像信息
     * @param map
     * @return
     */
    boolean updateInfo(Map<String,Object> map);

    /**
     * 修改头像
     * @param map
     * @return
     */
    boolean updateImg(Map<String,Object> map);

}
