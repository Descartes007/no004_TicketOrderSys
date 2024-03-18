package com.tos.pojo;

public class Passenger {
    private int passengerId;
    private String cardId;
    private String passengerName;
    private String phone;
    private String password;
    private String avatarImg;
    private String nickName;
    private String city;
    private String email;
    private String wechat;

    public Passenger(int passengerId, String cardId, String passengerName, String phone, String password, String avatarImg, String nickName, String city, String email, String wechat) {
        this.passengerId = passengerId;
        this.cardId = cardId;
        this.passengerName = passengerName;
        this.phone = phone;
        this.password = password;
        this.avatarImg = avatarImg;
        this.nickName = nickName;
        this.city = city;
        this.email = email;
        this.wechat = wechat;
    }

    public Passenger() {
    }

    public int getPassengerId() {
        return passengerId;
    }

    public void setPassengerId(int passengerId) {
        this.passengerId = passengerId;
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

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getAvatarImg() {
        if(avatarImg==null || "".equals(avatarImg)) {
            return "/static/images/photo.png";
        }else {
            return "/upload/" + avatarImg;
        }
    }

    public void setAvatarImg(String avatarImg) {
        this.avatarImg = avatarImg;
    }

    public String getNickName() {
        return nickName;
    }

    public void setNickName(String nickName) {
        this.nickName = nickName;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getWechat() {
        return wechat;
    }

    public void setWechat(String wechat) {
        this.wechat = wechat;
    }

    @Override
    public String toString() {
        return "Passenger{" +
                "passengerId=" + passengerId +
                ", cardId='" + cardId + '\'' +
                ", passengerName='" + passengerName + '\'' +
                ", phone='" + phone + '\'' +
                ", password='" + password + '\'' +
                ", avatarImg='" + avatarImg + '\'' +
                ", nickName='" + nickName + '\'' +
                ", city='" + city + '\'' +
                ", email='" + email + '\'' +
                ", wechat='" + wechat + '\'' +
                '}';
    }
}
