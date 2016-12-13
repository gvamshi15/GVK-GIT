package uk.co.ncr;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class NaturalCalculator {

	private static final Map<String, Integer> numberMap = new HashMap<>();
	private static final Map<String, ArithmeticOperator> operatorMap = new HashMap<>();

	/**
	 * Default constructor.
	 */
	public NaturalCalculator() {
		Arrays.stream(Numeral.values()).forEach(value -> numberMap.put(value.getNumeral(), value.getNumber()));
		Arrays.stream(ArithmeticOperator.values()).forEach(value -> operatorMap.put(value.getOperation(), value));
	}

	/**
	 * Parses and splits the input string and perform calculation on tokens
	 * @param inputString
	 * @return result
	 */
	public String calculate(String inputString) {
		String input = inputString.toLowerCase();
		String[] tokens = input.split("\\s+");
		return performCalculation(new ArrayList<String>(Arrays.asList(tokens)));
	}

	/*
	 * private boolean isNumberToken(String token) { return
	 * numberMap.containsKey(token); }
	 */

	/**
	 * Checks if given token is a valid operator token or not.
	 * @param tokens
	 * @return true if valid
	 */
	private boolean isOperatorToken(String token) {
		return operatorMap.containsKey(token);
	}

	/**
	 * Finds index of highest precedence operator.
	 * @param tokens
	 * @return index of the highest precedence operator
	 */
	private int detectHighestPrecedenceToken(List<String> tokens) {
		int result = 0;
		int highestprecedence = 0;
		for (int index = 0; index < tokens.size(); index++) {
			String currentToken = tokens.get(index);
			if (isOperatorToken(currentToken)) {
				int currentPrecedence = operatorMap.get(currentToken).getPrecedence();
				if (highestprecedence < currentPrecedence) {
					highestprecedence = currentPrecedence;
					result = index;
				}
			}
		}
		return result;
	}

	/**
	 * Performs recursive calculation on all remaining tokens until all operators are applied on the operands.
	 * 
	 * @param tokens
	 *            list of tokens to be processed
	 * @return result
	 */
	private String performCalculation(List<String> tokens) {
		List<String> processedList = process(tokens);
		int currentSize = processedList.size();
		if (currentSize == 1) {
			return new DecimalFormat("0.##").format(Double.valueOf(processedList.get(0)));
		} else {
			return performCalculation(processedList);
		}

	}

	/**
	 * Identifies the index of highest precedence operator from the list of
	 * tokens and operates on the previous and next operands, removes and replaces result with the processed tokens.
	 * 
	 * @param tokens
	 *            list of tokens to be processed
	 * @return list of remaining tokens
	 */
	private List<String> process(List<String> tokens) {
		int tokenIndex = detectHighestPrecedenceToken(tokens);
		
		//parses operator token
		String operator = operatorMap.get(tokens.get(tokenIndex)).getOperator();
		
		//get the number tokens, previous and next token
		String operand1 = tokens.get(tokenIndex - 1);
		String operand2 = tokens.get(tokenIndex + 1);
		
		//parses previous and next number tokens
		double op1 = numberMap.get(operand1) != null ? Double.valueOf(numberMap.get(operand1))
				: Double.valueOf(operand1);
		double op2 = numberMap.get(operand2) != null ? Double.valueOf(numberMap.get(operand2))
				: Double.valueOf(operand2);
		
		//performs calculation by applying the operator on operands
		double result = operate(operator, op1, op2);
		
		//replace and remove processed tokens, sets the result of calculation inplace of tokens
		tokens.set(tokenIndex - 1, String.valueOf(result));
		tokens.remove(tokenIndex);
		tokens.remove(tokenIndex);
		return tokens;
	}
	
	/**
	 * Applies operator on the operands.
	 * @param operator operator
	 * @param op1 first operand
	 * @param op2 second operand
	 * @return result
	 */
	private double operate(String operator, double op1, double op2) {
		double result = 0.0;
		switch (operator) {
		case "+":
			result = op1 + op2;
			break;
		case "-":
			result = op1 - op2;
			break;
		case "/":
			result = op1 / op2;
			break;
		case "*":
			result = op1 * op2;
			break;
		default:
			break;
		}
		return result;
	}

}
