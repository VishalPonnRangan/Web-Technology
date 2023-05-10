<%-- 
    Document   : index
    Created on : 9 May 2023, 17:25:38
    Author     : vishal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Travel Agency</title>
    </head>
    <body>
        <center><h1>Travel Easy</h1>
            <h3> - A Smarter way to travel</h3>
            <br><br>
            <b> Enter your Details</b>
            <form name="index" action="AirlineList.jsp" method="post">
                <br>
                <table cellpadding="6" cellspacing="6">
                    <tr>
                        <td><b>From</b></td>
                        <td><input type="text" name="txt_from"</td>
                    </tr>
                    <tr>
                        <td><b>To</b></td>
                        <td><input type="text" name="txt_to"</td>
                    </tr>
                    <tr>
                        <td><b>Date of Journey</b></td>
                        <td><input type="text" name="txt_depart"</td>
                    </tr>
                    <tr>
                        <td><b>Number of Passengers</b></td>
                        <td><input type="text" name="txt_no"</td>
                    </tr>
                <tr>
                    <td><b>Type of Flight</b></td>
                        <td><input type="Radio" name="group1" value="domestic">Domestic Flights</td
                </tr>
                <tr>
                    <td></td>
                    <td><input type="Radio" name="group1" value="international">International Flights</td>
                </tr>
                <tr>
                    <td><b>Select desired Airlines</b></td>
                    <td>
                        <select name="airline">
                            <option>Kingfisher</option>
                            <option>SpiceJet</option>
                        </select>
                    </td>
                </tr>
                </table>
                <br><br>
                <input type="Submit" name="Submit" value="Find Flights">
            </form>
           
        </center>
    </body>
</html>
