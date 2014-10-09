/**
 * 
 */
package com.connectgroup.javatask.dao;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.connectgroup.javatask.dom.Order;


/**
 * @author Lenovo
 *
 */
public class OrderInMemoryDaoImpl implements OrderInMemoryDao {

	private static final Logger logger = LoggerFactory
			.getLogger(OrderInMemoryDaoImpl.class);

	@Autowired
	public SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public void createOrder(Order order) throws HibernateException {
		try {
			logger.info("OrderInMemoryDaoImpl - " + order.getName() + "-"
					+ order.getOrderId());
			sessionFactory.getCurrentSession().save(order);
		} catch (Exception e) {
			logger.error("OrderInMemoryDaoImpl - " + order.getName() + "-"
					+ order.getOrderId());
			logger.error("OrderInMemoryDaoImpl - " + e.getMessage());
			throw new HibernateException(e);
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Order> getOrders() {
		List<Order> list = null;
		try {
			//return (List<Order>) sessionFactory.getCurrentSession().createCriteria(Order.class).list();
			list = 	(List<Order>)sessionFactory.getCurrentSession().createQuery("from Order").list();
			for (Order order : list) {
				logger.info(order.toString());
			}
			
		} catch (Exception e) {
			logger.error("OrderInMemoryDaoImpl - " + e.getMessage());
		}
		return list;
	}

}
