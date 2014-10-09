package com.connectgroup.javatask.controller;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.junit.Before;
import org.junit.runner.RunWith;
import org.mockito.BDDMockito;
import org.mockito.Mock;
import org.mockito.runners.MockitoJUnitRunner;

import com.connectgroup.javatask.dom.Order;
import com.connectgroup.javatask.service.OrderService;
import com.connectgroup.javatask.validator.OrderValidator;

@RunWith(MockitoJUnitRunner.class)
// @WebAppConfiguration
public class OrderControllerTest {

	private OrderController orderController;
	@Mock
	private OrderValidator validator;
	private Order order;
	// private MockMvc mockMvc;
	@Mock
	private OrderService service;
	private List<Order> orders = null;

	@Before
	public void setUp() {
		// We have to reset our mock between tests because the mock objects
		// are managed by the Spring container. If we would not reset them,
		// stubbing and verified behavior would "leak" from one test to another.
		// service = Mockito.mock(OrderService.class);
		// validator = Mockito.mock(OrderValidator.class);
		orderController = new OrderController();
		orderController.setOrderService(service);
		orderController.setOrderValidator(validator);
		getDummyOrder();
		orders = new ArrayList<Order>();
		orders.add(order);
		BDDMockito.willReturn(order).given(service).createOrder(order);
		BDDMockito.willReturn(orders).given(service).getOrders();
		// mockMvc =
		// ContextMockMvcBuilder.MockMvcBuilders.webAppContextSetup(webApplicationContext).build();
		// mockMvc =
		// MockMvcBuilders.xmlConfigSetup("classpath:servlet-context.xml").build();

	}
	
	

	private void getDummyOrder() {
		order = new Order();
		order.setAddress1("UK");
		order.setCity("London");
		order.setDob(new Date());
		order.setPhone(new BigInteger("9978686666"));
		order.setPin("E62AJ");
		order.setOrderId(1);
		order.setProduct("Lenovo");
		order.setName("GVK");
		//return order;
	}

}
