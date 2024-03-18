package com.tos.service;

import com.tos.pojo.Notification;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface NotificationService {
    /**
     * 获取绑定电话的所有note
     * @param phone
     * @return
     */
    public List<Notification> getNotes(String phone);

    /**
     * 删除指定id的note
     * @param noteId
     * @return
     */
    public boolean deleteNote(String noteId);
}
