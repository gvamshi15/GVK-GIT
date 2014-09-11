/**
 * 
 */
package com.connectgroup.javatask.dao;

import java.util.List;

import com.connectgroup.javatask.dom.Order;

/**
 * @author Lenovo
 *
 */
public interface OrderInMemoryDao {
	
	/**
	 * Create Customer Order with Customer Details
	 * @param order to be created
	 */
	public void createOrder(Order order);
	

	/**
	 * Gets all the orders from in-memory database
	 * @return orders list from in-memory database
	 */
	public List<Order> getOrders();

}
