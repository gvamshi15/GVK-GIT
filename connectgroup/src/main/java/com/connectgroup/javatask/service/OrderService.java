/**
 * 
 */
package com.connectgroup.javatask.service;

import java.util.List;

import com.connectgroup.javatask.dom.Order;

/**
 * @author Lenovo
 *
 */
public interface OrderService {

	public Order createOrder(Order order);
	
	public List<Order> getOrders();

}
