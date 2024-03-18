package com.tos.pojo;

import java.util.Date;

public class Flight {
    private int id;
    private String airline;
    private String srcAirport;
    private String dstAirport;
    private Date startTime;
    private Date endTime;
    private float advancedPrice;
    private float economicPrice;
    private int seatNum;
    private int seatCount;
    private int advancedNum;
    private int economicNum;
    private int size;
    private String sizeStr;
    private int advancedCount;


    public Flight() {
    }


    public Flight(int id, String airline, String srcAirport, String dstAirport, Date startTime, Date endTime, float advancedPrice, float economicPrice, int seatNum, int seatCount, int advancedNum, int economicNum, int size) {
        this.id = id;
        this.airline = airline;
        this.srcAirport = srcAirport;
        this.dstAirport = dstAirport;
        this.startTime = startTime;
        this.endTime = endTime;
        this.advancedPrice = advancedPrice;
        this.economicPrice = economicPrice;
        this.seatNum = seatNum;
        this.seatCount = seatCount;
        this.advancedNum = advancedNum;
        this.economicNum = economicNum;
        this.size = size;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getAirline() {
        return airline;
    }

    public void setAirline(String airline) {
        this.airline = airline;
    }

    public String getSrcAirport() {
        return srcAirport;
    }

    public void setSrcAirport(String srcAirport) {
        this.srcAirport = srcAirport;
    }

    public String getDstAirport() {
        return dstAirport;
    }

    public void setDstAirport(String dstAirport) {
        this.dstAirport = dstAirport;
    }

    public Date getStartTime() {
        return startTime;
    }

    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    public float getAdvancedPrice() {
        return advancedPrice;
    }

    public void setAdvancedPrice(float advancedPrice) {
        this.advancedPrice = advancedPrice;
    }

    public float getEconomicPrice() {
        return economicPrice;
    }

    public void setEconomicPrice(float economicPrice) {
        this.economicPrice = economicPrice;
    }

    public int getSeatNum() {
        return seatNum;
    }

    public void setSeatNum(int seatNum) {
        this.seatNum = seatNum;
    }

    public int getSeatCount() {
        return seatCount;
    }

    public void setSeatCount(int seatCount) {
        this.seatCount = seatCount;
    }

    public int getAdvancedNum() {
        return advancedNum;
    }

    public void setAdvancedNum(int advancedNum) {
        this.advancedNum = advancedNum;
    }

    public int getEconomicNum() {
        return economicNum;
    }

    public void setEconomicNum(int economicNum) {
        this.economicNum = economicNum;
    }

    public int getSize() {
        return size;
    }

    public void setSize(int size) {
        this.size = size;
    }

    public String getSizeStr() {
        return sizeStr;
    }

    public void setSizeStr(String sizeStr) {
        this.sizeStr = sizeStr;
    }

    public int getAdvancedCount() {
        return advancedCount;
    }

    public void setAdvancedCount(int advancedCount) {
        this.advancedCount = advancedCount;
    }

    @Override
    public String toString() {
        return "Flight{" +
                "id=" + id +
                ", airline='" + airline + '\'' +
                ", srcAirport='" + srcAirport + '\'' +
                ", dstAirport='" + dstAirport + '\'' +
                ", startTime=" + startTime +
                ", endTime=" + endTime +
                ", advancedPrice=" + advancedPrice +
                ", economicPrice=" + economicPrice +
                ", seatNum=" + seatNum +
                ", seatCount=" + seatCount +
                ", advancedNum=" + advancedNum +
                ", economicNum=" + economicNum +
                ", size=" + size +
                '}';
    }
}
