

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.util.Properties;
import java.util.Random;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 * Servlet implementation class SignUpVerEmail
 */
@WebServlet("/SignUpVerEmail")
public class SignUpVerEmail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private String dbUrl = "jdbc:mysql://localhost:3306/SE_database";
    private String dbUname = "root";
    private String dbPassword = ""; //lagay mo dito kung meron password db mo
    private String dbDriver = "com.mysql.cj.jdbc.Driver";
    Date now = new Date();
    long curr = this.now.getTime();
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			PrintWriter out = response.getWriter();
			Class.forName(dbDriver);
			Connection con = DriverManager.getConnection(dbUrl, dbUname,dbPassword);
			String email = request.getParameter("email");
			PreparedStatement ps = con.prepareStatement("SELECT email FROM SE_database.Admin WHERE email=?");
			
			ps.setString(1, email);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				
			RequestDispatcher dispatcher = null;
			int otpvalue = 0;
			HttpSession mySession = request.getSession();
			
			if(email!=null || !email.equals("")) {
				// sending otp
				Random rand = new Random();
				otpvalue = rand.nextInt(1255650);
				
				String to = email;	
				Properties props = new Properties();
				props.put("mail.smtp.host", "smtp.gmail.com");
				props.put("mail.smtp.socketFactory.port", "465");
				props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
				props.put("mail.smtp.auth", "true");
				props.put("mail.smtp.port", "465");
				Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
					protected PasswordAuthentication getPasswordAuthentication() {
						return new PasswordAuthentication("cjosh7960@gmail.com", "gqihywzoxmunzops");// Put your email
																										// id and
																										// password here
					}
				});
				// compose message
				try {
					//PreparedStatement ps1 = con.prepareStatement("INSERT INTO SE_database.Admin(OTP) VALUES(?)");
					//ps1.setInt(1, otpvalue);
					//ps1.executeUpdate();
					MimeMessage message = new MimeMessage(session);
					message.setFrom(new InternetAddress(email));// change accordingly
					message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
					message.setSubject("OTP");
					message.setText("Your OTP is: " + otpvalue + "\nYou only have 3 minutes until the OTP expires!");
					// send message
					Transport.send(message);
					System.out.println("message sent successfully");
				}

				catch (MessagingException e) {
					throw new RuntimeException(e);
				}
				dispatcher = request.getRequestDispatcher("SignUpVerOTP.jsp");
				request.setAttribute("message","OTP is sent to your email id");
				
				mySession.setAttribute("otp",otpvalue); 
				mySession.setAttribute("email",email);
				mySession.setAttribute("Current", curr);
				dispatcher.forward(request, response);
				
			}
		}else {
			out.print("Email does not exist!");
		}
		} catch (ClassNotFoundException e1) {
			
			e1.printStackTrace();
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
	}

}