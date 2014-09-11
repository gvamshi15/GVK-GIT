/**
 * 
 */
package com.ram.sai.dao;

import java.util.List;

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
public interface EmployeeDao {

	public Object addEmployee(Employee employee) throws SpringException;
	
	public List<Employee> loadEmployees() throws SpringException;
	
	public List<Skills> loadSkills() throws SpringException;
	
	public Employee loadEmployee(Integer empno) throws SpringException;

	public Skills loadSkill(int skillId) throws SpringException;

	public List<Interests> loadInterests() throws SpringException;

	public Interests loadInterest(int interestId) throws SpringException;

}
