<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 목록</title>
<link href="../font.css" rel="stylesheet" type="text/css">

</head>
<body>
	<div class="bodydiv">
		<!-- CSS only -->
		<link
			href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
			rel="stylesheet"
			integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
			crossorigin="anonymous">


		<%@ include file="/_header.jsp"%>

		<%!String title = "📖 게시글 목록 📚";%>

		<div class="alert alert-secondary text-center" role="alert">
			<div class="container">
				<h3 class="display-20">
					<%=title%>
				</h3>
			</div>
		</div>

		<table class="table table-hover">
			<thead>
				<tr>
					<th scope="col">#</th>
					<th scope="col">작성자</th>
					<th scope="col">제목</th>
					<th scope="col">일시</th>
				</tr>
			</thead>

			<tbody>

				<%
				// 드라이버 로딩
				Class.forName("com.mysql.jdbc.Driver");

				String url = "jdbc:mysql://localhost:3306/emall";
				String id = "root";
				String pw = "0000";

				Connection conn = null; 			// 연결 객체
				PreparedStatement pstmt = null;		// 구문 객체
				ResultSet rs = null;
				
				conn = DriverManager.getConnection(url, id, pw);;
				
				String sql = "SELECT count(*) FROM board";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				
				
				
				
				//////////////////////////////////////////////페이징///////////////////////////////////////////////////////
				// 필요 변수들 선언
				int LINE_PER_PAGE = 5;					//페이지 당 출력 줄수
				int PAGE_PER_BLOCK = 2;					//블록당 페이지 수
				
				int nbr_of_row = 0;						//게시물의 총 수 / 사람의 총 수 / 테이블 전체의 개수
				int nbr_of_page = 0;					//총 페이지 수
				
				int start_pointer = 0;					//DB검색 시작 위치
				int cur_page_no = 0;					//현재 페이지 번호
				int block_nbr = 0;						//블록 번호
				int block_start_page_no = 0;			//블록 시작 페이지 번호
				int block_end_page_no = 0;				//블록 끝 페이지 번호
				int previous_block_start_page_no = 0;	//이전 블록 시작 페이지 번호
				int next_block_start_page_no = 0;		//다음 블록 시작 페이지 번호
				
				
				
				// 총 게시물 개수(총 회원의 수, 테이블 전체의 수) 계산
				
				rs.next();
				nbr_of_row = Integer.parseInt(rs.getString("COUNT(*)"));
				
				// 총 페이지 수 계산 (ceil : 올림, floor 버림, round 반올림)
				
				nbr_of_page = (int)Math.ceil((float)nbr_of_row / LINE_PER_PAGE); 
				
				// 검색 페이지 확인
				if (request.getParameter("pageno") == null) {
					// 맨 처음 검색
					cur_page_no = 1;
				} else if (nbr_of_page < Integer.parseInt(request.getParameter("pageno"))){
					// DB 검색 시작 위치 계산
					cur_page_no = nbr_of_page;
				} else {
					// 특정 페이지 검색
					cur_page_no = Integer.parseInt(request.getParameter("pageno"));
				}
				
				// DB 검색 시작 위치와 갯수
				start_pointer = (cur_page_no - 1) * LINE_PER_PAGE;
				
				//***********************************************SQL 처리****************************************************
				sql = "SELECT * FROM board ORDER BY bid DESC LIMIT ?,?";
				pstmt = conn.prepareStatement(sql);
					pstmt.setInt(1, start_pointer);
					pstmt.setInt(2, LINE_PER_PAGE);
				rs = pstmt.executeQuery();
				
				if(!rs.isBeforeFirst()) {
					out.print("<script>alert('데이터가 없습니다.');"
					+ "history.back()"
					+ "</script>/");
				}
				
				
				//***********************************************리스트 표시***************************************************
				int no = 1;
				while(rs.next()){
					String bid = rs.getString("bid");
					String btitle = rs.getString("btitle");
					String bcontent = rs.getString("bcontent");
					String buser = rs.getString("buser");
					String bimage = rs.getString("bimage");
					String bdate = rs.getString("bdate");
					String baddr = rs.getString("baddr");
				
				
				%>
				<tr>
				<td> <%=bid %></td>
				<td> <%=btitle %></td>
				<td> <%=buser %></td>
				<td> <%=bdate %></td>
				</tr>
				
				<tr>
				<td colspan = 4>
				<%}
				//*******************************************************페이지 제어*************************************************
				
				// 블럭 번호
				block_nbr = ((cur_page_no - 1) / PAGE_PER_BLOCK) + 1;
				// 블럭 시작 페이지 번호
				block_start_page_no = ((block_nbr - 1) * PAGE_PER_BLOCK) + 1;
				// 블럭 끝 페이지 번호
				block_end_page_no = (block_start_page_no + PAGE_PER_BLOCK) - 1;
				
				
				
				if (block_nbr > 1) {
					out.print("&nbsp[<a href='boardlistpaging.jsp?pageno=1'>" + "처음</a>]&nbsp");
					
					//이전 블록 시작 페이지
					previous_block_start_page_no = block_start_page_no - PAGE_PER_BLOCK;
					out.print("&nbsp[<a href='boardlistpaging.jsp?pageno=" + previous_block_start_page_no + "'>이전</a>]&nbsp");
					
				}
				
				for (int pgn = block_start_page_no; pgn <= block_end_page_no; pgn++){
					if (pgn > nbr_of_page){
						break;
					}
					
					if (pgn == cur_page_no){
						out.print("&nbsp" + pgn + "&nbsp");
					}else {
						out.print("&nbsp[<a href='boardlistpaging.jsp?pageno=" + pgn + "'>" + pgn + "</a>]&nbsp");
					}
					
				
				}
				if (block_end_page_no < nbr_of_page) {
					// 다음 블록 시작 페이지
					next_block_start_page_no = block_end_page_no+1;
					out.print("&nbsp[<a href='boardlistpaging.jsp?pageno=" + next_block_start_page_no + "'>다음</a>]&nbsp");
					
					out.print("&nbsp[<a href='boardlistpaging.jsp?pageno=" + nbr_of_page + "'>마지막</a>]&nbsp");
				}
				
				%>
				</td>
				</tr>
				
				
				
				
			</tbody>
		</table>
		<div class="text-lg-end text-center">
			<a href="boardwrite.jsp" class="btn btn-secondary"
				style="float: right">글쓰기</a>
		</div>



		<%@ include file="/_footer.jsp"%>

		<!-- JavaScript Bundle with Popper -->
		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
			crossorigin="anonymous"></script>
	</div>
</body>
</html>