package com.tos.mapper;

import com.tos.pojo.Notification;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;
@Mapper
public interface NotificationMapper {
    /**
     * 返回一个人的所有取票通知
     * @param phone
     * @return
     */
    List<Notification> getNotes(String phone);
    /**
     * 删除指定取票通知
     * @param noteId
     * @return
     */
    boolean deleteNote(String noteId);
}
