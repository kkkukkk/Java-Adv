package hw;

import java.util.Scanner;

public class JavaHW22 {
	public static void main(String[] args) {
		int n = Func.getN(); // 범위 안으로 n 값을 받기 위해
		int m = Func.getM(); // 범위 안으로 m 값을 받기 위해
		int x = 1; // A의 x좌표
		int y = 1; // A의 y좌표
		
		int[] xy = Func.moveA(x, y, n, m); // A의 위치를 이동하는 메소드
		Func.chkArr(xy); // A의 현재 좌표 공백으로 구분하여 출력하는 메소드
		System.out.println();
		
		
		// A위치 확인
		x = xy[0]; // 이동한 후 얻은 배열로부터 x,y 좌표 얻어오기
		y = xy[1];
		int[][] arr = new int[n][n]; // N X N 2차원 배열
		arr[y-1][x-1] = 1; 			 // 현재 A가 위치한 곳이 1 나머지 0
		Func.chkArr(arr);			 // 출력
	}
}

class Func{ // 기능들을 모아놓은 클래스, static으로 객체 없이 사용
	
	static int getN() { // 범위 안으로 N값을 받는 메소드
		Scanner sc = new Scanner(System.in);
		int n;
		while (true) {
			System.out.print("공간의 크기 N X N (1 <= N <= 100) : ");
			n = Integer.parseInt(sc.nextLine());
			if (n < 1 || n > 100) { // 해당 범위 바깥이면 오류 throw 
				try {throw new ArithmeticException("범위 바깥입니다.");}
				catch (ArithmeticException e) {System.out.println(e.getMessage());}
			}else break; // 제대로 입력했을 경우 반복 종료
		}
		return n; // n값 리턴
	}// 메소드 닫는 중괄호
	
	static int getM() { // 위와 출력 문장이 달라서 다른 메소드로, 기능은 동일
		Scanner sc = new Scanner(System.in);
		int m;
		while (true) {
			System.out.print("이동 횟수 M (1 <= M <= 100) : ");
			m = Integer.parseInt(sc.nextLine());
			if (m < 1 || m > 100) {
				try {throw new ArithmeticException("범위 바깥입니다.");}
				catch (ArithmeticException e) {System.out.println(e.getMessage());}
			}else break;
		}
		return m;
	}// 메소드 닫는 중괄호
	
	static int[] moveA(int x, int y, int n, int m) { // A를 이동시키는 메소드
		Scanner sc = new Scanner(System.in);
		int[] arr = new int[2]; // x,y 값을 저장할 배열
		for (int i = 0; i < m; i++) { // 이동회수 m만큼 반복
			System.out.print("이동방향 입력 (L,U,R,D) : ");
			String dir = (sc.nextLine()).toUpperCase(); //대소문자 구분x
			
			if (dir.equals("L")) x--; 		// 왼쪽은 x를 -1
			else if (dir.equals("U")) y--; 	// 위쪽은 y를 -1
			else if (dir.equals("R")) x++;	// 오른쪽은 x를 +1
			else if (dir.equals("D")) y++;	// 아래쪽은 y를 +1
			else {
				System.out.println("잘못 입력!"); // 다른 걸 입력할 경우
				i--; // 이동 횟수 감소 안하기 위해
			}
			
			x = Func.chkArg(x, n); // 1,1 혹은 n,n을 벗어나지 않기 위해 체크
			y = Func.chkArg(y, n);
			
		}
		arr[0] = x;	// 0번쨰 인덱스에 x좌표
		arr[1] = y; // 1번째 인덱스에 y좌표
		return arr; // array를 리턴
	}// 메소드 닫는 중괄호
	
	static int chkArg(int k, int n) { // 현재 값과 범위를 받아서
		if(k <= 1)	{ 		// 1보다 작거나 같으면
			k = 1;	  		// 1로
		}else if(k > n) { 	// n보다 크면
			k = n;		  	// n으로
		}
		return k;			// k값을 리턴
	}// 메소드 닫는 중괄호

	
	static void chkArr(int[] arr) { // x,y 값을 받아서 출력하는 메소드
		for(int each : arr) {
			System.out.print(each+" ");
		}
		System.out.println();
	}// 메소드 닫는 중괄호
	
	static void chkArr(int[][] arr) { // 현재 A위치 출력을 위한 메소드
		for (int[] is : arr) {
			for (int each : is) {
				System.out.print(each);
			}
			System.out.println();
		}
	}// 메소드 닫는 중괄호

}// 클래스 닫는 중괄호	

