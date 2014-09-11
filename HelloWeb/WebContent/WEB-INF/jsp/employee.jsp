<%@page import="com.ram.sai.model.*" session="true"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type"
	content="text/html; charset=windows-1251">
<link rel="stylesheet" href="<spring:theme code="styleSheet"/>"
	type="text/css">
<title>Employee Form</title>
</head>
<body>
	<h2>Add Employee Information</h2>
	<form:form method="POST" commandName="employee"
		action="/HelloWeb/addemployee" enctype="multipart/form-data">
		<table border="1" style="background-color: aqua; max-width: 450">
			<tr style="color: purple;">
				<td><ul>
						<li><form:errors path="*"></form:errors></li>
					</ul></td>
			</tr>
		</table>
		<hr />
		<table>
			<tr>
				<td>Name</td>
				<td><form:input path="name" /></td>
			</tr>
			<tr>
				<td>Employee Id</td>
				<td><form:input path="empId" /></td>
			</tr>
			<tr>
				<td>Age</td>
				<td><form:input path="age" /></td>
			</tr>
			<tr>
				<td>Male: <form:radiobutton path="sex" value="M" /></td>
				<td>Female: <form:radiobutton path="sex" value="F" /></td>
			</tr>
			<tr>
				<td>Salary</td>
				<td><form:input path="salary" /></td>
			</tr>
			<tr>
				<td>Designation</td>
				<td><form:input path="designation" /></td>
			</tr>
			<tr>
				<td>Department</td>
				<td><form:input path="department" /></td>
			</tr>
			<tr>
				<td>DOJ(dd/mm/yyyy)</td>
				<td><form:input path="doj" /></td>
			</tr>
			<tr>
				<td>DOL(dd/mm/yyyy)</td>
				<td><form:input path="dol" /></td>
			</tr>
			<tr>
				<td>Subscribe to newsletter?:</td>
				<%-- Approach 1: Property is of type java.lang.Boolean --%>
				<td><form:checkbox path="receiveNewsletter" /></td>
			</tr>

			<tr>
				<td>Interests:</td>
				<%-- Approach 2: Property is of an array or of type java.util.Collection --%>
				<td><form:checkboxes path="interests" items="${interestsValues}" itemLabel="interest" itemValue="interestId" /> 
						
						<%-- <form:checkboxes path="interests"
						items="${interestsValues}" /> </td> --%>
			</tr>

			<tr>
				<td>Favourite Word:</td>
				<%-- Approach 3: Property is of type java.lang.Ob
			ject --%>
				<td>Magic: <form:checkbox path="favouriteWord" value="Magic" />
				</td>
			</tr>
			<tr>
				<td>Password:</td>
				<td><form:password path="password" value="^76525bvHGq"
						showPassword="true" /></td>
			</tr>
			<tr>
				<td>Skills:</td>
				<td>
					<%-- <form:select path="skills" multiple="true">
						<c:forEach items="${skillValues}" var="var1">
							<form:option value="${var1.skillId}">${var1.skill}</form:option>
						</c:forEach>
					</form:select> --%> 
					
					<form:select path="skills"
						items="${skillValues}" itemLabel="skill" itemValue="skillId"
						multiple="true" />
				</td>
				<%-- <td><form:select path="skills" multiple="true"
						items="${skillValues}">
					</form:select></td> --%>
			</tr>
			<tr>
				<td>House:</td>
				<td><form:select path="house" multiple="false"
						items="${houseValues}">
					</form:select></td>
			</tr>
			<tr>
				<td>Notes:</td>
				<td><form:textarea path="notes" rows="3" cols="20" /></td>
				<%-- <td><form:errors path="notes" /></td> --%>
			</tr>

			<tr>
				<td>Certificates:</td>
				<td><input type="file" name="file_2" /></td>
			</tr>
			<tr>
				<td>Uploaded Files:</td>
				<td><a href="${employee.file_1}">${employee.file_1}</a></td>
				<form:hidden path="file_1" />
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="Add Employee" /></td>
			</tr>
		</table>
		<hr />
	</form:form>
</body>
</html>