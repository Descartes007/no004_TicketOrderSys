package com.tos.mapper;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;

public class CityAirport {

    public HashMap<String, ArrayList<String>> loadAirport(){
        {
            HashMap<String, ArrayList<String>> cityAirport = new HashMap<String, ArrayList<String>>();
            ArrayList<String> cities = new ArrayList<String>();
            PreparedStatement pstm;
            PreparedStatement pstm1;

            String url = "jdbc:mysql://localhost:3306/flysys?useUnicode=true&characterEncoding=UTF-8";
            String user = "root";
            String password = "root";
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }
            try {
                Connection conn = DriverManager.getConnection(url, user, password);

                pstm = conn.prepareStatement("select distinct city  from city_airport;");
                ResultSet resultSet = pstm.executeQuery();
                while (resultSet.next()) {
                    cities.add(resultSet.getString("city"));
                }

                Iterator<String> cityIt = cities.iterator();

                while (cityIt.hasNext()) {
                    pstm1 = conn.prepareStatement("select airport from city_airport where city = ?;");
                    String city = cityIt.next();
                    System.out.println("输入的城市: " + city);

                    pstm1.setString(1, city);//找到相同城市的机场，合并
                    System.out.println(pstm1.toString());


                    ResultSet resultSet1 = pstm1.executeQuery();
                    ArrayList<String> airports = new ArrayList<String>();

                    while (resultSet1.next()) {

                        String airport = resultSet1.getString("airport");
                        airports.add(airport);
                        System.out.println(airport);
                    }
                    cityAirport.put(city, airports);
                }


            } catch (SQLException e) {
                e.printStackTrace();
            }
            Iterator<String> iterator = cityAirport.keySet().iterator();
            while (iterator.hasNext()) {
                String city = iterator.next();
                ArrayList<String> airports = cityAirport.get(city);
                System.out.println("city = " + city);
                System.out.println("airports.size() = " + airports.size());
                if (airports == null) {
                    System.out.println("no airports in result");
                }
                for (int i = 0; i < airports.size(); i++) {
                    System.out.println(airports.get(i));
                }

            }
            return cityAirport;
        }
    }
}
