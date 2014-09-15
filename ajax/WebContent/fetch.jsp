<%@ page import="java.io.*,java.sql.*"%>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>

<%
	response.setContentType("text/xml");
	String sn = request.getParameter("ok");
	int i = 0;
	if (sn != null)
		i = Integer.parseInt(sn);
	try {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con = DriverManager.getConnection(
				"jdbc:oracle:thin:@localhost:1521:xe", "akshith",
				"cherry");
		Statement st = con.createStatement();
		ResultSet rs;
		if (sn != null) {
			rs = st.executeQuery("select EMPID, NAME, SALARY from EMPLOYEE where EMPID ="
					+ i);
			if (rs.next()) {

				out.println("<emp>");
				out.println("<empno>" + rs.getInt("EMPID") + "</empno>");
				out.println("<empname>" + rs.getString("NAME")
						+ "</empname>");
				out.println("<empaddr>" + rs.getDouble("SALARY")
						+ "</empaddr>");
				out.println("</emp>");

			}

		} else {
			rs = st.executeQuery("select name from EMPLOYEE");

			out.println("<emp>");
			while (rs.next()) {
				out.println("<empname>" + rs.getString(1)
						+ "</empname>");

			}
			out.println("</emp>");
		}
		rs.close();
		st.close();
		con.close();

	} catch (Exception e) {
		out.println("Exception occured" + e.getMessage());
	}
%>