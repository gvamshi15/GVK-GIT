package com.deloitte.digital.util;

import static org.junit.Assert.assertEquals;

import java.util.List;

import org.junit.Test;


public class FileReaderTest {
	
	private final static String INPUT_FILE = "src/test/resources/activities.txt";
	private final static String SAMPLE_TXT = "Drinks and Dinner 60min";
	private final static String SPRINT_SAMPLE_TXT = "Motivation sprint";

	@Test
	public void shouldReadAllTheLinesFromFileProvided() throws Exception {
		List<String> lines = FileReader.readLines(INPUT_FILE);
		assertEquals(20, lines.size());
		
	}
	
	@Test
	public void shouldParseLineAndReadDurationForActivity() {
		int duration = FileReader.parseLine(SAMPLE_TXT);
		assertEquals(60, duration);
	}
	
	@Test
	public void shouldParseLineAndReadDurationForSprint() {
		int duration = FileReader.parseLine(SPRINT_SAMPLE_TXT);
		assertEquals(15, duration);
	}

}
