package com.tos.mapper;

import com.tos.pojo.Manager;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
public interface ManagerMapper {
    /**
     * 获取管理员
     * @param userName
     * @return
     */
    Manager getManager(String userName);
}
