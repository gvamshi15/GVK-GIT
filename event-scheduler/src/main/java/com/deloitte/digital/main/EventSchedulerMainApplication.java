/**
 * 
 */
package com.deloitte.digital.main;

import com.deloitte.digital.domain.Activity;
import com.deloitte.digital.scheduler.ActivityScheduler;
import com.deloitte.digital.scheduler.Scheduler;

/**
 * @author GULAPALLY
 *
 */
public class EventSchedulerMainApplication {

	/**
	 * @param args
	 * @throws Exception 
	 */
	public static void main(String[] args) throws Exception {
		Scheduler<Activity> eventScheduler = new ActivityScheduler();
		eventScheduler.writer(eventScheduler.processor(eventScheduler.reader(args[0])));
	}

}
