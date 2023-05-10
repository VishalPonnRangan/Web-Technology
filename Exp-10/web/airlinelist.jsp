<%-- 
    Document   : airlinelist
    Created on : 9 May 2023, 17:26:19
    Author     : vishal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Domestic Flights</title>
    </head>
    <body>
        <center><h1>Travel Easy</h1>
            <h3> - A Smarter way to travel</h3>
        </center>
        <br><br>
        <%@ page language="java" %>
        <%@ page import ="java.sql.*" %>
        <%@ page import = "java.util.Date,java.text.SimpleDateFormat,java.text.ParseException"%>
        <%
            String type = request.getParameter("group1");
            String from= request.getParameter("txt_from");
            String to = request.getParameter("txt_to");
            String depart= request.getParameter("txt_depart");
            String ret = request.getParameter("txt_return");
            String no = request.getParameter("txt_no");
            String airline = request.getParameter("airline");
            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
            String sTable = type;
            String sSql = "SELECT * FROM "   sTable   " WHERE From='" from "' and TO='" to "' and DepartDate='" depart "' and SeatCapacity>=" no "";
            String sDBQ = "d:/"  airline ".mdb";

            String database = "jdbc:odbc:Driver={Microsoft Access Driver (*.mdb)};DBQ="   sDBQ   ";DriverID=22;READONLY=true";
            Connection cn = null;
            Statement st = null;
            ResultSet rs = null;
            try {
                cn = DriverManager.getConnection( database ,"","");
                st = cn.createStatement();
                rs = st.executeQuery( sSql );
                ResultSetMetaData rsmd = rs.getMetaData();
                String s1,s2,s3,s4,s5,s6,s7,s8;
                int i=1;
                String flight_no[] = new String[100];
                //out.println("<form name='AirlLine' action='' method='post'><b>" i " . "   rs.getString(1)   "</b><br><br>");
                out.println("<h3><b>" airline  " Flights</b></h3><br>");
                out.println("<table cellspacing=20 cellpaddinng=15>");
                out.println("<tr><th>Flight No</th><th>From</th><th>To</th><th>Departure Date</th><th>Arrival Date</th><th>Start Time</th>");
                out.println("<th>Reach Time</th><th>Seats Remaining</th></tr>");
                while(rs.next())
                {
                s1 = rs.getString(1);
                flight_no[i] = s1;
                s2 = rs.getString(2);
                s3 = rs.getString(3);
                s4 = rs.getString(4);
                s5 = rs.getString(5);
                s6 = rs.getString(6);
                s7 = rs.getString(7);
                s8 = rs.getString(8);
                out.println("<tr><td>" s1 "</td>");
                out.println("<td>" s2 "</td>");
                out.println("<td>" s3 "</td>");
                out.println("<td>" s4 "</td>");
                out.println("<td>" s5 "</td>");
                out.println("<td>" s6 "</td>");
                out.println("<td>" s7 "</td>");
                out.println("<td>" s8 "</td></tr>");
                i  ;
                }
                out.println("</table>");
                if(i==1)
                {
                    out.println("<br><center><b>Sorry!! No flights scheudle available</b></center><br>");
                }
                else
                {
                    out.println("<form name='AirlineList' action='" airline ".jsp' method='post'>");
                    out.println("<br><table><tr><td>Select Flight</td><td>");
                    out.println("<select name='flight_no'>");
                    for(int temp=1;temp<i;temp  )
                    {
                        out.println("<option>" flight_no[temp] "</option>");
                    }
                    out.println("</select></td></tr><tr></tr>");
                    out.println("<tr><td><input type='hidden' name='no' value='" no "'</td>");
                    out.println("<td><input type='hidden' name='air_type' value='" type "'</td></tr>");
                    for(int j=1;j<=Integer.parseInt(no);j  )
                    {
                        out.println("<tr><th>Passenger " j  " details</th></tr>");
                        out.println("<tr></tr>");
                        out.println("<tr><td>Name</td><td><input type='text' name='pas" j "_name'</td></tr>");
                        out.println("<tr><td>Age</td><td><input type='text' name='pas" j "_age'</td></tr>");
                        out.println("<tr><td>Sex</td><td><input type='text' name='pas" j "_sex'</td></tr>");
                        out.println("<tr></tr>");
                    }
                    out.println("</table><br><br><input type='Submit' name='Submit' value='Book Now'/></form>");
                }
                //out.println("<input name ='submit' value='Submit' type='submit'/>");
            }
            finally {
                try { if( null != rs ) rs.close(); } catch( Exception ex ) {}
                try { if( null != st ) st.close(); } catch( Exception ex ) {}
                try { if( null != cn ) cn.close(); } catch( Exception ex ) {}
                    }

        %>
    </body>
</html>

