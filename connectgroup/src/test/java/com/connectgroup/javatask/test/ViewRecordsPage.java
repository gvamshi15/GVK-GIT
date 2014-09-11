package com.connectgroup.javatask.test;

import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;

public class ViewRecordsPage extends SeleniumConfig{

	public WebElement createOrder()
	{
		return driver.findElement((By.linkText("Create Order")));
	}

	
}
