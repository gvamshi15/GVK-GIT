package com.connectgroup.javatask.service;

import static org.junit.Assert.*;

import org.junit.Test;

public class OrderServiceTest {

	@Test
	public void shouldRetrieveSavedOrders() {
		OrderService orderService = new OrderServiceImpl();
		assertThat(orderService.getOrders().size(), 1);
		//fail("Not yet implemented");
	}

}
