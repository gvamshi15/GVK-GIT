$(document).ready(function() {var formatter = new CucumberHTML.DOMFormatter($('.cucumber-report'));formatter.uri('test\vamshi\gulapally\cucumber\feature\wordsorter.feature');
formatter.feature({
  "id": "sorting-and-counting-words-from-files",
  "description": "",
  "name": "Sorting and Counting Words from Files",
  "keyword": "Feature",
  "line": 1
});
formatter.scenario({
  "id": "sorting-and-counting-words-from-files;wordsorter-should-split-the-text-in-multiple-lines-into-words-and-display-count-of-words-and-processing-time",
  "description": "",
  "name": "WordSorter should split the text in multiple lines into words and display count of words and processing time",
  "keyword": "Scenario",
  "line": 3,
  "type": "scenario"
});
formatter.step({
  "name": "a test file test.txt",
  "keyword": "Given ",
  "line": 4
});
formatter.step({
  "name": "WordSorter is run",
  "keyword": "When ",
  "line": 5
});
formatter.step({
  "name": "the output of the program should display all words and processing time.",
  "keyword": "Then ",
  "line": 6
});
formatter.match({
  "location": "WordSorterStepDefinitions.a_test_file_test_txt()"
});
formatter.result({
  "duration": 320661079,
  "status": "pending",
  "error_message": "cucumber.runtime.PendingException: TODO: implement me\r\n\tat test.vamshi.gulapally.cucumber.WordSorterStepDefinitions.a_test_file_test_txt(WordSorterStepDefinitions.java:18)\r\n\tat ✽.Given a test file test.txt(test\\vamshi\\gulapally\\cucumber\\feature\\wordsorter.feature:4)\r\n"
});
formatter.match({
  "location": "WordSorterStepDefinitions.WordSorter_is_run()"
});
formatter.result({
  "status": "skipped"
});
formatter.match({
  "location": "WordSorterStepDefinitions.the_output_of_the_program_should_display_all_words_and_processing_time()"
});
formatter.result({
  "status": "skipped"
});
});