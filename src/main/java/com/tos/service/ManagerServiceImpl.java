package com.tos.service;


import com.tos.mapper.ManagerMapper;
import com.tos.pojo.Manager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ManagerServiceImpl implements ManagerService {
    @Autowired
    private ManagerMapper managerMapper;

    @Override
    public Manager getManager(String userName) {
        return managerMapper.getManager(userName);
    }
}
