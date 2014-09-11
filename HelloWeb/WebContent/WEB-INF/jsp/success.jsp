<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Registration Confirmation Page</title>
	<link rel="stylesheet" href="<spring:theme code="styleSheet"/>" type="text/css" />
</head>
<body>
	<h1>Registration has been completed with following details :</h1> <br>
	Name : ${registrationBean.name}.<br>
	Username : ${registrationBean.username}. <br>
	Email : ${registrationBean.email}.<br>
	Phone : ${registrationBean.phone}.<br>
	Password : ${registrationBean.password}.
</body>
</html>