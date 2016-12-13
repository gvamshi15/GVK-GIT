
package com.deloitte.digital.domain;

public class Activity {

	private String activity;

	private int duration;

	private boolean isScheduled;

	private String startTime;

	public Activity(String activity, int duration) {
		super();
		this.activity = activity;
		this.duration = duration;
	}

	public Activity(String activity, int duration, String startTime) {
		super();
		this.activity = activity;
		this.duration = duration;
		this.startTime = startTime;
	}


	/**
	 * @return the activity
	 */
	public String getActivity() {
		return activity;
	}

	/**
	 * @param activity the activity to set
	 */
	public void setActivity(String activity) {
		this.activity = activity;
	}

	/**
	 * @return the duration
	 */
	public int getDuration() {
		return duration;
	}

	/**
	 * @param duration the duration to set
	 */
	public void setDuration(int duration) {
		this.duration = duration;
	}

	/**
	 * @return the isScheduled
	 */
	public boolean isScheduled() {
		return isScheduled;
	}

	/**
	 * @param isScheduled the isScheduled to set
	 */
	public void setScheduled(boolean isScheduled) {
		this.isScheduled = isScheduled;
	}

	/**
	 * @return the startTime
	 */
	public String getStartTime() {
		return startTime;
	}

	/**
	 * @param startTime the startTime to set
	 */
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

}
