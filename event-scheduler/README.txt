Assumptions:
- assumed all the input in the text file either ends with "min" or "sprint"
 
About the Solution:
-Have created simple maven java project using java8, and junit
-No external libraries or frameworks (ex:Spring) are used
-Test driven the solution
-Solution is extensible
 
Steps to Run:
- Unzip the folder, and import the maven project into IDE
- Run mvn clean install to build the jar
- navigate to target folder
- run the java application 
- java -cp event-scheduler-0.0.1-SNAPSHOT.jar com.deloitte.digital.main.EventSchedulerMainApplication <full path of activities.txt>