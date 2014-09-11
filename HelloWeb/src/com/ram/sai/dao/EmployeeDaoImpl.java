/**
 * 
 */
package com.ram.sai.dao;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import com.ram.sai.business.SpringException;
import com.ram.sai.model.Employee;
import com.ram.sai.model.Interests;
import com.ram.sai.model.Skills;

/**
 * @author Lenovo
 *
 */
@Transactional
public class EmployeeDaoImpl implements EmployeeDao {

	@Autowired
	private SessionFactory sessionFactory;

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.ram.sai.dao.EmployeeDAO#addEmployee(com.ram.sai.model.Employee)
	 */
	@Override
	public Object addEmployee(Employee employee) throws SpringException {
		// Object obj1;
		try {
			sessionFactory.getCurrentSession().saveOrUpdate(employee);
		} catch (Exception e) {
			throw new SpringException(e.getMessage());
		}
		return employee;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Employee> loadEmployees() throws SpringException {
		try {
			List<Employee> list = (List<Employee>)sessionFactory.getCurrentSession().createQuery("from Employee").list();
			return list;
		} catch (Exception e) {
			throw new SpringException(e.getMessage());
		}
	}

	@Override
	public Employee loadEmployee(Integer empno) throws SpringException {
		try {
			return (Employee) sessionFactory.openSession().load(
					Employee.class, empno);
		} catch (Exception e) {
			throw new SpringException(e.getMessage());
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Skills> loadSkills() throws SpringException {
		try {
			List<Skills> list = (List<Skills>)sessionFactory.getCurrentSession().createQuery("FROM Skills").list();
			return list;
		} catch (Exception e) {
			throw new SpringException(e.getMessage());
		}
	}

	@Override
	public Skills loadSkill(int skillId) throws SpringException{
		try {
		return (Skills) sessionFactory.getCurrentSession().load(Skills.class, skillId);
	} catch (Exception e) {
		throw new SpringException(e.getMessage());
	}
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Interests> loadInterests() throws SpringException{
		try {
			List<Interests> list = (List<Interests>)sessionFactory.getCurrentSession().createQuery("FROM Interests").list();
			return list;
		} catch (Exception e) {
			throw new SpringException(e.getMessage());
		}
	}

	@Override
	public Interests loadInterest(int interestId) throws SpringException{
		try {
		return (Interests) sessionFactory.getCurrentSession().load(Interests.class, interestId);
		} catch (Exception e) {
			throw new SpringException(e.getMessage());
		}
	}
	
/*	@Override
	public List<Interests> loadEmployeeInterests(int empId) {
		try {
			List<Interests> list = (List<Interests>)sessionFactory.getCurrentSession().createQuery("from Interests").list();
			return list;
		} catch (Exception e) {
			throw new SpringException(e.getMessage());
		}
		return (Interests) sessionFactory.getCurrentSession().load(Interests.class, empId);
	}*/

}
