package uk.co.fdb;

import static org.junit.Assert.*;

import java.lang.reflect.Field;
import java.lang.reflect.Method;

import org.junit.Before;
import org.junit.Test;

public class ConsoleChessBoardTest {

	private ConsoleChessBoard board;

	private Field currentRowField;

	private Field currentColField;

	private Field minesHitCountField;

	private Field minesField;

	private Method verifyMinesAtNewPositionMethod;

	private Method winMethod;

	private Method verifyGameFinishedMethod;

	private Field gameFinishedField;

	@Before
	public void setup() throws Exception {

		board = new ConsoleChessBoard(8, 8);
		currentRowField = board.getClass().getDeclaredField("currentrow");
		currentRowField.setAccessible(true);
		
		currentColField = board.getClass().getDeclaredField("currentcol");
		currentColField.setAccessible(true);
		
		minesHitCountField = board.getClass().getDeclaredField("minesHitCount");
		minesHitCountField.setAccessible(true);
		
		minesField = board.getClass().getDeclaredField("mines");
		minesField.setAccessible(true);
		
		gameFinishedField = board.getClass().getDeclaredField("gameFinished");
		gameFinishedField.setAccessible(true);
		
		board.setCurrentPosition("U");
		board.setCurrentPosition("R");
		// verifyMinesAtNewPosition
		verifyMinesAtNewPositionMethod = board.getClass().getDeclaredMethod("verifyMinesAtNewPosition");
		verifyMinesAtNewPositionMethod.setAccessible(true);

		winMethod = board.getClass().getDeclaredMethod("win");
		winMethod.setAccessible(true);
		
		//verifyGameFinished
		verifyGameFinishedMethod = board.getClass().getDeclaredMethod("verifyGameFinished");
		verifyGameFinishedMethod.setAccessible(true);
	}

	@Test
	public void shouldMoveUpwardsWhenIEnterU() throws Exception {
		int currentValue = currentRowField.getInt(board);
		board.setCurrentPosition("U");
		assertEquals((currentValue - 1), currentRowField.getInt(board));

	}

	@Test
	public void shouldMoveDownwardsWhenIEnterD() throws Exception {

		int currentValue = currentRowField.getInt(board);
		board.setCurrentPosition("D");
		assertEquals((currentValue + 1), currentRowField.getInt(board));

	}

	@Test
	public void shouldMoveRightWhenIEnterR() throws Exception {

		int currentValue = currentColField.getInt(board);
		board.setCurrentPosition("R");
		assertEquals((currentValue + 1), currentColField.getInt(board));

	}

	@Test
	public void shouldMoveLeftWhenIEnterL() throws Exception {

		int currentValue = currentColField.getInt(board);
		board.setCurrentPosition("L");
		assertEquals((currentValue - 1), currentColField.getInt(board));
	}

	@Test
	public void shouldHaveRandomMinesActivated() throws Exception {
		board.randomMines(8, 8);
		boolean minesActive = false;
		int mines[][] = (int[][]) minesField.get(board);
		for (int i = 0; i < 8; i++) {
			for (int j = 0; j < 8; j++) {
				if (mines[i][j] == -1) {
					minesActive = true;
				}
			}
		}
		assertTrue(minesActive);
	}

	@Test
	public void shouldIncrementMinesHitCounterWhenLandedOnMines() throws Exception {
		board.randomMines(8, 8);
		setMinesAtPosition(0, 6);
		moveCurrentPositionTo(0, 7);
		board.setCurrentPosition("U");
		verifyMinesAtNewPositionMethod.invoke(board);
		int hits = minesHitCountField.getInt(board);
		assertTrue(hits > 0);
	}

	@Test
	public void shouldLooseIfHitMinesMoreThanTwice() throws Exception {
		board.randomMines(8, 8);
		minesHitCountField.setInt(board, 3);
		Boolean win = (Boolean) winMethod.invoke(board);
		assertFalse(win);
	}

	@Test
	public void shouldWinIfHitMinesTwiceOrLess() throws Exception {
		board.randomMines(8, 8);
		minesHitCountField.setInt(board, 1);
		Boolean win = (Boolean) winMethod.invoke(board);
		assertTrue(win);
	}
	
	@Test
	public void shouldFinishTheGameIfReachedToTop() throws Exception {
		board.randomMines(8, 8);
		minesHitCountField.setInt(board, 1);
		moveCurrentPositionTo(2,0);
		verifyGameFinishedMethod.invoke(board);
		boolean isFinished = gameFinishedField.getBoolean(board);
		assertTrue(isFinished);
	}

	private void moveCurrentPositionTo(int col, int row) throws Exception {
		currentColField.set(board, col);
		currentRowField.set(board, row);
	}

	private void setMinesAtPosition(int col, int row) throws Exception {
		int mines[][] = (int[][]) minesField.get(board);
		mines[row][col] = -1;
		minesField.set(board, mines);
	}

}
