/**
 * 
 */
package com.sai.springframework;

import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.Set;


/**
 * @author Lenovo
 *
 */
public class SpringFirst{

	/**
	 * 
	 */
	public SpringFirst() {
		// TODO Auto-generated constructor stub
	}
	
	private List myList;
	private Set mySet;
	private Map myMap;
	private Properties myProps;
	private String myAll;
	
	/**
	 * @return the myList
	 */
	public List getMyList() {
		return myList;
	}
	/**
	 * @param myList the myList to set
	 */
	public void setMyList(List myList) {
		this.myList = myList;
	}
	/**
	 * @return the mySet
	 */
	public Set getMySet() {
		return mySet;
	}
	/**
	 * @param mySet the mySet to set
	 */
	public void setMySet(Set mySet) {
		this.mySet = mySet;
	}
	/**
	 * @return the myMap
	 */
	public Map getMyMap() {
		return myMap;
	}
	/**
	 * @param myMap the myMap to set
	 */
	public void setMyMap(Map myMap) {
		this.myMap = myMap;
	}
	/**
	 * @return the myProps
	 */
	public Properties getMyProps() {
		return myProps;
	}
	/**
	 * @param myProps the myProps to set
	 */
	public void setMyProps(Properties myProps) {
		this.myProps = myProps;
	}
	
	public void getAll()
	{
		System.out.println("Map-"+myMap+" and Props" + myProps + "and Set-" + mySet + "and List -"+myList);
	}
	/**
	 * @return the myAll
	 */
	public String getMyAll() {
		return myAll;
	}
	/**
	 * @param myAll the myAll to set
	 */
	public void setMyAll(String myAll) {
		this.myAll = myAll;
	}
	/**
	 * @param mySet
	 */
	public SpringFirst(Set mySet) {
		this.mySet = mySet;
	}
	/**
	 * @param myAll
	 */
	public SpringFirst(String myAll) {
		this.myAll = myAll;
	}




	/*@Override
	public void afterPropertiesSet() throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void destroy() throws Exception {
		// TODO Auto-generated method stub
		
	}*/

}
