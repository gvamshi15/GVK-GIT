<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="<c:url value="/resources/css/pure-min.css"/>">
<title>Orders View</title>
</head>
<body>

	<div class="pure-menu pure-menu-open pure-menu-horizontal">
		<ul class="pure-paginator">
			<li class="pure-button pure-button-active"><a href="#"><spring:message
						code="orderviewpage.title" /></a></li>
			<li class="pure-button next"><a
				href="${pageContext.request.contextPath}/order"><spring:message
						code="orderpage.title" /></a></li>
		</ul>
	</div>
	<h2 class="pure-form h2">
		<spring:message code="orderviewpage.title" />
	</h2>
	<c:choose>
		<c:when test="${fn:length(orderlist)>0}">
			<table id="records" class="pure-table pure-table-striped">
				<thead>
					<tr>
						<th><spring:message code="orderid.label"/></th>
						<th><spring:message code="name.label"/></th>
						<th><spring:message code="dob.label"/></th>
						<th><spring:message code="phone.label"/></th>
						<th><spring:message code="address1.label"/></th>
						<th><spring:message code="city.label"/></th>
						<th><spring:message code="pin.label"/></th>
						<th><spring:message code="productid.label"/></th>
						<th><spring:message code="quantity.label"/></th>
					</tr>
				</thead>
				<tbody class="pure-table pure-table-horizontal">
					<c:forEach items="${orderlist}" var="order">
						<tr>
							<td><c:out value="${order.orderId}"></c:out></td>
							<td><c:out value="${order.name}"></c:out></td>
							<td><c:out value="${order.dob}"></c:out></td>
							<td><c:out value="${order.phone}"></c:out></td>
							<td><c:out value="${order.address1}"></c:out></td>
							<td><c:out value="${order.city}"></c:out></td>
							<td><c:out value="${order.pin}"></c:out></td>
							<td><c:out value="${order.product}"></c:out></td>
							<td><c:out value="${order.quantity}"></c:out></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</c:when>
		<c:otherwise>
			<label><spring:message code="orders.not.found" /></label>
		</c:otherwise>
	</c:choose>
</body>
</html>