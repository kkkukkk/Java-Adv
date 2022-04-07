<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생 정보 출력</title>
</head>
<body style="background-color:grey">
	<!-- CSS only -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<%@ include file="menu.jsp" %>

	<%@ include file="database_connect.inc" %>
	
	<%
	// 테이블 데이터 넣는 SQL

	String sql = "SELECT * FROM student";
	pstmt = conn.prepareStatement(sql);
	rset = pstmt.executeQuery();
	%>

	<div
		class="container bg-secondary shadow mx-auto mt-5 p-5 w-75 rounded">
		<table class="table table-hover text-light">
			<thead>
				<tr>
					<th scope="col">#</th>
					<th scope="col">학번</th>
					<th scope="col">이름</th>
					<th scope="col">성별</th>
					<th scope="col">학년</th>
					<th scope="col">전공</th>
					<th scope="col">주소</th>
				</tr>
			</thead>
			<tbody>

				<%
					int no = 1;
				while (rset.next()) {

					String hakbun = rset.getString("hakbun");
					String name = rset.getString("name");
					String gender = rset.getString("gender");
					String year = rset.getString("year");
					String dept = rset.getString("dept");
					String addr = rset.getString("addr");
				%>
				<tr>
					<th scope="row"><%=no%></th>
					<td><%=hakbun%></td>
					<td><%=name%></td>
					<td><%=gender%></td>
					<td><%=year%></td>
					<td><%=dept%></td>
					<td><%=addr%></td>
				</tr>
				<%
					no++;
				}
				%>
			</tbody>
		</table>
		<div class="btn-group" role="group" aria-label="Basic checkbox toggle button group">
			<input type="checkbox" class="btn-check" id="btncheck1" autocomplete="off">
			<a href="db_table_list.jsp" class="btn btn-outline-light">현재 페이지</a>
			<input type="checkbox" class="btn-check" id="btncheck1" autocomplete="off">
			<a href="db_input_student.jsp" class="btn btn-outline-light">학생 생성</a>
			<input type="checkbox" class="btn-check" id="btncheck1" autocomplete="off">
			<a href="db_table_drop.jsp" class="btn btn-outline-light">학생 삭제</a>
		</div>
	</div>

<%@ include file="database_disconnect.inc" %>
	<!-- JavaScript Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
</html>