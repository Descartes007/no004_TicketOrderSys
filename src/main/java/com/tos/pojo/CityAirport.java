package com.tos.pojo;

public class CityAirport {
    private String city;
    private String airport;

    public CityAirport() {
    }

    public CityAirport(String city, String airport) {
        this.city = city;
        this.airport = airport;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getAirport() {
        return airport;
    }

    public void setAirport(String airport) {
        this.airport = airport;
    }

    @Override
    public String toString() {
        return "City{" +
                "city='" + city + '\'' +
                ", airport='" + airport + '\'' +
                '}';
    }
}