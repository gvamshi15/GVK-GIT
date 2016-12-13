package com.deloitte.digital.util;


import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class FileReader {

	public static List<String> readLines(String inputFile) throws FileNotFoundException {
		List<String> lines = new ArrayList<>();
		try (Scanner fileScanner = new Scanner(new FileInputStream(inputFile))) {
			while (fileScanner.hasNextLine()) {
				lines.add(fileScanner.nextLine());
			}
		}
		return lines;
	}

	public static int parseLine(String line) {
		String[] words = line.split("\\s+");
		String lastWord = words[(words.length - 1)];
		int duration = 0;
		if (lastWord.endsWith("min")) {
			duration = Integer.parseInt(lastWord.substring(0, (lastWord.length() - 3)));
		} else if (lastWord.endsWith("sprint")) {
			duration = 15;
		}
		return duration;
	}

}
