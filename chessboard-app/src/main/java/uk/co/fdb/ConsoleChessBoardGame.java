package uk.co.fdb;


/**
 * Console Chess Board Application
 * @author GULAPALLY
 *
 */
public class ConsoleChessBoardGame {

	private static final int NO_OF_COLS = 8;
	private static final int NO_OF_ROWS = 8;

	public static void main(String[] args) throws Exception {
		ConsoleChessBoard board = new ConsoleChessBoard(NO_OF_ROWS,NO_OF_COLS);
		board.randomMines(NO_OF_ROWS,NO_OF_COLS);
		board.displayBoard();
		board.play();
	}

}
