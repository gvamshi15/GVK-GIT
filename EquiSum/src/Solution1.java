
import java.util.HashSet;
import java.util.Set;

public class Solution1 {

	public int solution(String str) {
		if (str == null || str.isEmpty()) {
			return -1;
		}
		Set<String> passwords = new HashSet<String>();
		StringBuilder sb = new StringBuilder();
		boolean found = false;
		for (char c : str.toCharArray()) {
			if (!Character.isDigit(c)) {
				sb.append(c);
				if (Character.isUpperCase(c)) {
					found = true;
				}
			} else if (Character.isDigit(c)) {
				if (found) {
					passwords.addAll(passwords(sb.toString()));
				}
				sb = new StringBuilder();
				found = false;
			}
		}
		if (found) {
			passwords.addAll(passwords(sb.toString()));
		}
		
		if (passwords.size() == 0) {
			return -1;
		} else {
			System.out.println("possible passwords for [" + str + "] : "+ passwords);
			return passwords.size();
		}
		// write your code in Java SE 8
	}

	private Set<String> passwords(String str) {
		Set<String> passwords = new HashSet<String>();

		boolean found = false;
		for (int index = 0; index < str.length(); index++) {
			StringBuilder sb = new StringBuilder();
			String subString = str.substring(index);
			found = false;
			for (char ch : subString.toCharArray()) {
				if (Character.isUpperCase(ch)) {
					sb.append(ch);
					found = true;
					passwords.add(String.valueOf(ch));
					String subStr = sb.toString();
					if (subStr.length() > 1) {
						passwords.add(subStr);
					}
				} else {
					sb.append(ch);
				}
			}
			if (found) {
				passwords.add(sb.toString());
			}
		}
		return passwords;
	}

	public static void main(String args[]) {
		System.out.println(new Solution1().solution("a0Ba"));
		System.out.println(new Solution1().solution("a0bb"));
		System.out.println(new Solution1().solution("aBb"));
		System.out.println(new Solution1().solution("a0Ba1aBb"));
		System.out.println(new Solution1().solution("a0Ba1aBbCd"));
	}

}
