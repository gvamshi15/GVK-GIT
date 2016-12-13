package uk.co.ncr;

import static org.junit.Assert.*;

import org.junit.Test;

/**
 * @author Vamshi Gulapally
 *
 */
public class NaturalCalculatorTest {

	@Test
	public void shouldPerformCalculationWhenNumbersPassedAsWordsTest1() {
		//Given
		String inputString = "nine over eight plus four times two divide-by three";
		
		//When
		String actual = new NaturalCalculator().calculate(inputString);
		String expected = "3.79";
		
		//Then
		assertEquals(expected, actual);
	}
	
	@Test
	public void shouldPerformCalculationWhenNumbersPassedAsWordsTest2() {
		//Given
		String inputString = "one plus two";
		
		//When
		String actual = new NaturalCalculator().calculate(inputString);
		String expected = "3";
		
		//Then
		assertEquals(expected, actual);
	}
	
	@Test
	public void shouldPerformCalculationWhenNumbersPassedAsWordsTest3() {
		//Given
		String inputString = "one plus two times three";
		
		//When
		String actual = new NaturalCalculator().calculate(inputString);
		String expected = "7";
		
		//Then
		assertEquals(expected, actual);
	}
	
	@Test
	public void shouldPerformCalculationWhenNumbersPassedAsWordsTest4() {
		//Given
		String inputString = "nine minus three times seven";
		
		//When
		String actual = new NaturalCalculator().calculate(inputString);
		String expected = "-12";
		
		//Then
		assertEquals(expected, actual);
	}
	
	@Test
	public void shouldPerformCalculationWhenNumbersPassedAsWordsTest5() {
		//Given
		String inputString = "four minus eight plus six times nine";
		
		//When
		String actual = new NaturalCalculator().calculate(inputString);
		String expected = "50";
		
		//Then
		assertEquals(expected, actual);
	}
	
	@Test
	public void shouldPerformCalculationWhenNumbersPassedAsWordsTest6() {
		//Given
		String inputString = "seven over nine plus one";
		
		//When
		String actual = new NaturalCalculator().calculate(inputString);
		String expected = "1.78";
		
		//Then
		assertEquals(expected, actual);
	}

}
