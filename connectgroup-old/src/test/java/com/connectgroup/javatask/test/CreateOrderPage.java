package com.connectgroup.javatask.test;

import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;

public class CreateOrderPage extends SeleniumConfig {

	public WebElement customerName()
	{
		return driver.findElement(By.id("name"));
		
	}
	public WebElement dob()
	{
		return driver.findElement((By.id("dob")));
	}
	
	public WebElement month(int i)
	{
		return driver.findElement(By.xpath("//*[@id='ui-datepicker-div']/div/div/select[1]/option["+ i +"]"));
	}
	
	public WebElement year(int i)
	{
		return driver.findElement(By.xpath("//*[@id='ui-datepicker-div']/div/div/select[2]/option["+ i +"]"));
	}

	public WebElement mobile()
	{
		return driver.findElement(By.id("phone"));
		
	}
	public WebElement address()
	{
		return driver.findElement(By.id("address1"));
		
	}
	public WebElement city()
	{
		return driver.findElement(By.id("city"));
		
	}
	public WebElement postCode()
	{
		return driver.findElement(By.id("pin"));
		
	}
	public WebElement product(int i)
	{
		return driver.findElement(By.xpath("//*[@id='product']/option["+ i +"]"));
		
	}
	public WebElement quantity()
	{
		return driver.findElement(By.id("quantity"));
		
	}
	public WebElement Termsandcondition()
	{
		return driver.findElement(By.id("cb"));
		
	}
	public WebElement Create()
	{
		return driver.findElement(By.xpath("//*[@id='order']/fieldset[3]/div[3]/input"));
		
	}
	
	
}
