

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

/**
 * Servlet implementation class forgotPassword
 */
public class forgotPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private String dbUrl = "jdbc:mysql://localhost:3306/SE_database";
    private String dbUname = "root";
    private String dbPassword = ""; //lagay mo dito kung meron password db mo
    private String dbDriver = "com.mysql.cj.jdbc.Driver";
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		String newPassword = request.getParameter("password");
		String confPassword = request.getParameter("confPassword");
		RequestDispatcher dispatcher = null;
		if (newPassword != null && confPassword != null && newPassword.equals(confPassword)) {

			try {
				Class.forName(dbDriver);
				Connection con = DriverManager.getConnection(dbUrl, dbUname,dbPassword);
				PreparedStatement ps = con.prepareStatement("UPDATE SE_database.Admin set password = ? where email = ? ");
				ps.setString(1, newPassword);
				ps.setString(2, (String) session.getAttribute("email"));

				int rowCount = ps.executeUpdate();
				if (rowCount > 0) {
					request.setAttribute("status", "resetSuccess");
					dispatcher = request.getRequestDispatcher("login.jsp");
				} else {
					request.setAttribute("status", "resetFailed");
					dispatcher = request.getRequestDispatcher("login.jsp");
				}
				dispatcher.forward(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

}
