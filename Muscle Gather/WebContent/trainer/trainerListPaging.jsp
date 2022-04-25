<%@page import="util.ConnectionPool"%>
<%@page import="jdbc.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%
	request.setCharacterEncoding("UTF-8");
	String user_email = (String) session.getAttribute("user_email");
	if(user_email == null){
		response.sendRedirect("/Muscle_Gather/user/login.jsp");
		return;
	}//세션 정보를 확인해서 로그인 상태인지 확인한 후 진입 허용
	session.setAttribute("user_email", user_email);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>트레이너 목록</title>
<style>
.paging{
	text-align:center;
}
body a{
	color:black;
	font-weight:bold;
	text-decoration: none;
}

</style>


</head>
<body>
		<!-- CSS only -->
		<link
			href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
			rel="stylesheet"
			integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
			crossorigin="anonymous">


		<%!String title = "트레이너 목록";%>

		<div class="alert alert-light text-center" role="alert">
			<div class="container">
				<h3 class="display-20">
					<%=title%>
				</h3>
			</div>
		</div>
		
		<%@ include file="trainerListUpperForm.jsp"%>
		
		<!-- 리스트 테이블 -->
		<table class="table table-hover text-center">
		
		<!-- 트레이너 목록 가져오기 -->
			<thead>
				<tr>
					<th scope="col">번호</th>
					<th scope="col">이력서</th>
					<th scope="col">유저이름</th>
					<th scope="col">일시</th>
				</tr>
			</thead>
		<tbody>
		
		
		
		
		<%
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		conn = ConnectionPool.get();
		
		//////////////////////////////////////////////페이징///////////////////////////////////////////////////////
		// 필요 변수들 선언
		int LINE_PER_PAGE = 5;					//페이지 당 출력 줄수
		int PAGE_PER_BLOCK = 5;					//블록당 페이지 수
		
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
		
		String sql = "SELECT count(*) FROM trainer";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
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
		
		/* if(!rs.isBeforeFirst()) {
		out.print("<script>alert('데이터가 없습니다.');"
		+ "history.back()"
		+ "</script>/"); 
		} */
		
		%>
		
		
				<%
				ArrayList<TrainerDTO> trainers = (new TrainerDAO()).getTrainerList(start_pointer, LINE_PER_PAGE);
				
				
				for (TrainerDTO trainer : trainers) {
				%>
	
				<tr onclick="location.href='trainerDetail.jsp?trainer_no=<%=trainer.getTrainer_no()%>'"
						style="cursor:pointer;">
					<th scope="row"><%=trainer.getTrainer_no()%></th>
					<td><%=trainer.getTrainer_title()%></td>
					<td><%= trainer.getUser_name() %></td>
					<td><%=trainer.getTrainer_regdate()%></td>
				</tr>
				
				<%
				}
				%>
				<tr>
				<td colspan=4 class="paging">
				<%
				//*******************************************************페이지 제어*************************************************
				
				// 블럭 번호
				block_nbr = ((cur_page_no - 1) / PAGE_PER_BLOCK) + 1;
				// 블럭 시작 페이지 번호
				block_start_page_no = ((block_nbr - 1) * PAGE_PER_BLOCK) + 1;
				// 블럭 끝 페이지 번호
				block_end_page_no = (block_start_page_no + PAGE_PER_BLOCK) - 1;
				
				
				
				if (block_nbr > 1) {
					out.print("&nbsp[<a href='trainerListPaging.jsp?pageno=1'>" + "처음</a>]&nbsp");
					
					//이전 블록 시작 페이지
					previous_block_start_page_no = block_start_page_no - PAGE_PER_BLOCK;
					out.print("&nbsp[<a href='trainerListPaging.jsp?pageno=" + previous_block_start_page_no + "'>이전</a>]&nbsp");
					
				}
				
				for (int pgn = block_start_page_no; pgn <= block_end_page_no; pgn++){
					if (pgn > nbr_of_page){
						break;
					}
					
					if (pgn == cur_page_no){
						out.print("&nbsp" + pgn + "&nbsp");
					}else {
						out.print("&nbsp[<a href='trainerListPaging.jsp?pageno=" + pgn + "'>" + pgn + "</a>]&nbsp");
					}
					
				
				}
				if (block_end_page_no < nbr_of_page) {
					// 다음 블록 시작 페이지
					next_block_start_page_no = block_end_page_no + 1;
					out.print("&nbsp[<a href='trainerListPaging.jsp?pageno=" + next_block_start_page_no + "'>다음</a>]&nbsp");
					
					out.print("&nbsp[<a href='trainerListPaging.jsp?pageno=" + nbr_of_page + "'>마지막</a>]&nbsp");
				}
				
				
				%>
				</td>
				</tr>
				
			</tbody>
		</table>
		
		
		
		

		<!-- JavaScript Bundle with Popper -->
		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
			crossorigin="anonymous"></script>
</body>
</html>