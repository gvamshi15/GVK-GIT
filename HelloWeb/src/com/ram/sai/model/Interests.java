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


@Entity
@Table(name = "INTERESTS")
public class Interests implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Integer interestId;
	private String interest;
	private Set<Employee> employees = new HashSet<Employee>();
	
	/**
	 * 
	 */
	public Interests() {
		super();
	}
	
	/**
	 * @param interestId
	 * @param interest
	 */
	public Interests(Integer interestId, String interest) {
		super();
		this.interestId = interestId;
		this.interest = interest;
	}
	
	/**
	 * @return the interestId
	 */
	@Id
	@Column(name="INTERESTID")
	public Integer getInterestId() {
		return interestId;
	}
	/**
	 * @param interestId the interestId to set
	 */
	public void setInterestId(Integer interestId) {
		this.interestId = interestId;
	}
	
	/**
	 * @return the interest
	 */
	@Column(name="INTEREST")
	public String getInterest() {
		return interest;
	}
	/**
	 * @param interest the interest to set
	 */
	public void setInterest(String interest) {
		this.interest = interest;
	}
	
	/**
	 * @return the employees
	 */
	@ManyToMany(cascade=CascadeType.ALL,fetch=FetchType.EAGER,targetEntity=Employee.class,mappedBy="interests")
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
		result = prime * result
				+ ((interestId == null) ? 0 : interestId.hashCode());
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
		if (!(obj instanceof Interests)) {
			return false;
		}
		Interests other = (Interests) obj;
		if (interestId == null) {
			if (other.interestId != null) {
				return false;
			}
		} else if (!interestId.equals(other.interestId)) {
			return false;
		}
		return true;
	}*/

}
