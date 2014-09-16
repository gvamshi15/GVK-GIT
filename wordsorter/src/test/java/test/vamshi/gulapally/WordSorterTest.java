package test.vamshi.gulapally;

import static org.junit.Assert.fail;

import java.io.IOException;

import org.junit.Test;

public class WordSorterTest {

	@Test
	public void test_ReadFiles_Sort_Count_Words() {
		// Try to open the file
		WordSorter wordSorter = new WordSorter();
		try {
			wordSorter.processFile("wordsfile.txt");
		} catch (IOException e) {
			fail("Unexpected Exception" +e.getMessage());
		}
	}
	
	@Test(expected=IOException.class)
	public void test_ReadUnknownFiles() throws IOException{
		// Try to open the file
		WordSorter wordSorter = new WordSorter();
		wordSorter.processFile("unknown.txt");
	}

}
