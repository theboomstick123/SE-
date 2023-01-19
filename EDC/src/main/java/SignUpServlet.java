

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 * Servlet implementation class SignUpServlet
 */
@WebServlet("/SignUpServleet")
public class SignUpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
		private String dbUrl = "jdbc:mysql://localhost:3306/SE_database";
		private String dbUname = "root";
		private String dbPassword = " "; //change to your pass
		private String dbDriver = "com.mysql.cj.jdbc.Driver";
		
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			Class.forName(dbDriver);
			Connection con = DriverManager.getConnection(dbUrl, dbUname,dbPassword);
			String email = request.getParameter("email");
	   		String name = request.getParameter("name");
	   		String role = request.getParameter("role");
	   		String username = request.getParameter("uname");
	   		String password = request.getParameter("upwd");
	   		PreparedStatement ps = con.prepareStatement("INSERT INTO SE_database.Admin(name, email, role, username, password) VALUES(?,?,?,?,?) ");
	   		ps.setString(1, name);
			ps.setString(2, email);
			ps.setString(3, role);
			ps.setString(4, username);
			ps.setString(5, password);
			
			int i = ps.executeUpdate();
			if(i > 0) {
				request.setAttribute("status", "success");
			}
			RequestDispatcher rd = request.getRequestDispatcher("SignUp.jsp");
			rd.forward(request, response);
	   		
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
