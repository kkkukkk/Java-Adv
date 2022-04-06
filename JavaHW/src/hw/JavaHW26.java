package hw;

import java.util.*;

public class JavaHW26 {
	static int n;
	static int m;
	static int[][] maze;
	static Scanner sc = new Scanner(System.in);
	
	public static void main(String[] args) {
		String[] tmp = getValue();
		n = Integer.parseInt(tmp[0]);
		m = Integer.parseInt(tmp[1]);
		getMaze();
		
		/*
		Queue<Integer> q = new LinkedList<Integer>();
		*/
		
		
	}
	
	static String[] getValue() {
		String[] tmp = sc.nextLine().split(" ");
		return tmp;
	}//메닫중
	
	static int[][] getMaze(){
		maze = new int[n][m];
		for (int i = 0; i < n; i++) {
			String[] line = sc.nextLine().split("");			
			for (int j = 0; j < m; j++) {
				maze[i][j] = Integer.parseInt(line[j]);
			}
		}
		return maze;
	}//메닫중
	
	
	
	
	
	
	
}//클닫중
