/**
 * 
 */
package com.connectgroup.javatask.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.connectgroup.javatask.dao.OrderInMemoryDao;
import com.connectgroup.javatask.dom.Order;

/**
 * @author Lenovo
 *
 */
@Service("employeeService")
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
public class OrderServiceImpl implements OrderService {
	private static final Logger logger = LoggerFactory
			.getLogger(OrderServiceImpl.class);

	@Autowired
	public OrderInMemoryDao OrderInMemoryDao;

	/**
	 * @param orderInMemoryDao
	 *            the orderInMemoryDao to set
	 */
	public void setOrderInMemoryDao(OrderInMemoryDao orderInMemoryDao) {
		OrderInMemoryDao = orderInMemoryDao;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * com.connectgroup.javatask.service.OrderService#createOrder(com.connectgroup
	 * .javatask.vo.Order)
	 */
	@Override
	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public Order createOrder(Order order) {
		try {
			logger.info("OrderServiceImpl - Transaction is being initiated"
					+ order.getOrderId() + "Customer Name" + order.getName());
			OrderInMemoryDao.createOrder(order);
		} catch (Exception e) {
			logger.error("OrderServiceImpl - Transaction is being initiated"
					+ order.getOrderId() + "Customer Name" + order.getName());
		}
		return order;			
	}
	
	public List<Order> getOrders() {
		return OrderInMemoryDao.getOrders();
	}

}
