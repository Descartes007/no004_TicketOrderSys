package com.tos.pojo;

import java.util.Date;

public class Bill {
    private String billId;
    private String route;
    private int flightId;
    private String name;
    private Date consumeDate;
    private int seatType;
    private float price;
    private String phone;

    public Bill() {
    }

    @Override
    public String toString() {
        return "Bill{" +
                "billId='" + billId + '\'' +
                ", route='" + route + '\'' +
                ", flightId=" + flightId +
                ", name='" + name + '\'' +
                ", consumeDate=" + consumeDate +
                ", seatType=" + seatType +
                ", price=" + price +
                ", phone='" + phone + '\'' +
                '}';
    }

    public String getBillId() {
        return billId;
    }

    public void setBillId(String billId) {
        this.billId = billId;
    }

    public String getRoute() {
        return route;
    }

    public void setRoute(String route) {
        this.route = route;
    }

    public int getFlightId() {
        return flightId;
    }

    public void setFlightId(int flightId) {
        this.flightId = flightId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Date getConsumeDate() {
        return consumeDate;
    }

    public void setConsumeDate(Date consumeDate) {
        this.consumeDate = consumeDate;
    }

    public int getSeatType() {
        return seatType;
    }

    public void setSeatType(int seatType) {
        this.seatType = seatType;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Bill(String billId, String route, int flightId, String name, Date consumeDate, int seatType, float price, String phone) {
        this.billId = billId;
        this.route = route;
        this.flightId = flightId;
        this.name = name;
        this.consumeDate = consumeDate;
        this.seatType = seatType;
        this.price = price;
        this.phone = phone;
    }
}
