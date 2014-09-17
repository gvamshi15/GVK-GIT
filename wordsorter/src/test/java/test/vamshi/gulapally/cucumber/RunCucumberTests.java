/**
 * 
 */
package test.vamshi.gulapally.cucumber;

import org.junit.runner.RunWith;

import cucumber.api.junit.Cucumber;

/**
 * @author Lenovo
 *
 */
@RunWith(Cucumber.class)
@Cucumber.Options(format = { "pretty", "html:target/cucumber.html" }, features = { "src/test/java/test/vamshi/gulapally/cucumber/feature/" })
public class RunCucumberTests {

}
