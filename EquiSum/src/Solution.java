
public class Solution {

	public int solution(int[] a) {
		int size = a.length;
		Long sum = 0L;
		for (int index = 0; index < size; index++) {
			sum += a[index];
		}
		Long prefixSum = 0L;
		for (int index = 0; index < size; index++) {
			prefixSum += a[index];
			Long suffixSum = 0L;
			if ((index + 1) != size) {
				suffixSum = sum - (prefixSum + a[(index + 1)]);
			} else {
				suffixSum = sum - (prefixSum);
			}
			if (suffixSum == prefixSum) {
				return (index + 1);
			}
		}
		if ((sum - a[(size - 1)]) == 0) {
			return (size - 1);
		}

		return -1;
	}

	public static void main(String args[]) {

		int index = new Solution().solution(new int[] { -1, 3, -4, 5, 1, -6, 2, 1 });
		System.out.println("index" + index);

	}

}
