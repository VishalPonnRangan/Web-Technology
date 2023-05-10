<%-- 
    Document   : Kingfisher
    Created on : 9 May 2023, 17:27:57
    Author     : vishal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Kingfisher Airlines</title>
    </head>
    <body>
        <%@ page language="java" %>
        <%@ page import ="java.sql.*" %>
        <%
            String s = request.getParameter("no");
            out.println("<h1><center>Kingfisher Airlines</h1><br><h3>- Have a nice trip!!!</h3></center><br>");
            out.println("<br><br>Your Booking Details");
            out.println("<br><br><table cellspacing=10 cellpaddin=10>");
            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
            String sTable = request.getParameter("air_type");
            String sSql = "SELECT * FROM "   sTable   " WHERE FlightNo='" request.getParameter("flight_no") "'";
            String sDBQ = "d:/kingfisher.mdb";

            String database = "jdbc:odbc:Driver={Microsoft Access Driver (*.mdb)};DBQ="   sDBQ   ";DriverID=22;READONLY=true";
            Connection cn = null;
            Statement st = null;
            ResultSet rs = null;
            String name,age,sex,flightno,from,to,departure,arrival,starttime,reachtime,seat;
            out.println("<tr><th>Name</th><th>Age</th><th>Sex</th><th>Flight No</th><th>From</th><th>To</th><th>Departure Date</th><th>Arrival Date</th><th>Start Time</th><th>Reach Time</th><th>Seat No</th></tr>");
            try
            {
             cn = DriverManager.getConnection( database ,"","");
             st = cn.createStatement();
             rs = st.executeQuery( sSql );
             ResultSetMetaData rsmd = rs.getMetaData();
             int seat1=1;
             while(rs.next())
             {
                 flightno = rs.getString(1);
                 from = rs.getString(2);
                 to = rs.getString(3);
                 departure = rs.getString(4);
                 arrival = rs.getString(5);
                 starttime = rs.getString(6);
                 reachtime = rs.getString(7);
                 seat = rs.getString(8);
                 seat1 = Integer.parseInt(seat);
                 for(int i=1;i<=Integer.parseInt(s);i  )
            {
                name= request.getParameter("pas" i "_name");
                age = request.getParameter("pas" i "_age");
                sex = request.getParameter("pas" i "_sex");
                flightno = request.getParameter("flight_no");

                out.println("<tr><td>" name "</td><td>" age "</td><td>" sex "</td>");
                out.println("<td>" flightno "</td><td>" from "</td><td>" to "</td><td>" departure "</td>");


                out.println("<td>" arrival "</td><td>" starttime "</td><td>" reachtime "</td><td>" seat1 "</td>");
                seat1--;
               }
                
             }
             Connection cn1 = null;
            Statement st1 = null;
            ResultSet rs1 = null;
           try
           {
            sSql = "update "   sTable   " set SeatCapacity=" seat1 " WHERE FlightNo='" request.getParameter("flight_no") "'";
            rs1 = st.executeQuery( sSql );
            }
           catch(Exception e)
           {
            }
            
            }
            finally {
                try { if( null != rs ) rs.close(); } catch( Exception ex ) {}
                try { if( null != st ) st.close(); } catch( Exception ex ) {}
                try { if( null != cn ) cn.close(); } catch( Exception ex ) {}
                    }
        %>
    </body>
</html>