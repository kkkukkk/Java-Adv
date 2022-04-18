<%@page import="jdbc.*"%>
<%@page import="java.util.ArrayList"%>
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
					ArrayList<BoardDTO> boards = (new BoardDAO()).getList();

				for (BoardDTO board : boards) {
				%>

				<tr>
					<th scope="row"><%=board.getBid()%></th>
					<td><%=board.getBuser()%></td>
					<td><a href="boarddetail.jsp?bid=<%=board.getBid()%>"
						style="text-decoration: none"><%=board.getBtitle()%></a></td>
					<td><%=board.getBdate()%></td>
				</tr>
				<%
					}
				%>
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