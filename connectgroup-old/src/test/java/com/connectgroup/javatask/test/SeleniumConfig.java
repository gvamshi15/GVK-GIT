package com.connectgroup.javatask.test;

import java.util.concurrent.TimeUnit;
import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.firefox.FirefoxDriver;


public class SeleniumConfig {

	public static WebDriver driver;
	public static String URL= "http://localhost:8080/connectgroup/";

	@BeforeClass
	public static void Start()
	{
		driver = new FirefoxDriver();
		driver.manage().timeouts().implicitlyWait(30, TimeUnit.SECONDS);
		driver.get(URL);
		driver.manage().window().maximize();		
	}
	
	@AfterClass
	public static void Stop()
	{
		driver.quit();
	}
	
}
