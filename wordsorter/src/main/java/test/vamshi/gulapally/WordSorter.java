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

	private BufferedReader reader = null;
	private List<String> wordsList = null;
	Long startTime = null;
	Long endTime = null;

	public List<String> getWordsList() {
		return wordsList;
	}

	public WordSorter(BufferedReader reader) {
		this.reader = reader;
		wordsList = new ArrayList<String>();
	}

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
			BufferedReader bufferedReader = new BufferedReader(new FileReader(
					args[0]));
			WordSorter wordSorter = new WordSorter(bufferedReader);

			wordSorter.wordSort();

			wordSorter.displayResult();
		} catch (IOException e) {
			// If the specified file does not exist or cannot be read:
			System.out.print("Invalid File:{" + args[0] + "}");
			System.exit(1);
		}

	}

	/**
	 * Process the File, reads line by line, split each line at every space and
	 * converts into list of words, sort the list and and finally print the
	 * words
	 * 
	 * @param fileName
	 *            file name which is passed as command line argument
	 * @throws IOException
	 *             exception thrown when file not found or invalid file
	 */
	public void wordSort() throws IOException {

		String inputLine = null;

		// Get startTime in milliseconds
		startTime = Calendar.getInstance().getTimeInMillis();

		// Read each line of the file and split at every space and add into
		// collection.
		while ((inputLine = reader.readLine()) != null) {
			wordsList.addAll(Arrays.asList(inputLine.split("\\s+")));
		}
		reader.close();

		// Sort and print
		Collections.sort(wordsList);
		endTime = Calendar.getInstance().getTimeInMillis();
	}

	public void displayResult() {

		for (String word : wordsList) {
			System.out.println(word);
		}

		// Calcute difference between to get the duration of process
		System.out.println("Processed " + wordsList.size() + " words in "
				+ (endTime - startTime) + "ms");
	}

}
