<%@ page
	import="java.io.*,java.sql.*,net.sf.json.JSONObject,java.util.*"%>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>

<%
	response.setContentType("application/json");
	try {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con = DriverManager.getConnection(
				"jdbc:oracle:thin:@localhost:1521:xe", "akshith",
				"cherry");
		Statement st = con.createStatement();
		ResultSet rs;
		rs = st.executeQuery("select name from EMPLOYEE");

		JSONObject jo = new JSONObject();
		//Map<String,String> l1 = new HashMap<String,String>();
		List<String> l1 = new LinkedList<String>();
		while (rs.next()) {
			l1.add(rs.getString(1));
		}
		jo.put("empname", l1);
		//response.getWriter().flush(jo);
		out.print(jo);
		out.flush();
		rs.close();
		st.close();
		con.close();

	} catch (Exception e) {
		out.println("Exception occured" + e.getMessage());
	}
%>