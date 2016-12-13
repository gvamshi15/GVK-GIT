
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class Solution4 {

	public int solution(String str) {
		if (str == null || str.isEmpty()) {
			return -1;
		}
		List<String> passwords = new ArrayList<>();
		for (char ch : str.toCharArray()) {
			passwords.add(String.valueOf(ch));
		}
		passwords.addAll(getPasswords(str));
		if (passwords.size() == 0) {
			return -1;
		} else {
			return passwords.size();
		}
		// write your code in Java SE 8
	}

	private List<String> getPasswords(String str) {
		Set<String> passwords = new HashSet<String>();
		for (int index = 0; index < str.length(); index++) {
			StringBuilder sb = new StringBuilder();
			String subString = str.substring(index);
			for (char ch : subString.toCharArray()) {
				// if (Character.isUpperCase(ch)) {
				sb.append(ch);
				// found = true;
				//passwords.add(String.valueOf(ch));
				String subStr = sb.toString();
				if (subStr.length() > 1) {
					passwords.add(subStr);
				}

			}
		}
		return new ArrayList<String>(passwords);
	}
	
	//"0", "2", "0", "0", "2", "00", "020", "200", "002", "2002", "02002"
//0, 2, 0, 0, 2, 00, 02, 200, 002, 0200, 2002, 02002, 020, 20
	public static void main(String args[]) {
		System.out.println(new Solution4().solution("02002"));
		//System.out.println(new Solution4().solution("a0bb"));
		//System.out.println(new Solution4().solution("aBb"));
		//System.out.println(new Solution4().solution("a0Ba1aBb"));
	}

}
