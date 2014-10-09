package com.connectgroup.javatask.test;

import org.junit.Test;

public class TestOrderPage extends SeleniumConfig {

	CreateOrderPage order = new CreateOrderPage();
	ViewRecordsPage view  = new ViewRecordsPage();
	
	@Test
	public void createOrderTest()
	{
		view.createOrder().click();
		order.customerName().sendKeys("RandomPerson");
		order.dob().click();
		order.year(3).click();
		order.month(3).click();
		order.mobile().sendKeys("1234567890");
		order.address().sendKeys("25 Northfield");
		order.city().sendKeys("London");
		order.postCode().sendKeys("E62AJ");
		order.product(3).click();
		order.quantity().sendKeys("2");
		order.Termsandcondition().click();
		order.Create().click();
		
	}
}
