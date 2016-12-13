package com.deloitte.digital.scheduler;

import java.util.List;

public interface Scheduler<T> {

	public List<T> reader(String input) throws Exception;

	public List<List<T>> processor(List<T> inputLines);

	public void writer(List<List<T>> outputLines);

}
