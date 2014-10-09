/**
 * 
 */
package com.connectgroup.javatask.test;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;

/**
 * @author Lenovo
 *
 */
public class OrderPage {

	public static WebElement nameElement(WebDriver driver) {
		return driver.findElement(By.name("name"));
	}

	public static WebElement dateElement(WebDriver driver) {
		return driver.findElement(By.name("dob"));
	}

	public static WebElement phoneElement(WebDriver driver) {
		return driver.findElement(By.name("phone"));
	}

	public static WebElement pinElement(WebDriver driver) {
		return driver.findElement(By.name("pin"));
	}
	
	public static WebElement productElement(WebDriver driver) {
		return driver.findElement(By.name("product"));
	}

	public static WebElement submitButtonElement(WebDriver driver) {
		return driver.findElement(By.id("create"));
	}

}
