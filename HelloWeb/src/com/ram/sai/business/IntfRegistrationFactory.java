/**
 * 
 */
package com.ram.sai.business;

import com.ram.sai.model.RegistrationBean;

/**
 * @author Lenovo
 *
 */
public interface IntfRegistrationFactory {
	
	public void setRegistrationBean(RegistrationBean registrationBean);
	
	public RegistrationBean getInstance();

}
