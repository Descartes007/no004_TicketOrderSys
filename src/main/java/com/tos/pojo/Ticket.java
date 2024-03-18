package com.tos.pojo;

import java.util.Date;

public class Ticket {
    private String ticketId;
    private int flightId;
    private String seatId;
    private Date departureTime;
    private Date boardTime;
    private String cardId;
    private String passengerName;
    private String srcAirport;



    public Ticket() {
    }

    @Override
    public String toString() {
        return "Ticket{" +
                "ticketId='" + ticketId + '\'' +
                ", flightId=" + flightId +
                ", seatId='" + seatId + '\'' +
                ", departureTime=" + departureTime +
                ", boardTime=" + boardTime +
                ", cardId='" + cardId + '\'' +
                ", passengerName='" + passengerName + '\'' +
                ", srcAirport='" + srcAirport + '\'' +
                '}';
    }

    public String getTicketId() {
        return ticketId;
    }

    public void setTicketId(String ticketId) {
        this.ticketId = ticketId;
    }

    public int getFlightId() {
        return flightId;
    }

    public void setFlightId(int flightId) {
        this.flightId = flightId;
    }

    public String getSeatId() {
        return seatId;
    }

    public void setSeatId(String seatId) {
        this.seatId = seatId;
    }

    public Date getDepartureTime() {
        return departureTime;
    }

    public void setDepartureTime(Date departureTime) {
        this.departureTime = departureTime;
    }

    public Date getBoardTime() {
        return boardTime;
    }

    public void setBoardTime(Date boardTime) {
        this.boardTime = boardTime;
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

    public String getSrcAirport() {
        return srcAirport;
    }

    public void setSrcAirport(String srcAirport) {
        this.srcAirport = srcAirport;
    }

    public Ticket(String ticketId, int flightId, String seatId, Date departureTime, Date boardTime, String cardId, String passengerName, String srcAirport) {
        this.ticketId = ticketId;
        this.flightId = flightId;
        this.seatId = seatId;
        this.departureTime = departureTime;
        this.boardTime = boardTime;
        this.cardId = cardId;
        this.passengerName = passengerName;
        this.srcAirport = srcAirport;
    }
}
