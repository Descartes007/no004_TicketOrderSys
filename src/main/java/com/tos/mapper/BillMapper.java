package com.tos.mapper;

import com.tos.pojo.Bill;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;
@Mapper
public interface BillMapper {
    /**
     * 获取一个旅客的所有取票通知，根据phone
     * @param phone
     * @return
     */
    List<Bill> getBills(String phone);

    /**
     * 根据id删除取票通知
     * @param billId
     * @return
     */
    boolean deleteBill(String billId);
}
