/**
 * 
 */
package com.ram.sai.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * @author Lenovo
 *
 */
@Controller
public class RedirectController {

	/*
	 * @RequestMapping(value="/page2",params="index",method=RequestMethod.GET)
	 * public String index() { return "index"; }
	 */

	@RequestMapping(value = "/page2", method = RequestMethod.GET)
	/*public String handleReqString(HttpServletRequest request){*/
	public String handleReqString(
			@RequestParam(required = false, value = "index") String indexFlag,
			@RequestParam(required = false, value = "employee") String employeeFlag) {
		
		if (indexFlag != null) {
			return "redirect:index";
		} else if (employeeFlag != null) {
			return "redirect:employee";
		}
		/*while (request.getParameterNames().hasMoreElements())
		{
			//return "forward:"+ request.getParameterNames().nextElement();
			return "redirect:"+ request.getParameterNames().nextElement();
		}*/
		return null;
	}
	
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index() {
		return "index";
	}

	@RequestMapping(value = "/redirect", method = RequestMethod.GET)
	public String redirect() {
		return "redirect:finalPage";
	}

	@RequestMapping(value = "/finalPage", method = RequestMethod.GET)
	public String finalPage() {
		return "final";
	}

}
