package uk.co.ncr;

import java.util.Scanner;

/**
 * @author Vamshi Gulapally
 *
 */
public class NaturalCalculatorMain {

	public static void main(String[] args) {
		String calculation = null;
		System.out.println("Please enter a calculation:");
		try (Scanner scanner = new Scanner(System.in)) {
			calculation = scanner.nextLine();
		}
		String result = new NaturalCalculator().calculate(calculation);
		System.out.format("Result: %s", result);
	}

}
