<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Details</title>
</head>
<body>
    <h1>Student Details</h1>
    <form method="post" action="StudentDetails.jsp">
        Enter Registration Number: <input type="text" name="reg_no"><br>
        <input type="submit" value="Submit">
    </form>
    <hr>
    <% 
        // import necessary packages
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/WT", "root", "");
            String reg_no = request.getParameter("reg_no");
            if (reg_no != null && !reg_no.isEmpty()) {
                PreparedStatement pstmt = con.prepareStatement("SELECT * FROM students WHERE reg_no=?");
                pstmt.setString(1, reg_no);
                ResultSet rs = pstmt.executeQuery();
                if (rs.next()) {
                    String name = rs.getString("name");
                    int marks = rs.getInt("marks");
                    out.println("Name: " + name + "<br>");
                    out.println("Registration Number: " + reg_no + "<br>");
                    out.println("Marks: " + marks);
                } else {
                    out.println("No record found for registration number " + reg_no);
                }
                rs.close();
                pstmt.close();
            }
            con.close();
        } catch(Exception e) {
            out.println("Error: " + e.getMessage());
        }
    %>
</body>
</html>
