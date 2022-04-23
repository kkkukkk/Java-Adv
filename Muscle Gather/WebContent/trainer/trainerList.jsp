<%@page import="util.ConnectionPool"%>
<%@page import="jdbc.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>트레이너 목록</title>
</head>
<body>

		<!-- CSS only -->
		<link
			href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
			rel="stylesheet"
			integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
			crossorigin="anonymous">


		<%!String title = "목록";%>

		<div class="alert alert-light text-center" role="alert">
			<div class="container">
				<h3 class="display-20">
					<%=title%>
				</h3>
			</div>
		</div>


		<!-- 리스트 테이블 -->
		<table class="table table-hover">
		
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
				ArrayList<TrainerDTO> trainers = (new TrainerDAO()).getTrainerList();

				for (TrainerDTO trainer : trainers) {
				%>
	
				<tr>
					<th scope="row"><%=trainer.getTrainer_no()%></th>
					<td><a href="trainerDetail.jsp?user_id="<%=trainer.getUser_no() %>
						style="text-decoration: none"><%=trainer.getTrainer_title()%></a></td>
					<td><%= trainer.getUser_name() %></td>
					<td><%=trainer.getTrainer_regdate()%></td>
				</tr>
				<%}%>
				
		</tbody>
		</table>
		
		
		
		

		<!-- JavaScript Bundle with Popper -->
		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
			crossorigin="anonymous"></script>

</body>
</html>