Feature: Sorting and Counting Words from Files
 
Scenario: WordSorter should split the text in multiple lines into words and display count of words and processing time
Given a test file test.txt
When WordSorter is run
Then the output of the program should display all words and processing time.
