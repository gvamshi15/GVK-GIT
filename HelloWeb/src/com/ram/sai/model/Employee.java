/**
 * Employee class build for the purpose of maintaining it.
 */
package com.ram.sai.model;

import java.io.File;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.web.multipart.MultipartFile;

/**
 * @author Lenovo
 *
 */
@Entity
@Table(name = "EMPLOYEE")
public class Employee {

	/**
	 * 
	 */
	public Employee() {

	}

	@NotEmpty(message = "Name should not be blank")
	@Column(name = "NAME")
	private String name;

	@NotEmpty(message = "Id should not be blank")
	@Id
	@Column(name = "EMPID")
	private Integer empId;

	@Transient
	private Integer vers;

	@Column(name = "AGE")
	private Integer age;

	@Column(name = "SALARY")
	private Double salary;

	@Column(name = "DESIGNATION")
	@NotEmpty(message = "Designation should not be blank")
	private String designation;

	@Column(name = "DEPARTMENT")
	@NotEmpty(message = "Department should not be blank")
	private String department;

	@Transient
	private String dol;
	@Transient
	private String doj;
	@Transient
	private boolean receiveNewsletter;

	@Column(name = "FAVOURITEWORD")
	private String favouriteWord;

	@Column(name = "SEX")
	@NotEmpty(message = "Sex should not be blank")
	private String sex;

	@Column(name = "PASSWORD")
	private String password;

	@Column(name = "HOUSE")
	private String house;

	@Column(name = "NOTES")
	private String notes;
	
	@Transient
	private File file_1;

	@Transient
	private MultipartFile file_2;

	@ManyToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER, targetEntity = Interests.class)
	@JoinTable(name = "EMPLOYEEINTERESTS", joinColumns = @JoinColumn(name = "EMPID"), inverseJoinColumns = @JoinColumn(name = "INTERESTID"))
	private Set<Interests> interests = new HashSet<Interests>();

	@ManyToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER, targetEntity = Skills.class)
	@JoinTable(name = "EMPSKILLS", joinColumns = @JoinColumn(name = "EMPID"), inverseJoinColumns = @JoinColumn(name = "SKILLID"))
	private Set<Skills> skills = new HashSet<Skills>();

	/**
	 * @return the name
	 */
	public String getName() {
		return name;
	}

	/**
	 * @param name
	 *            the name to set
	 */
	public void setName(String name) {
		this.name = name;
	}

	/**
	 * @return the age
	 */
	public Integer getAge() {
		return age;
	}

	/**
	 * @param age
	 *            the age to set
	 */
	public void setAge(Integer age) {
		this.age = age;
	}

	/**
	 * @return the salary
	 */
	public Double getSalary() {
		return salary;
	}

	/**
	 * @param salary
	 *            the salary to set
	 */
	public void setSalary(Double salary) {
		this.salary = salary;
	}

	/**
	 * @return the designation
	 */
	public String getDesignation() {
		return designation;
	}

	/**
	 * @param designation
	 *            the designation to set
	 */
	public void setDesignation(String designation) {
		this.designation = designation;
	}

	/**
	 * @return the department
	 */
	public String getDepartment() {
		return department;
	}

	/**
	 * @param department
	 *            the department to set
	 */
	public void setDepartment(String department) {
		this.department = department;
	}

	/**
	 * @return the dol
	 */
	// @Column(name="DOL")
	public String getDol() {
		return dol;
	}

	/**
	 * @param dol
	 *            the dol to set
	 */
	public void setDol(String dol) {
		this.dol = dol;
	}

	/**
	 * @return the doj
	 */
	// @Column(name="DOJ")
	public String getDoj() {
		return doj;
	}

	/**
	 * @param doj
	 *            the doj to set
	 */
	public void setDoj(String doj) {
		this.doj = doj;
	}

	/**
	 * @return the receiveNewsletter
	 */
	// @Column(name="NAME")
	public boolean isReceiveNewsletter() {
		return receiveNewsletter;
	}

	/**
	 * @param receiveNewsletter
	 *            the receiveNewsletter to set
	 */
	public void setReceiveNewsletter(boolean receiveNewsletter) {
		this.receiveNewsletter = receiveNewsletter;
	}

	/**
	 * @return the favouriteWord
	 */
	public String getFavouriteWord() {
		return favouriteWord;
	}

	/**
	 * @param favouriteWord
	 *            the favouriteWord to set
	 */
	public void setFavouriteWord(String favouriteWord) {
		this.favouriteWord = favouriteWord;
	}

	/**
	 * @return the sex
	 */
	public String getSex() {
		return sex;
	}

	/**
	 * @param sex
	 *            the sex to set
	 */
	public void setSex(String sex) {
		this.sex = sex;
	}

	/**
	 * @return the password
	 */
	public String getPassword() {
		return password;
	}

	/**
	 * @param password
	 *            the password to set
	 */
	public void setPassword(String password) {
		this.password = password;
	}

	/**
	 * @return the house
	 */
	public String getHouse() {
		return house;
	}

	/**
	 * @param house
	 *            the house to set
	 */
	public void setHouse(String house) {
		this.house = house;
	}

	/**
	 * @return the notes
	 */
	public String getNotes() {
		return notes;
	}

	/**
	 * @param notes
	 *            the notes to set
	 */
	public void setNotes(String notes) {
		this.notes = notes;
	}

	/**
	 * @return the file_1
	 */
	public File getFile_1() {
		return file_1;
	}

	/**
	 * @param file_1
	 *            the file_1 to set
	 */
	public void setFile_1(File file_1) {
		this.file_1 = file_1;
	}

	/**
	 * @return the file_2
	 */
	public MultipartFile getFile_2() {
		return file_2;
	}

	/**
	 * @param file_2
	 *            the file_2 to set
	 */
	public void setFile_2(MultipartFile file_2) {
		this.file_2 = file_2;
	}

	/*	*//**
	 * @return the skills
	 */
	/*
	 * public String[] getSkills() { return skills; }
	 *//**
	 * @param skills
	 *            the skills to set
	 */
	/*
	 * public void setSkills(String[] skills) { this.skills = skills; }
	 */
	public Integer getEmpId() {
		return empId;
	}

	public void setEmpId(Integer empId) {
		this.empId = empId;
	}

	/**
	 * @return the vers
	 */
	public Integer getVers() {
		return vers;
	}

	/**
	 * @param vers
	 *            the vers to set
	 */
	public void setVers(Integer vers) {
		this.vers = vers;
	}

	/**
	 * @return the interests
	 */
	public Set<Interests> getInterests() {
		return interests;
	}

	/**
	 * @param interests
	 *            the interests to set
	 */
	public void setInterests(Set<Interests> interests) {
		this.interests = interests;
	}

	/**
	 * @return the skills
	 */
	public Set<Skills> getSkills() {
		return skills;
	}

	/**
	 * @param skills
	 *            the skills to set
	 */
	public void setSkills(Set<Skills> skills) {
		this.skills = skills;
	}

	/*
	 * @Override public String toString() { return "\n Employee ID:" +
	 * this.empId + "\n Name:" + this.name + "\n Age:" + this.age +
	 * "\n Designation:" + this.designation + "\n Department" + this.department
	 * + "\n Gender:" + this.sex; }
	 */

	/*
	 * @Override public int hashCode() { final int prime = 31; int result = 1;
	 * result = prime * result + ((empId == null) ? 0 : empId.hashCode());
	 * return result; }
	 * 
	 * 
	 * @Override public boolean equals(Object obj) { if (this == obj) { return
	 * true; } if (obj == null) { return false; } if (!(obj instanceof
	 * Employee)) { return false; } Employee other = (Employee) obj; if (empId
	 * == null) { if (other.empId != null) { return false; } } else if
	 * (!empId.equals(other.empId)) { return false; } return true; }
	 */

}