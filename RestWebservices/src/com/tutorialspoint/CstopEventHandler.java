package com.tutorialspoint;

import org.springframework.context.ApplicationEvent;
import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextClosedEvent;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.context.event.ContextStartedEvent;
import org.springframework.context.event.ContextStoppedEvent;

public class CstopEventHandler 
   implements ApplicationListener<ApplicationEvent>{

   public void onApplicationEvent(ApplicationEvent event) {
	   if (event.getClass().equals(ContextRefreshedEvent.class))
		      System.out.println("Context Refresh Event Received" + event.getClass());
	  if (event.getClass().equals(ContextStoppedEvent.class))
      System.out.println("Context Stopped Event Received" + event.getClass());
	  if (event.getClass().equals(ContextStartedEvent.class))
	      System.out.println("Context Start Event Received" + event.getClass());
	  if (event.getClass().equals(ContextClosedEvent.class))
	      System.out.println("Context Closed Event Received" + event.getClass());
   }
}