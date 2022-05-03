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
		response.sendRedirect("/Muscle_Gather/user/logintest.jsp");
		return;
	}//세션 정보를 확인해서 로그인 상태인지 확인한 후 진입 허용
	session.setAttribute("user_email", user_email);

%>
<!DOCTYPE html>
<html lang="kr">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>트레이너 목록</title>
    <link type="text/css" rel="stylesheet" href="../css/default.css" />
    <link type="text/css" rel="stylesheet" href="../css/adminMain.css" />

    <script type="text/javascript" src="../js/jquery-3.6.0.min.js"></script>
    <script type="text/javascript" src="../js/default.js"></script>


</head>
<body>
		<div class="wrap">
			<!-- header-->
			<header id="header">
				<%@ include file="/html/pieceHeader.html"%>
			</header>
	
			<!-- hidden nav-->
			<nav id="nav"></nav>
	
			<!-- hidden sideBar-->
			<aside id="sideBarA" class="">
				<div class="sideWrap">sideA</div>
			</aside>
	
			<aside id="sideBarB" class="">
				<div class="sideWrap">sideB</div>
			</aside>

				<main>
						
				<%@ include file="trainerListUpperFormTest.jsp"%>
				
				<div class="mainWrap">
						<section class="sec1 sec_plus">
		
		<!-- 리스트 테이블 -->
		 <div class="mainboard bd3">
             <div class="board_titel">
                 <a href="">
                    <h3>트레이너 정보</h3>
                 </a>
             </div>
		
		<!-- 트레이너 목록 가져오기 -->
			 <div class="board titel">
					<div>번호</div>
					<div>이력서</div>
					<div>유저이름</div>
					<div>일시</div>
			</div>
		
		
			<%
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		conn = ConnectionPool.get();
		
		//////////////////////////////////////////////페이징///////////////////////////////////////////////////////
		// 필요 변수들 선언
		int LINE_PER_PAGE = 12;					//페이지 당 출력 줄수
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
		
		
		String sql = "SELECT count(*) FROM trainer WHERE trainer_secret != 1";
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
		
%>
		
				<%
				ArrayList<TrainerDTO> trainers = (new TrainerDAO()).getTrainerList(start_pointer, LINE_PER_PAGE);
				
				
				for (TrainerDTO trainer : trainers) {
					if (Integer.parseInt(trainer.getTrainer_secret()) == 0){ //0이면 공개 아니면 비공개
				%>
					<div class="board text" onclick="location.href='trainerDetailTest.jsp?trainer_no=<%=trainer.getTrainer_no()%>'"
							style="cursor:pointer;">
						<div><%=trainer.getTrainer_no()%></div>
						<div><%=trainer.getTrainer_title()%></div>
						<div><%=trainer.getUser_name() %></div>
						<div><%=trainer.getTrainer_regdate()%></div>
					</div>
					
				<%
					}
				}
				%>
				</div>
			
				<div class="pagingBox">
				<%
				//*******************************************************페이지 제어*************************************************
				
				// 블럭 번호
				block_nbr = ((cur_page_no - 1) / PAGE_PER_BLOCK) + 1;
				// 블럭 시작 페이지 번호
				block_start_page_no = ((block_nbr - 1) * PAGE_PER_BLOCK) + 1;
				// 블럭 끝 페이지 번호
				block_end_page_no = (block_start_page_no + PAGE_PER_BLOCK) - 1;
				
				
				
				if (block_nbr > 1) {
					out.print("&nbsp[<a href='trainerListTest.jsp?pageno=1'>" + "처음</a>]&nbsp");
					
					//이전 블록 시작 페이지
					previous_block_start_page_no = block_start_page_no - PAGE_PER_BLOCK;
					out.print("&nbsp[<a href='trainerListTest.jsp?pageno=" + previous_block_start_page_no + "'>이전</a>]&nbsp");
					
				}
				
				for (int pgn = block_start_page_no; pgn <= block_end_page_no; pgn++){
					if (pgn > nbr_of_page){
						break;
					}
					
					if (pgn == cur_page_no){
						out.print("&nbsp" + pgn + "&nbsp");
					}else {
						out.print("&nbsp[<a href='trainerListTest.jsp?pageno=" + pgn + "'>" + pgn + "</a>]&nbsp");
					}
					
				
				}
				if (block_end_page_no < nbr_of_page) {
					// 다음 블록 시작 페이지
					next_block_start_page_no = block_end_page_no + 1;
					out.print("&nbsp[<a href='trainerListTest.jsp?pageno=" + next_block_start_page_no + "'>다음</a>]&nbsp");
					
					out.print("&nbsp[<a href='trainerListTest.jsp?pageno=" + nbr_of_page + "'>마지막</a>]&nbsp");
				}
				
				
				%>
				</div>

		 </section>

            </div>
        </main>

        <footer id="footer">

        </footer>

        <!-- side button -->
        <article id="sideBtn">
            <div class="sideLinkWrap">
                <label id="" for="">
                    <span></span>
                    <span></span>
                    <span></span>
                    <span></span>
                </label>
            </div>
        </article>
    </div>
</body>
</html>