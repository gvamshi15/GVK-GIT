package com.ram.sai.business;

import com.ram.sai.model.RegistrationBean;

public class RegistrationFactory implements IntfRegistrationFactory{
	
	private RegistrationBean registrationBean;
	
	/**
	 * @return the registrationBean
	 */
	private RegistrationBean getRegistrationBean() {
		return registrationBean;
	}

	/**
	 * @param registrationBean the registrationBean to set
	 */
	public void setRegistrationBean(RegistrationBean registrationBean) {
		this.registrationBean = registrationBean;
	}

	public RegistrationBean getInstance() {
		return (this.registrationBean != null) ? getRegistrationBean() : new RegistrationBean();
	}


}
