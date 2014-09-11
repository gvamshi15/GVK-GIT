/**
 * 
 */
package com.ram.sai.business;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.ram.sai.model.Employee;
import com.ram.sai.model.Interests;
import com.ram.sai.model.Skills;

/**
 * @author Lenovo
 *
 */
public interface EmployeeManager {
	

	    public Employee getInstance() ;
	    
	    public void setEmployee(Employee employee);
	    
	    @Transactional
	    public Object addEmployee(Employee employee);
	    
	    public List<Employee> loadEmployees() throws SpringException;
		
		public Employee loadEmployee(Integer empno) throws SpringException;

		public List<Skills> loadSkills();

		public Skills loadSkill(int skillId);

		public List<Interests> loadInterests();

		public Interests loadInterest(int interestId);

}
