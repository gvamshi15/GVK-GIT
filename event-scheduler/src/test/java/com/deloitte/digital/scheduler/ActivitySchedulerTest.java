package com.deloitte.digital.scheduler;

import static org.junit.Assert.assertEquals;

import java.util.List;

import org.junit.Test;

import com.deloitte.digital.domain.Activity;
import com.deloitte.digital.scheduler.ActivityScheduler;
import com.deloitte.digital.scheduler.Scheduler;

public class ActivitySchedulerTest {

	private final static String INPUT_FILE = "src/test/resources/activities.txt";

	@Test
	public void shouldreadActivitiesFromInputFile() throws Exception {
		int expectedLines = 20;
		int actualLines = readActivities().size();
		assertEquals(expectedLines, actualLines);
	}

	@Test
	public void shouldScheduleActivitiesAmongTeamsIdentified() throws Exception {
		int expectedlines = 2;
		Scheduler<Activity> scheduler = new ActivityScheduler();
		List<List<Activity>> outputLines = scheduler.processor(readActivities());
		assertEquals(expectedlines, outputLines.size());
	}

	private List<Activity> readActivities() throws Exception {
		return new ActivityScheduler().reader(INPUT_FILE);
	}

}
