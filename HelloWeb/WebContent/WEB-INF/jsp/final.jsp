<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
    <title>Spring Page Redirection</title>
</head>
<body>

<h2>Redirected to Final Page</h2>
<form:form method="GET" action="/HelloWeb/">
<table>
    <tr>
    <td>
    <input type="submit" value="Go Back"/>
    </td>
    </tr>
</table>  
</form:form>
</body>
</html>