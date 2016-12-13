package com.deloitte.digital.main;

import org.junit.Test;


public class EventSchedulerMainApplicationTest {

	@Test
	public void shouldSuccessfullyRunMainApplication() throws Exception {
		EventSchedulerMainApplication.main(new String[] {"src/test/resources/activities.txt"});
	}

}
