/**
 * 
 */
package com.ram.sai.business;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import com.ram.sai.dao.EmployeeDao;
import com.ram.sai.model.Employee;
import com.ram.sai.model.Interests;
import com.ram.sai.model.Skills;

/**
 * @author Lenovo
 *
 */
public class EmployeeManagerImpl implements EmployeeManager {

	private Employee employee;
	
	@Autowired
	private EmployeeDao employeeDao;

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.ram.sai.business.EmployeeManager#getInstance()
	 */
	@Override
	public Employee getInstance() {
		return (this.employee != null) ? getEmployee() : new Employee();
	}

	/**
	 * @return the employee
	 */
	private Employee getEmployee() {
		return employee;
	}

	@Override
	public void setEmployee(Employee employee) {
		this.employee = employee;
	}

	@Override
	@Transactional
	public Object addEmployee(Employee employee) {
		return employeeDao.addEmployee(employee);
	}

	@Override
	public List<Employee> loadEmployees() throws SpringException {
		return employeeDao.loadEmployees();
	}

	@Override
	public Employee loadEmployee(Integer empno) throws SpringException {
		return employeeDao.loadEmployee(empno);
	}

	@Override
	public List<Skills> loadSkills() {
		return employeeDao.loadSkills();
	}

	@Override
	public Skills loadSkill(int skillId) {
		return employeeDao.loadSkill(skillId);
	}

	@Override
	public List<Interests> loadInterests() {
		return employeeDao.loadInterests();
	}
	
	@Override
	public Interests loadInterest(int interestId) {
		return employeeDao.loadInterest(interestId);
	}
	
}
