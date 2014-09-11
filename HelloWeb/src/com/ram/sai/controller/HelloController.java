/**
 * 
 */
package com.ram.sai.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * @author Lenovo
 *
 */
@Controller("/hello")
public class HelloController{
 
   @RequestMapping(method = RequestMethod.GET)
   public String printHello(ModelMap model) {
      model.addAttribute("message", "Hello from Spring MVC Framework!");
      model.addAttribute("son", System.getProperty("MySon"));
      model.addAttribute("wife", System.getProperty("MyWife"));

      return "hello";
   }
   
}