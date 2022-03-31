package hw;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class JavaHW24 {
	static int n;			// m과 n을 static으로 선언하여 클래스 내에서 동일한 값으로 사용
	static int m;
	
	static int[][] makeIceMold() throws IOException { // n X m 배열 생성을 위한 메소드
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in)); // input을 위한 객체
		int[][] iceMold = new int[n][m];	// n X m 크기의 정수형 2차원 배열
		for (int i = 0; i < n; i++) {					
			String[] line = br.readLine().split("");	// 입력한 문자열을 한글자씩 String[] 배열에 저장
			for (int j = 0; j < m; j++) {
				iceMold[i][j] = Integer.parseInt(line[j]); // 배열에 저장된 글자를 하나씩 2차원 배열에 저장
			}
		}
		return iceMold;							// 2차원 배열 리턴
	}//메소드 닫는 중괄호
	
	static int cntIce(int[][] iceMold) {
		int cnt = 0;									// 개수를 저장할 변수
		for (int i = 0; i < n; i++) {					// iceMold 전체 범위에서 
			for (int j = 0; j < m; j++) {				
				if(dfs(i,j, iceMold) == 1) cnt++;		// dfs() 결과가 1이면 cnt 값 1 증가
			}
		}
		return cnt;										// cnt값 리턴
	}//메닫중
	
	static int dfs(int i, int j, int[][] iceMold) { 	// 반복문의 i,j 값과 배열을 매개변수로 받는 메소드
		int flag = 0;									// flag 변수를 0으로 선언
		if (i < 0 || j < 0 || i >= n || j >= m) return flag;	// i와 j가 0보다 작거나 각 n,m 보다 클 경우 범위 바깥이므로 0 리턴 
		else if (iceMold[i][j] == 0) { 	//	iceMold의 i,j번째 인덱스 값이 0일경우
			iceMold[i][j] = 1;			// 	해당 0을 1로 바꿔서 검사했다는 것을 나타내줌
			dfs(i++, j, iceMold);		//  i를 1 증가시켜서 검사(아래쪽)
			dfs(i--, j, iceMold);		//	i를 1 감소시켜서 검사(위쪽)
			dfs(i, j++, iceMold);		//  j를 1 증가시켜서 검사(오른쪽)
			dfs(i, j--, iceMold);		// 	j를 1 감소시켜서 검사(왼쪽)
			
								//  ex) 입력예시의 입력이라면
								//  첫번째 dfs(), [0][0] 1로 -> [1][0] 1로 -> [0][0] 이미 1
								//  두번째 dfs(), [-1][0]은 if조건에 걸림
								//  세번째 dfs(), [0][1] 1로 -> [1][1] 1로 -> [2][1],[0][1] 이미 1 -> [1][2] 1로
								//  네번째 dfs(), [0][-1]은 if조건에 걸림
								//	자기자신,상하좌우 검사가 끝나면 더 이상 연결되어있지 않다는 뜻이므로(더 이상 검사할 0값이 없음)
			flag = 1;					
			return flag;				//  flag값을 1로 바꾸고 리턴
		}								// 	iceMold의 i,j번째 인덱스 값이 1일경우(위 조건문에 안걸림) 
		return flag;					//  flag값이 0인 채로 리턴
	}//메닫중
	
	
	public static void main(String[] args) throws IOException{ // 메인 메소드
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in)); // input을 위한 객체
		System.out.print("N, M 공백으로 구분하여 입력 : ");
		String[] mn = br.readLine().split(" ");		// 공백을 기준으로 String[] 배열
		n = Integer.parseInt(mn[0]);				// 0번째 인덱스 n
		m = Integer.parseInt(mn[1]);				// 1번째 인덱스 m
		int[][] iceMold = makeIceMold();			// n X m 2차원 정수 배열 생성하는 메소드
		int cnt = cntIce(iceMold);					// 얼음 개수를 세는 메소드
		System.out.println(cnt);					// 결과로 얻은 cnt값을 출력
	}
}

