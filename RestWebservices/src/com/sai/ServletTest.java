/**
 * 
 */
package com.sai;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//File Name SendEmail.java
/**
 * @author Lenovo
 *
 */
public class ServletTest extends HttpServlet {

	/*
	 * // Method to handle GET method request. public void
	 * doGet(HttpServletRequest request, HttpServletResponse response) throws
	 * ServletException, IOException { // Set refresh, autoload time as 5
	 * seconds //response.setIntHeader("Refresh", 1);
	 * 
	 * // Set response content type response.setContentType("text/html");
	 * 
	 * // Get current time Calendar calendar = new GregorianCalendar(); String
	 * am_pm; int hour = calendar.get(Calendar.HOUR); int minute =
	 * calendar.get(Calendar.MINUTE); int second =
	 * calendar.get(Calendar.SECOND); if(calendar.get(Calendar.AM_PM) == 0)
	 * am_pm = "AM"; else am_pm = "PM";
	 * 
	 * String CT = hour+":"+ minute +":"+ second +" "+ am_pm;
	 * 
	 * PrintWriter out = response.getWriter(); String title =
	 * "Auto Refresh Header Setting"; String docType =
	 * "<!doctype html public \"-//w3c//dtd html 4.0 " +
	 * "transitional//en\">\n"; out.println(docType + "<html>\n" +
	 * "<head><title>" + title + "</title></head>\n"+
	 * "<body bgcolor=\"#f0f0f0\">\n" + "<h1 align=\"center\">" + title +
	 * "</h1>\n" + "<p>Current Time is: " + CT + "</p>\n");
	 * //response.sendError(404, "Forbidden Request !!!" ); } // Method to
	 * handle POST method request. public void doPost(HttpServletRequest
	 * request, HttpServletResponse response) throws ServletException,
	 * IOException { doGet(request, response); }
	 */

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Recipient's email ID needs to be mentioned.
		// String to = "vamshi.gulapally@gmail.com";

		// Sender's email ID needs to be mentioned
		// String from = "g.vamshi.krishna15@gmail.com";

		// Assuming you are sending email from localhost
		// String host = "localhost";

		// Get system properties
		/*
		 * Properties properties = System.getProperties(); //Properties props =
		 * System.getProperties(); properties.put("mail.smtp.starttls.enable",
		 * true); // added this line properties.put("mail.smtp.host",
		 * "smtp.gmail.com"); properties.put("mail.smtp.user",
		 * "g.vamshi.krishna15"); properties.put("mail.smtp.password",
		 * "savithakrishna"); properties.put("mail.smtp.port", "587");
		 * properties.put("mail.smtp.auth", true); // Setup mail server // Get
		 * the default Session object. //Session session =
		 * Session.getDefaultInstance(properties); Session session =
		 * Session.getInstance(properties,null); // Create a default MimeMessage
		 * object. MimeMessage message = new MimeMessage(session);
		 * 
		 * // Set response content type response.setContentType("text/html");
		 * PrintWriter out = response.getWriter();
		 * 
		 * try {
		 * 
		 * 
		 * // Set From: header field of the header. message.setFrom(new
		 * InternetAddress(from));
		 * 
		 * // Set To: header field of the header.
		 * message.addRecipient(Message.RecipientType.TO, new InternetAddress(
		 * to));
		 * 
		 * // Set Subject: header field
		 * message.setSubject("This is the Subject Line!"); InternetAddress from
		 * = new InternetAddress("g.vamshi.krishna15@gmail.com");
		 * message.setSubject("This is the Subject Line!");
		 * message.setFrom(from);
		 * message.addRecipients(Message.RecipientType.TO,
		 * InternetAddress.parse("vamshi.gulapally@gmail.com"));
		 * 
		 * // Create a multi-part to combine the parts Multipart multipart = new
		 * MimeMultipart("alternative");
		 * 
		 * // Create the message part BodyPart messageBodyPart = new
		 * MimeBodyPart();
		 * 
		 * // Fill the message messageBodyPart.setText("This is message body");
		 * 
		 * // Create a multipar message //Multipart multipart = new
		 * MimeMultipart();
		 * 
		 * // Set text message part multipart.addBodyPart(messageBodyPart);
		 * 
		 * // Part two is attachment messageBodyPart = new MimeBodyPart();
		 * String filename = "C:\\Vamshi\\Resumes\\cl.txt"; DataSource source =
		 * new FileDataSource(filename); messageBodyPart.setDataHandler(new
		 * DataHandler(source)); messageBodyPart.setFileName(filename);
		 * multipart.addBodyPart(messageBodyPart);
		 * 
		 * // Send the complete message parts message.setContent(multipart);
		 * 
		 * // Send message Transport transport = session.getTransport("smtp");
		 * transport.connect("smtp.gmail.com", "g.vamshi.krishna15",
		 * "savithakrishna");
		 * System.out.println("Transport: "+transport.toString());
		 * transport.send(message, message.getAllRecipients()); String title =
		 * "Send Email"; String res = "Sent message successfully...."; String
		 * docType = "<!doctype html public \"-//w3c//dtd html 4.0 " +
		 * "transitional//en\">\n"; out.println(docType + "<html>\n" +
		 * "<head><title>" + title + "</title></head>\n" +
		 * "<body bgcolor=\"#f0f0f0\">\n" + "<h1 align=\"center\">" + title +
		 * "</h1>\n" + "<p align=\"center\">" + res + "</p>\n" +
		 * "</body></html>"); } catch (MessagingException mex) {
		 * mex.printStackTrace(); } }
		 */
		Properties props = System.getProperties();
		props.put("mail.smtp.starttls.enable", true); // added this line
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.user", "g.vamshi.krishna15");
		props.put("mail.smtp.password", "savithakrishna");
		props.put("mail.smtp.port", "587");
		props.put("mail.smtp.auth", true);

		Session session = Session.getInstance(props, null);
		MimeMessage message = new MimeMessage(session);

		System.out.println("Port: " + session.getProperty("mail.smtp.port"));
		// Set response content type
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();

		// Create the email addresses involved
		try {
			InternetAddress from = new InternetAddress(
					"g.vamshi.krishna15@gmail.com");
			message.setSubject("Yes we can");
			message.setFrom(from);
			message.addRecipients(Message.RecipientType.TO,
					InternetAddress.parse("vamshi.gulapally@gmail.com"));

			// Create a multi-part to combine the parts
			Multipart multipart = new MimeMultipart("alternative");

			// Create your text message part
			MimeBodyPart messageBodyPart = new MimeBodyPart();
			

			// Part two is attachment
			messageBodyPart = new MimeBodyPart();
			String filename = "C://Vamshi//Resumes//cl.txt";
			DataSource source = new FileDataSource(filename);
			messageBodyPart.setDataHandler(new DataHandler(source));
			messageBodyPart.setFileName(filename);
			multipart.addBodyPart(messageBodyPart);
			
			messageBodyPart = new MimeBodyPart();
			messageBodyPart.setText("some text to send2s");

			// Add the text part to the multipart
			multipart.addBodyPart(messageBodyPart);

			// Create the html part
			messageBodyPart = new MimeBodyPart();
			String htmlMessage = "Our html text";
			messageBodyPart.setContent(htmlMessage, "text/html");
			// Add html part to multi part
			multipart.addBodyPart(messageBodyPart);

			// Associate multi-part with message
			message.setContent(multipart);

			// Send message
			Transport transport = session.getTransport("smtp");
			transport.connect("smtp.gmail.com", "g.vamshi.krishna15",
					"savithakrishna");
			System.out.println("Transport: " + transport.toString());
			transport.sendMessage(message, message.getAllRecipients());
			String title = "Send Email";
			String res = "Sent message successfully....";
			String docType = "<!doctype html public \"-//w3c//dtd html 4.0 "
					+ "transitional//en\">\n";
			out.println(docType + "<html>\n" + "<head><title>" + title
					+ "</title></head>\n" + "<body bgcolor=\"#f0f0f0\">\n"
					+ "<h1 align=\"center\">" + title + "</h1>\n"
					+ "<p align=\"center\">" + res + "</p>\n"
					+ "</body></html>");

		} catch (AddressException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}