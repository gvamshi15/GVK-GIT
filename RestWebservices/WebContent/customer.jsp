<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Customer</title>
</head>
<body>
	<form action="rest/customers/upload" method="post"
		enctype="multipart/form-data">
		Site : <input type="text" name="site" /> 
		Tutorials :<input type="text" name="tutorial" /> 
		Rank :<input type="text" name="rank" /> 
		<input type="file" name="file" />
		<input type="submit" value="Upload">
	</form>
</body>
</html>