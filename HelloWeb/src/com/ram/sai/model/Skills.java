/**
 * 
 */
package com.ram.sai.model;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.Table;


/**
 * @author Lenovo
 *
 */
@Entity
@Table(name = "SKILLS")
public class Skills implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	@Column(name="SKILLID")
	private int skillId;
	@Column(name="SKILL")
	private String skill;
	@ManyToMany(cascade=CascadeType.ALL, fetch=FetchType.EAGER, targetEntity=Employee.class ,mappedBy="skills")
	private Set<Employee> employees = new HashSet<Employee>();
	

	/**
	 * 
	 */
	public Skills() {
		super();
	}
	
	/**
	 * @param skillId
	 * @param skill
	 */
	public Skills(int skillId, String skill) {
		super();
		this.skillId = skillId;
		this.skill = skill;
	}

	/**
	 * @return the skillId
	 */
	public int getSkillId() {
		return skillId;
	}
	/**
	 * @param skillId the skillId to set
	 */
	public void setSkillId(int skillId) {
		this.skillId = skillId;
	}
	
	/**
	 * @return the skill
	 */
	public String getSkill() {
		return skill;
	}
	/**
	 * @param skill the skill to set
	 */
	public void setSkill(String skill) {
		this.skill = skill;
	}

	/**
	 * @return the employees
	 */
	public Set<Employee> getEmployees() {
		return employees;
	}
	/**
	 * @param employees the employees to set
	 */
	public void setEmployees(Set<Employee> employees) {
		this.employees = employees;
	}
	
/*	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + skillId;
		return result;
	}*/

	 
/*	@Override
	public boolean equals(Object obj) {
		if (this == obj) {
			return true;
		}
		if (obj == null) {
			return false;
		}
		if (!(obj instanceof Skills)) {
			return false;
		}
		Skills other = (Skills) obj;
		if (skillId != other.skillId) {
			return false;
		}
		return true;
	}*/

}
