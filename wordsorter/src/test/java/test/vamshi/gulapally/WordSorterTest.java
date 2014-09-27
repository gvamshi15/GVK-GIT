package test.vamshi.gulapally;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;


public class WordSorterTest {

	BufferedReader reader;
	WordSorter wordSorter;

	@Before
	public void setup() throws Throwable {
		reader = new BufferedReader(new FileReader("test.txt"));
		wordSorter = new WordSorter(reader);
	}

	@After
	public void tearDown() throws Throwable {
		reader.close();
	}

	@Test
	public void test_ReadFiles_Sort_Count_Words() throws Throwable {
		// Try to open the file
		wordSorter.wordSort();
		wordSorter.displayResult();
	}

	@Test(expected = IOException.class)
	public void test_ReadUnknownFiles() throws Throwable {
		// Try to open the file
		reader = new BufferedReader(new FileReader("unknowntest.txt"));
		wordSorter = new WordSorter(reader);
		// wordSorter.readSplitSortFile();
	}

}
