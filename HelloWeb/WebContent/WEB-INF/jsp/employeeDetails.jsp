<%@page import="com.ram.sai.model.*" session="true"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html">
<title>Employee Details</title>
</head>
<body>
	<h2>Employee Information Updated</h2>
	<hr />
	<br />
	<br />
	<form:form method="GET" action="/HelloWeb/updateEmployee">
		<table border="1" style="background-color: yellow;">
			<tr>
				<td>Name</td>
				<td>${employee.name}</td>
			</tr>
			<tr>
				<td>Employee Id</td>
				<td>${employee.empId}</td>
			</tr>
			<tr>
				<td>Age</td>
				<td>${employee.age}</td>
			</tr>
			<tr>
				<td>Sex</td>
				<td>${employee.sex}</td>
			</tr>
			<tr>
				<td>Salary</td>
				<td>${employee.salary}</td>
			</tr>
			<tr>
				<td>Designation</td>
				<td>${employee.designation}</td>
			</tr>
			<tr>
				<td>Department</td>
				<td>${employee.department}</td>
			</tr>
			<tr>
				<td>DOJ(dd/mm/yyyy)</td>
				<td>${employee.doj}</td>
			</tr>
			<tr>
				<td>DOL(dd/mm/yyyy)</td>
				<td>${employee.dol}</td>
			</tr>
			<tr>
				<td>Receive News Letters</td>
				<td>${employee.receiveNewsletter}</td>
			</tr>
			<tr>
				<td>Interests</td>
				<%-- <c:forEach var="int" items="${employee.interests}">
					<td>${int.interest}</td>
				</c:forEach> --%>

				<%-- <td><form:checkboxes path="interests" items="${interests}" /></td> --%>

			</tr>
			<tr>
				<td>Favourite Word</td>
				<td>${employee.favouriteWord}</td>
			</tr>
			<tr>
				<td>Skills</td>
				<%-- <c:forEach var="sk" items="${employee.skills}">
					<td>${sk.skill}</td>
				</c:forEach> --%>
			</tr>
			<%-- <tr>
			<td>House:</td>
			<td><form:select path="house" items="${house}" multiple="true">
					<form:options items="${house}" disabled="true" />
				</form:select></td>
		</tr> --%>
			<tr>
				<td>House</td>
				<c:forEach var="house1" items="${employee.house}">
					<td>${house1}</td>
				</c:forEach>
			</tr>
			<tr>
				<td>Password</td>
				<td>${employee.password}</td>
			</tr>
			<tr>
				<td>Notes</td>
				<td>${employee.notes}</td>
			</tr>
			<tr>
				<td>Certificates</td>
				<td><a href="${employee.file_1}">${employee.file_1}</a></td>
			</tr>
			<tr>
				<td><input type="submit" name="update" value="update"/></td>
			</tr>
		</table>
		</form:form>
</body>
</html>