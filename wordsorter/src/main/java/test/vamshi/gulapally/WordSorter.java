/**
 * 
 */
package test.vamshi.gulapally;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Collections;
import java.util.List;

/**
 * @author Vamshi Gulapally
 *
 */
public class WordSorter {

	/**
	 * @param args
	 *            command line arguments
	 */
	public static void main(String[] args) {

		// If the number of arguments is incorrect: 
		if (args.length != 1) {
			System.out.println("Usage: WordSorter file");
			System.exit(1);
		}
		
		try {

			WordSorter wordSorter = new WordSorter();
			wordSorter.processFile(args[0]);
		} catch (IOException e) {
			//If the specified file does not exist or cannot be read:
			System.out.print("Invalid File:{" + args[0] + "}");
			System.exit(1);
		}

	}

	
	/**
	 * Process the File, reads line by line, split each line at every space and 
	 * converts into list of words, sort the list and and finally print the words
	 * 
	 * @param fileName file name which is passed as command line argument
	 * @throws IOException exception thrown when file not found or invalid file
	 */
	public void processFile(String fileName) throws IOException {

		String inputLine = null;
		List<String> wordsList = new ArrayList<String>();

		// Get startTime in milliseconds
		Calendar calendar = Calendar.getInstance();
		long startTime = calendar.getTimeInMillis();

		// Read each line of the file and split at every space and add into collection.
		BufferedReader bufferedReader = new BufferedReader(new FileReader(fileName));
		while ((inputLine = bufferedReader.readLine()) != null) {
			wordsList.addAll(Arrays.asList(inputLine.split("\\s+")));
		}
		bufferedReader.close();
		
		// Sort and print
		Collections.sort(wordsList);
		for (String word : wordsList) {
			System.out.println(word);
		}

		// Calcute endTime and find difference to get the duration of process
		calendar = Calendar.getInstance();
		long endTime = calendar.getTimeInMillis();
		long processingTime = endTime - startTime;
		System.out.println("Processed " + wordsList.size() + " words in "
				+ processingTime + "ms");

	}

}
