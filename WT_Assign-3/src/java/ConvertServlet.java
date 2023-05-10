import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConvertServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String dollars = request.getParameter("dollars");
        double dollarsValue = Double.parseDouble(dollars);

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/WT", "root", "");
            PreparedStatement ps = con.prepareStatement("insert into conversion_rates(dollar, rupee) values (?,?)");

            ps.setDouble(1, dollarsValue);
            ps.setDouble(2, dollarsValue * 72.59); // 1 dollar = 72.59 rupees

            ps.executeUpdate();
            con.close();
        } catch (Exception e) {
            System.out.println(e);
        }

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        out.println("<html><head><title>Conversion Result</title></head><body>");
        out.println("<h1>Conversion Result:</h1>");
        out.println("<p>" + dollars + " dollars = " + (dollarsValue * 72.59) + " rupees</p>");
        out.println("</body></html>");
    }
}
