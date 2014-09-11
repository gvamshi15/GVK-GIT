<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Order Details</title>
<link rel="stylesheet"
	href="<c:url value="/resources/css/cg-styles.css"/>">
<link rel="stylesheet"
	href="<c:url value="/resources/css/pure-min.css"/>">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.9.1.js"></script>
<script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
<script src="<c:url value="/resources/js/cgrp-jquery.js" />"></script>
<script>
	$(document).ready(function() {
		loadAll();
	});
</script>
</head>
<body>
	<h1 class="pure-form h1">
		<spring:message code="orderpage.title" />
	</h1>
	<div>
		<div id="error" class='error'></div>
	</div>
	<form:form id="order"
		action="${pageContext.request.contextPath}/create" commandName="order"
		method="POST" class="pure-form pure-form-aligned">
		<fieldset>
			<div class="pure-control-group">
				<form:label path="name">
					<spring:message code="name.label" />
				</form:label>
				<form:input path="name" placeholder="Customer Name" />
				<span class="required">*</span>
			</div>

			<div class="pure-control-group">
				<form:label path="dob">
					<spring:message code="dob.label"/>
				</form:label>
				<form:input path="dob" size="10" maxlength="10" readonly="true"
					placeholder="Birthday" />
				<span class="required">*</span>
			</div>

			<div class="pure-control-group">
				<form:label path="phone">
					<spring:message code="phone.label"/>
				</form:label>
				<form:input path="phone" placeholder="Mobile" maxlength="10" />
				<span class="required">*</span>
				<div class="anim" id="msgPhone"></div>
			</div>
		</fieldset>
		<fieldset>
			<div class="pure-control-group">
				<form:label path="address1">
					<spring:message code="address1.label"/>
				</form:label>
				<form:input path="address1" placeholder="Address" />
			</div>

			<div class="pure-control-group">
				<form:label path="city">
					<spring:message code="city.label"/>
				</form:label>
				<form:input path="city" placeholder="City" />
			</div>

			<div class="pure-control-group">
				<form:label path="pin">
					<spring:message code="pin.label"/>
				</form:label>
				<form:input path="pin" placeholder="Postcode" />
				<span class="required">*</span>
			</div>
		</fieldset>
		<fieldset>
			<div class="pure-control-group">
				<form:label path="product">
					<spring:message code="product.label"/>
				</form:label>
				<form:select path="product" placeholder="Product" multiple="false">
					<form:option value="">
						<spring:message code="product.default" />
					</form:option>
					<form:option value="Apple-Mac">
						<spring:message code="product1.default" />
					</form:option>
					<form:option value="Dell">
						<spring:message code="product2.default" />
					</form:option>
					<form:option value="HP">
						<spring:message code="product3.default" />
					</form:option>
					<form:option value="Lenovo">
						<spring:message code="product4.default" />
					</form:option>
				</form:select>
				<span class="required">*</span>
			</div>
			<div class="pure-control-group">
				<form:label path="quantity">
					<spring:message code="quantity.label"/>
				</form:label>
				<form:input path="quantity" placeholder="Quantity" />
				<div class="anim" id="msgQty"></div>
			</div>
			<div class="pure-controls">
				<label for="cb" class="pure-checkbox"> <input id="cb"
					type="checkbox"> I agree the terms and conditions
				</label> <input value="Create" type="submit"
					class="pure-button pure-button-primary">
			</div>
		</fieldset>
	</form:form>
</body>
</html>