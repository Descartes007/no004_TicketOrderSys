package com.tos.service;

import com.tos.pojo.Manager;
import org.springframework.stereotype.Repository;

@Repository
public interface ManagerService {

    Manager getManager(String userName);
}
