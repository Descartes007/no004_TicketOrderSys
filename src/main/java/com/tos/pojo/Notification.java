package com.tos.pojo;

import java.util.Date;

public class Notification {
    private String noteId;
    private int flightId;
    private String cardId;
    private String passengerName;
    private String phone;
    private Date takeTime;
    private String airport;

    public Notification() {
    }

    @Override
    public String toString() {
        return "Notification{" +
                "noteId='" + noteId + '\'' +
                ", flightId=" + flightId +
                ", cardId='" + cardId + '\'' +
                ", passengerName='" + passengerName + '\'' +
                ", phone='" + phone + '\'' +
                ", takeTime=" + takeTime +
                ", airport='" + airport + '\'' +
                '}';
    }

    public String getNoteId() {
        return noteId;
    }

    public void setNoteId(String noteId) {
        this.noteId = noteId;
    }

    public int getFlightId() {
        return flightId;
    }

    public void setFlightId(int flightId) {
        this.flightId = flightId;
    }

    public String getCardId() {
        return cardId;
    }

    public void setCardId(String cardId) {
        this.cardId = cardId;
    }

    public String getPassengerName() {
        return passengerName;
    }

    public void setPassengerName(String passengerName) {
        this.passengerName = passengerName;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Date getTakeTime() {
        return takeTime;
    }

    public void setTakeTime(Date takeTime) {
        this.takeTime = takeTime;
    }

    public String getAirport() {
        return airport;
    }

    public void setAirport(String airport) {
        this.airport = airport;
    }

    public Notification(String noteId, int flightId, String cardId, String passengerName, String phone, Date takeTime, String airport) {
        this.noteId = noteId;
        this.flightId = flightId;
        this.cardId = cardId;
        this.passengerName = passengerName;
        this.phone = phone;
        this.takeTime = takeTime;
        this.airport = airport;
    }
}
