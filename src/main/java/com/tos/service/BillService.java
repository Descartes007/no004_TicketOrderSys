package com.tos.service;


import com.tos.pojo.Bill;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface BillService {
    /**
     * 返回bill的list
     * @param phone
     * @return
     */
    List<Bill> getBills(String phone);

    /**
     * 删除指定id的bill
     * @param bill_id
     * @return
     */
    boolean deleteBill(String bill_id);
}
