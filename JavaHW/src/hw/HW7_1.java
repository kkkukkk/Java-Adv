package hw;

import java.util.Random;
import java.util.Scanner;

public class HW7_1 {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		Random rd = new Random();
		
		int[][] arr1 = new int[4][3];
		int[][] arr2 = new int[3][4];
		int[][] arr3 = new int[4][4];
		System.out.println("행렬 A");
		for (int i = 0; i < 4; i++) {
			for (int j = 0; j < 3; j++) {
				System.out.print("a["+i+"]"+"["+j+"] : ");
				arr1[i][j]=sc.nextInt();
			}
		}
		System.out.println("행렬 B");
		for (int i = 0; i < 3; i++) {
			for (int j = 0; j < 4; j++) {
				System.out.print("a["+i+"]"+"["+j+"] : ");
				arr2[i][j]=sc.nextInt();
			}
		}
		
		for (int i = 0; i < 4; i++) {
			for (int j = 0; j < 4; j++) {
				arr3[i][j] = 0;
				for (int k = 0; k < 3; k++) {
					arr3[i][j] += arr1[i][k]*arr2[k][j];
				}
			}
		}
		
		System.out.println("행렬 곱 ");
		for (int i = 0; i < 4; i++) {
			for (int j = 0; j < 4; j++) {
				System.out.printf("5%d",arr3[i][j]);
			}
			System.out.println();
		}
		
		
	}
}
