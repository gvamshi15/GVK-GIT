/**
 * 
 */
package test.vamshi.gulapally.cucumber;

import static org.junit.Assert.fail;

import org.junit.Test;
import org.junit.runner.RunWith;

import cucumber.junit.Cucumber;

/**
 * @author Lenovo
 *
 */
@RunWith(Cucumber.class)
@Cucumber.Options(format={"pretty", "html:target/cucumber"})
public class RunCucumberTests {

	@Test
	public final void test() {
		fail("Not yet implemented"); // TODO
	}
	
}
