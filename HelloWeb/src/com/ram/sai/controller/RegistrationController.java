package com.ram.sai.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.ram.sai.business.IntfRegistrationFactory;
import com.ram.sai.business.RegistrationValidator;
import com.ram.sai.business.SpringException;
import com.ram.sai.model.RegistrationBean;

@Controller
@SessionAttributes("registrationBean")
public class RegistrationController {

	@Autowired
	private IntfRegistrationFactory intfRegistrationFactory;

	@Autowired
	private RegistrationValidator registrationValidator;

	@InitBinder
	private void initBinder(WebDataBinder binder) {
		binder.setValidator(registrationValidator);
		binder.validate();
	}
	
	@RequestMapping("/registration")
	public RegistrationBean setup(RegistrationBean registrationBean, ModelMap map, SessionStatus status) {
		registrationBean = intfRegistrationFactory.getInstance();
		return registrationBean;
	}
	
/*	@RequestMapping("/registration")
	public ModelAndView registration() {
		return new ModelAndView("registration", "command",
				intfRegistrationFactory.getInstance());
	}*/

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	@ExceptionHandler({SpringException.class})
	public String register(RegistrationBean registrationBean,SessionStatus status,
			BindingResult result) {
		//registrationValidator.validate(registrationBean, result);
		if (result.hasErrors()) {
			return "redirect:registration";
		} else {
			intfRegistrationFactory.setRegistrationBean(registrationBean);
			status.setComplete();
			return "redirect:success";
		}
	}
	
	@RequestMapping(value = "/success")
	public String success(RegistrationBean registrationBean,
			BindingResult result) {
		return "success";
	}

	/*
	 * @Override protected ModelAndView onSubmit(Object command, BindException
	 * errors) throws Exception { ModelAndView mv = new ModelAndView();
	 * if(errors.hasErrors()){ mv.setViewName(getFormView()); }else{
	 * mv.addObject("Registration", command); mv.setViewName(getSuccessView());
	 * } return mv; }
	 */

}
