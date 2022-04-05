package hw;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Scanner;

public class test {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);

		ArrayList<String> list1 = new ArrayList<>();
		ArrayList<Integer> list2 = new ArrayList<>();

		String[] numSet1 = sc.nextLine().split(" ");
		String[] numSet2 = sc.nextLine().split(" ");

		for(String each: numSet1) {
			if(!list1.contains(each)) list1.add(each);
		}
		for(String each: numSet2) {
			if(!list1.contains(each)) list1.add(each);
		}
		for(String each: list1) {
			list2.add(Integer.parseInt(each));
		}
		Collections.sort(list2);
		System.out.println(list2);
		
	}
}
