package com.tos.service;


import com.tos.mapper.BillMapper;
import com.tos.pojo.Bill;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class BillServiceImpl implements BillService {
    @Autowired
    private BillMapper billMapper;

    @Override
    public List<Bill> getBills(String phone) {
        return billMapper.getBills(phone);
    }

    @Override
    public boolean deleteBill(String billId) {
        return billMapper.deleteBill(billId);
    }
}
