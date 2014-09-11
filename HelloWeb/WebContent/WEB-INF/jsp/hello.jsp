<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
<title>Hello World</title>
</head>
<body>
   <h2>${message} to ${son} and ${wife}</h2>
   
   <form:form method="GET" action="/HelloWeb/page2">
<table>
    <tr>
    <td>
    <input type="submit" name="index" value="Index"/>
    
    <input type="submit" name="employee" value="Employee"/>
    </td>
    </tr>
</table>  
</form:form>
</body>
</html>