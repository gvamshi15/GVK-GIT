package com.ram.sai.business;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.ram.sai.model.RegistrationBean;

public class RegistrationValidator implements Validator {

	public boolean supports(Class<?> c) {
		return RegistrationBean.class.isAssignableFrom(c);
	}

	public void validate(Object command, Errors errors) {
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "name", "field.name.empty");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "username", "field.username.empty");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "email", "field.email.empty");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "phone", "field.phone.empty");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password", "field.password.empty");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "rePassword", "field.rePassword.empty");
		RegistrationBean regBean = (RegistrationBean)command;
		if(null != regBean.getPassword() && null != regBean.getRePassword() && (!regBean.getPassword().equals(regBean.getRePassword())))
			errors.rejectValue("rePassword","password.notmatch");
		if(regBean.getPhone().trim().length() != 10)
			errors.rejectValue("phone","field.phone.length");
		if(!isNumber(regBean.getPhone().trim()))
			errors.rejectValue("phone", "field.phone.NAN");
	}

	private boolean isNumber(String str){
	    for (int i = 0; i < str.length(); i++) {
	        
	        //If we find a non-digit character we return false.
	        if (!Character.isDigit(str.charAt(i)))
	        return false;
	        }
	         
	        return true;
	}
}
