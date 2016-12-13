package uk.co.ncr;

/**
 * Enum to map arthimetic operators to texts.
 * 
 * @author Vamshi Gulapally
 */
public enum ArithmeticOperator {

	ADD("+", 1, "add"), PLUS("+", 1, "plus"),

	SUBTRACTION("-", 2, "subtract"), MINUS("-", 2, "minus"), LESS("-", 2, "less"),

	MULTIPLY("*", 3, "multiply-by"), TIMES("*", 3, "times"),

	DIVIDE("/", 4, "divide-by"), OVER("/", 4, "over");

	private String operator;

	private int precedence;

	private String operation;

	private ArithmeticOperator(String operator, int precedence, String operation) {
		this.operator = operator;
		this.precedence = precedence;
		this.operation = operation;
	}

	public String getOperator() {
		return operator;
	}

	public int getPrecedence() {
		return precedence;
	}

	public String getOperation() {
		return operation;
	}
}
