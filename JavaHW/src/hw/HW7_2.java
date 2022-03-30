package hw;

import java.util.Scanner;

public class HW7_2 {
	public static void main(String[] args) {
	
		Scanner sc = new Scanner(System.in);
		System.out.println("정수 x : ");
		int x = sc.nextInt();
		System.out.println(HW7_2.singOf(x));
		System.out.println(HW7_2.min(1, 2, 3));
	}
	
	static int singOf(int x) {
		int res;
		if(x==0) {
			res=0;
		}else if(x>0){
			res=1;
		}else {
			res=-1;
		}
		return res;
	}
	
	static int min(int a, int b, int c) {
		int min = a;
		if (min>b) min=b;
		if (min>c) min=c;
		return min;
	}
}
