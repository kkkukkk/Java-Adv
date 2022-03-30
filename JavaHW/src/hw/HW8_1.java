package hw;

public class HW8_1 {
	public static void main(String[] args) {
		System.out.println(HW8_1.med(2, 2, 8));
		
		int[][] a = new int[2][3];
		
		a[1][2] = 1;
		
		for (int[] is : a) {
			for(int each : is) {
				System.out.print(each);
			}
			System.out.println();
		}
	}
	
	static int med(int a, int b, int c) {
		int res;
		int[] arr = {a,b,c};
		for (int i = 0; i < arr.length-1; i++) {
			if(arr[i]>arr[i+1]) {
			res = arr[i];
			arr[i] = arr[i+1];
			arr[i+1] = res;
			}
		}
		res = arr[1];
		return res;
	}
}
