import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Scanner;
import java.util.stream.Collectors;

public class Solution2 {

	public String solution(String str) {
		List<String> lines = readLines(str);
		Map<String, Integer> callmaps = parsePhoneLogs(lines).stream().collect(Collectors.groupingBy(PhoneLog::getPhoneno, Collectors.summingInt(PhoneLog::getCallTime)));
		System.out.println("Phone Logs: " + callmaps);
		return callmaps.entrySet().stream().max(Map.Entry.comparingByValue()).map(Map.Entry::getKey).get();
	}

	private List<PhoneLog> parsePhoneLogs(List<String> lines) {

		List<PhoneLog> callList = new ArrayList<>();
		for (String line : lines) {
			String[] tokens = line.split(",");
			LocalTime localTime = LocalTime.parse(tokens[0], DateTimeFormatter.ISO_TIME);
			Double callTime = (double) ((localTime.getHour() * 60.0) + localTime.getMinute() + (double) (localTime.getSecond() / 60.0));
			callList.add(new PhoneLog(tokens[1], callTime.intValue()));
		}
		return callList;
	}

	private List<String> readLines(String source) {
		List<String> lines = new ArrayList<>();
		try (Scanner fileScanner = new Scanner(source)) {
			while (fileScanner.hasNextLine()) {
				lines.add(fileScanner.nextLine());
			}
		}
		return lines;
	}

	private class PhoneLog {

		private String phoneno;

		private int callTime;

		public PhoneLog(String phoneno, int callTime) {
			super();
			this.phoneno = phoneno;
			this.callTime = callTime;
		}

		/**
		 * @return the phoneno
		 */
		public String getPhoneno() {
			return phoneno;
		}

		/**
		 * @return the callTime
		 */
		public int getCallTime() {
			return callTime;
		}

		/*
		 * (non-Javadoc)
		 * 
		 * @see java.lang.Object#toString()
		 */
		@Override
		public String toString() {
			return "PhoneLog [phoneno=" + phoneno + ", callTime=" + callTime + "]";
		}

		/*
		 * (non-Javadoc)
		 * 
		 * @see java.lang.Object#hashCode()
		 */
		@Override
		public int hashCode() {
			final int prime = 31;
			int result = 1;
			result = prime * result + getOuterType().hashCode();
			result = prime * result + callTime;
			result = prime * result + ((phoneno == null) ? 0 : phoneno.hashCode());
			return result;
		}

		/*
		 * (non-Javadoc)
		 * 
		 * @see java.lang.Object#equals(java.lang.Object)
		 */
		@Override
		public boolean equals(Object obj) {
			if (this == obj)
				return true;
			if (obj == null)
				return false;
			if (getClass() != obj.getClass())
				return false;
			PhoneLog other = (PhoneLog) obj;
			if (!getOuterType().equals(other.getOuterType()))
				return false;
			if (callTime != other.callTime)
				return false;
			if (phoneno == null) {
				if (other.phoneno != null)
					return false;
			} else if (!phoneno.equals(other.phoneno))
				return false;
			return true;
		}

		private Solution2 getOuterType() {
			return Solution2.this;
		}

	}

	public static void main(String args[]) {
		String logs = "00:30:46,748-025-2040\n" +
				"01:30:49,744-254-2818\n" +
				"00:30:46,744-254-2818\n" +
				"01:30:49,748-025-2040\n" +
				"00:50:46,746-749-8398\n" +
				"01:50:49,746-749-8398\n" +
				"00:20:46,746-749-8398\n" +
				"01:20:49,746-749-8398";
		System.out.println(new Solution2().solution(logs));
	}

}
