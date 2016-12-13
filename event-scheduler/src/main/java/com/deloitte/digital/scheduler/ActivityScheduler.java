package com.deloitte.digital.scheduler;

import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import com.deloitte.digital.domain.Activity;
import com.deloitte.digital.util.FileReader;

/**
 * Helper class to read activities from a file, schedule and output the activities.
 * 
 * @author GULAPALLY
 */
public class ActivityScheduler implements Scheduler<Activity> {

	private static final LocalTime ACTIVITY_START_TIME = LocalTime.of(9, 00);

	private static final String LUNCH_BREAK_ACTIVITY = "Lunch Break 60min";

	private static final LocalTime LUNCH_BREAK_TIME = LocalTime.of(12, 00);

	private static final int LUNCH_BREAK_DURATION = 60;

	private static final String STAFF_MOTIVATION_SPRINT = "Staff Motivation Presentation";

	private static final LocalTime STAFF_MOTIVATION_SPRINT_TIME = LocalTime.of(17, 00);

	private static final int DEFAULT_SPRINT_DURATION = 15;

	private static final double MAX_TOTAL_DURATION_PER_DAY = 420.0;

	private static final DateTimeFormatter TIMEFORMATTER = DateTimeFormatter.ofPattern("hh:mm a");

	@Override
	public List<Activity> reader(String inputFile) throws Exception {
		List<Activity> activities = new ArrayList<Activity>();
		List<String> lines = FileReader.readLines(inputFile);
		lines.stream().forEach(line -> {
			activities.add(new Activity(line, FileReader.parseLine(line)));
		});
		return activities;
	}

	@Override
	public List<List<Activity>> processor(List<Activity> inputLines) {
		List<List<Activity>> scheduledActivites = new ArrayList<>();
		for (int count = 0; count < identifyTeams(inputLines); count++) {
			List<Activity> subList = new ArrayList<Activity>();
			int totalScheduled = 0;
			for (Iterator<Activity> iterator = inputLines.iterator(); iterator.hasNext();) {
				Activity activity = (Activity) iterator.next();
				if (!activity.isScheduled() && (totalScheduled + activity.getDuration()) <= MAX_TOTAL_DURATION_PER_DAY) {
					activity.setScheduled(true);
					totalScheduled = totalScheduled + activity.getDuration();
					subList.add(activity);
				}
			}

			scheduledActivites.add(count, allocate(subList));
		}
		return scheduledActivites;
	}

	@Override
	public void writer(List<List<Activity>> outputLines) {
		for (int count = 0; count < outputLines.size(); count++) {
			List<Activity> teamActivities = outputLines.get(count);
			System.out.println("Team-" + (count + 1));
			for (Activity activity : teamActivities) {
				System.out.println(activity.getStartTime() + " : " + activity.getActivity());
			}
			System.out.println("");
		}
	}

	private int identifyTeams(List<Activity> totalLines) {
		Integer totalDuration = totalLines.stream().mapToInt(Activity::getDuration).sum();
		return (int) Math.ceil(totalDuration / MAX_TOTAL_DURATION_PER_DAY);
	}

	private List<Activity> allocate(List<Activity> teamActivities) {
		List<Activity> subList = new ArrayList<Activity>();
		LocalTime activityTime = ACTIVITY_START_TIME;
		boolean isLunchBreakAdded = false;
		for (Iterator<Activity> iterator = teamActivities.iterator(); iterator.hasNext();) {
			Activity activity = (Activity) iterator.next();

			if (!isLunchBreakAdded && activityTime.plusMinutes(activity.getDuration()).isAfter(LUNCH_BREAK_TIME)) {
				isLunchBreakAdded = true;
				Activity lunchBreakActivity = lunchBreakActivity();
				lunchBreakActivity.setStartTime(activityTime.format(TIMEFORMATTER));
				activityTime = activityTime.plusMinutes(lunchBreakActivity.getDuration());
				subList.add(lunchBreakActivity);
			}
			activity.setStartTime(activityTime.format(TIMEFORMATTER));
			activityTime = activityTime.plusMinutes(activity.getDuration());
			subList.add(activity);
		}
		subList.add(defaultActivity());
		return subList;
	}

	private Activity defaultActivity() {
		return new Activity(STAFF_MOTIVATION_SPRINT, DEFAULT_SPRINT_DURATION, STAFF_MOTIVATION_SPRINT_TIME.format(TIMEFORMATTER));
	}

	private Activity lunchBreakActivity() {
		return new Activity(LUNCH_BREAK_ACTIVITY, LUNCH_BREAK_DURATION);
	}

}
