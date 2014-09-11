<%@page import="com.ram.sai.model.*" session="true"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<link rel="stylesheet" href="<spring:theme code="styleSheet"/>"
	type="text/css">
</head>
<body style="background=<spring:theme code="image"/>">
<%-- 	<table>
		<tbody>
			<tr>
				<td>Change Theme:</td>
				<td><form name="themeChangeForm" method="get">
						<select name="theme" onchange="submitform()">
							<option selected="selected">--</option>
							<option value="default">Default</option>
							<option value="blue">Blue</option>
							<option value="black">Black</option>
						</select>
					</form></td>
			</tr>
		</tbody>
	</table>
	<script type="text/javascript">
		function submitform() {
			document.themeChangeForm.submit();
		}
	</script> --%>
	<h1>Registration Form</h1>
	<br />

	<form:form commandName="registrationBean" action="/HelloWeb/register">
		<table>
			<tr>
				<td colspan="2"><form:errors path="*" cssStyle="color:red;" /></td>
			</tr>
			<tr>
				<td>Name :</td>
				<td><form:input path="name" /></td>
			</tr>
			<tr>
				<td>Username :</td>
				<td><form:input path="username" /></td>
			</tr>
			<tr>
				<td>Email :</td>
				<td><form:input path="email" /></td>
			</tr>
			<tr>
				<td>Phone :</td>
				<td><form:input path="phone" /></td>
			</tr>
			<tr>
				<td>Password :</td>
				<td><form:password path="password" /></td>
			</tr>
			<tr>
				<td>Retype Password :</td>
				<td><form:password path="rePassword" /></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="Register" /></td>
			</tr>
		</table>
	</form:form>
</body>
</html>