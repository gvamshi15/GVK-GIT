/**
 * 
 */
package com.sai.springframework;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/**
 * @author Lenovo
 *
 */
public class SpringTest {

	/**
	 * @param args
	 */
	@SuppressWarnings("resource")
	public static void main(String[] args) {
		String configLocations = "spring.xml";
		//Set set1 = new HashSet();
		ApplicationContext context = new ClassPathXmlApplicationContext(configLocations );
		SpringFirst springFirst = (SpringFirst) context.getBean("springFirst");
		springFirst.getAll();
		System.out.println(springFirst.getMyAll());
		
		SpringFirst springFirst1 = (SpringFirst) context.getBean("springFirst1");
		System.out.println(springFirst1.getMySet());
		System.out.println("Id of Context" + context.getId());
	}

}
