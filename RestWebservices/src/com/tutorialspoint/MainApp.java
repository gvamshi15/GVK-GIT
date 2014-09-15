package com.tutorialspoint;

import org.apache.log4j.Logger;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class MainApp {
	static Logger log = Logger.getLogger(MainApp.class.getName());
   public static void main(String[] args) {
	      log.info("Going to create HelloWord Obj");
	   @SuppressWarnings("resource")
	ConfigurableApplicationContext context = 
             new ClassPathXmlApplicationContext("spring.xml");
	       
	   Student student = (Student) context.getBean("student");

	      student.getName();
	      student.getAge();
	      
	      //student.printThrowException();


	      log.info("Exiting the program");
   }

}