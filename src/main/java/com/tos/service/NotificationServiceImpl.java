package com.tos.service;

import com.tos.mapper.NotificationMapper;
import com.tos.pojo.Notification;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class NotificationServiceImpl implements NotificationService {
    @Autowired
    private NotificationMapper notificationMapper;

    @Override
    public List<Notification> getNotes(String phone) {
        return notificationMapper.getNotes(phone);
    }

    @Override
    public boolean deleteNote(String noteId) {
        return notificationMapper.deleteNote(noteId);
    }


}
