package test.vamshi.gulapally.cucumber;

import static org.junit.Assert.fail;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;

import org.junit.After;

import test.vamshi.gulapally.WordSorter;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;

public class WordSorterStepDefinitions {

	BufferedReader reader = null;
	WordSorter wordSorter = null;

	@Given("^a test file test\\.txt$")
	public void shouldProvideTestFile() throws Throwable {
		// Write code here that turns the phrase above into concrete actions
		reader = new BufferedReader(new FileReader("test.txt"));
		wordSorter = new WordSorter(reader);
	}

	@When("^WordSorter is run$")
	public void shouldRunWordSorter() throws Throwable {
		// Write code here that turns the phrase above into concrete actions
		// throw new PendingException();
		wordSorter.wordSort();
	}

	@Then("^the output of the program should display all words$")
	public void shouldDisplayAllWords() throws Throwable {
		// Write code here that turns the phrase above into concrete actions
		// throw new PendingException();
	}

	@Then("^display processing time took\\.$")
	public void display_processing_time_took() throws Throwable {
		// Write code here that turns the phrase above into concrete actions
		// throw new PendingException();
		reader.close();
	}

}
