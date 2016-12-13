/**
 * 
 */
package uk.co.fdb;

import java.util.Random;
import java.util.Scanner;

/**
 * @author GULAPALLY
 *
 */
public class ConsoleChessBoard implements Board {

	private static final int NO_OF_LAND_MINES = 10;

	private static final String WHITE_SQUARE_SYMBOL = "-";

	private static final String BLACK_SQUARE_SYMBOL = "#";

	private static final String PLAYER_SYMBOL = "P";

	private static final int NO_OF_SYMBOLS_PERSQUARE = 3;

	private static final int START_COL_INDEX = 0;

	private int width, height, square, currentrow, currentcol;

	private int[][] mines;

	private int minesHitCount;

	private Scanner input = new Scanner(System.in);

	private Random random = new Random();

	private boolean gameFinished;

	public ConsoleChessBoard(int width, int height) {
		super();
		this.width = width;
		this.height = height;
		square = NO_OF_SYMBOLS_PERSQUARE;
		currentrow = height - 1;
		currentcol = START_COL_INDEX;
		gameFinished = false;
		mines = new int[width][height];
		minesHitCount = 0;
	}

	@Override
	public void play() throws Exception {
		while (!gameFinished) {
			System.out.println("Choose Next move (U, D, R L): ");
			String move = input.next();
			setCurrentPosition(move.toUpperCase());
			verifyMinesAtNewPosition();
			displayBoard();
			verifyGameFinished();
		}

	}

	public void setCurrentPosition(String move) {
		int newposition;
		switch (move) {
		case "U":
			newposition = this.currentrow - 1;
			if (newposition < 0) {
				System.out.println("Invalid Move");
			} else {
				this.currentrow = newposition;
			}
			break;
		case "D":
			newposition = this.currentrow + 1;
			if (newposition >= height) {
				System.out.println("Invalid Move");
			} else {
				this.currentrow = newposition;
			}
			break;
		case "L":
			newposition = this.currentcol - 1;
			if (newposition < 0) {
				System.out.println("Invalid Move");
			} else {
				this.currentcol = newposition;
			}
			break;
		case "R":
			newposition = this.currentcol + 1;
			if (newposition >= width) {
				System.out.println("Invalid Move");
			} else {
				this.currentcol = newposition;
			}
			break;
		default:
			System.out.println("Invalid Move");
			break;
		}

	}

	@Override
	public void displayBoard() throws Exception {
		System.out.println("");
		for (int rowIndex = 0; rowIndex < height; rowIndex++) {

			for (int rowSquareIndex = 0; rowSquareIndex < square; rowSquareIndex++) {
				
				for (int columnIndex = 0; columnIndex < width; columnIndex++) {

					for (int columnSquareIndex = 0; columnSquareIndex < square; columnSquareIndex++) {
						if ((rowIndex == currentrow && columnIndex == currentcol)) {
							if (rowSquareIndex == 1 && columnSquareIndex == 1) {
								System.out.print(PLAYER_SYMBOL);
							} else {
								System.out.print(" ");
							}
						} else {
							if ((rowIndex % 2 == 0) && (columnIndex % 2 == 0)) {
								System.out.print(BLACK_SQUARE_SYMBOL);
							} else if ((rowIndex % 2 == 1) && (columnIndex % 2 == 1)) {
								System.out.print(BLACK_SQUARE_SYMBOL);
							} else { // even row/odd column or odd row/even column
								System.out.print(WHITE_SQUARE_SYMBOL);
							}
						}
					}
				}
				System.out.println("");
			}
		}
	}

	public void randomMines(int rows, int columns) {
		boolean raffled;
		int Line, Column;
		for (int i = 0; i < NO_OF_LAND_MINES; i++) {

			do {
				Line = random.nextInt(rows);
				Column = random.nextInt(columns);

				if (mines[Line][Column] == -1)
					raffled = true;
				else
					raffled = false;
			} while (raffled);

			mines[Line][Column] = -1;
		}
	}

	private void verifyGameFinished() {
		if (currentrow == 0) {
			gameFinished = true;
			System.out.println("\n Game finished !!!!");
			System.out.println(" You have " + (win() ? "won" : "lost"));
		}
	}

	private void verifyMinesAtNewPosition() {
		if ((mines[currentrow][currentcol] == -1)) {
			minesHitCount++;
			System.out.println("Oops landed on mine, landed " + minesHitCount + " times so far");
		}
	}

	private boolean win() {
		System.out.println("landed on mines " + minesHitCount + " times so far");
		return (minesHitCount <= 2);
	}

}
