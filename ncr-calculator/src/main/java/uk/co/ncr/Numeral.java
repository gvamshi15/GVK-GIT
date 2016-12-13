package uk.co.ncr;

/**
 * Enum to map numbers to numerals.
 * 
 * @author Vamshi Gulapally
 */
public enum Numeral {

	one("one", 1), two("two", 2), three("three", 3), four("four", 4), five("five", 5), six("six", 6),
	seven("seven", 7), eight("eight", 8), nine("nine", 9), zero("zero", 0);

	private int number;;
	private String numeral;

	private Numeral(String numeral, int number) {
		this.number = number;
		this.numeral = numeral;
	}

	public int getNumber() {
		return number;
	}

	public String getNumeral() {
		return numeral;
	}
};
