

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	 	private String dbUrl = "jdbc:mysql://localhost:3306/SE_database";
	    private String dbUname = "root";
	    private String dbPassword = ""; //lagay mo dito kung meron password db mo
	    private String dbDriver = "com.mysql.cj.jdbc.Driver";


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			PrintWriter out = response.getWriter();
			Class.forName(dbDriver);
			Connection con = DriverManager.getConnection(dbUrl, dbUname,dbPassword);
			String username = request.getParameter("uname");
			String password = request.getParameter("upwd");
			PreparedStatement ps = con.prepareStatement("SELECT * FROM SE_database.Admin WHERE username=? and password=?");
			ps.setString(1, username);
			ps.setString(2, password);
			ResultSet rs = ps.executeQuery();
			
			if(rs.next()) {
				RequestDispatcher rd = request.getRequestDispatcher("HOME_homepg.jsp");
				rd.forward(request, response);
			}
			else {
				RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
				request.setAttribute("alertMsg", "Wrong Username or Password");
				rd.forward(request, response);
			}

			
		} catch (ClassNotFoundException e) {

			e.printStackTrace();
		} catch (SQLException e) {

			e.printStackTrace();
		}
	}

}
