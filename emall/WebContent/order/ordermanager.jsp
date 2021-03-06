<%@page import="jdbc.*"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Order manager</title>
<link href="font.css" rel="stylesheet" type="text/css">
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

		<%!String title = "๐ ์ค๋๋งค๋์  ๐";%>

		<div class="alert alert-secondary text-center" role="alert">
			<div class="container">
				<h3 class="display-20">
					<%=title%>
				</h3>
			</div>
		</div>
		
		
		<div class="container my-3">
		<div align="right">
		<a href="orderstatus.jsp?status=1">[์๊ธ์ ]</a>
		<a href="orderstatus.jsp?status=2">[์๊ธ์๋ฃ]</a>
		<a href="orderstatus.jsp?status=3">[๋ฐฐ์ก์ค]</a>
		<a href="orderstatus.jsp?status=4">[๋ฐฐ์ก์๋ฃ]</a>
		</div>
		</div>
		
		

		<table class="table table-hover">
			<thead>
				<tr>
					<th scope="col">์ฃผ๋ฌธ๋ฒํธ</th>
					<th scope="col">์ ํ๋ฒํธ</th>
					<th scope="col">๊ตฌ๋งค์</th>
					<th scope="col">์ ํ๋ช</th>
					<th scope="col">๊ฐ๊ฒฉ</th>
					<th scope="col">๊ตฌ๋งค์ผ</th>
					<th scope="col">ํ์ </th>
					<th scope="col">ํ๊ธฐ</th>
					<th scope="col">์ํ</th>
				</tr>
			</thead>
			<tbody>

				<%
					ArrayList<OrderDTO> orders = (new OrderDAO()).getList();

				for (OrderDTO order : orders) {
				%>

				<tr>
					<th scope="row"><%=order.getOid()%></th>
					<td><%=order.getOpid()%></td>
					<td><%=order.getOuid()%></td>
					<td><%=order.getOpname()%></td>
					<td><%=order.getOprice()%>์</td>
					<td><%=order.getOdate()%></td>
					<td>โญ<%=order.getOgrade()%></td>
					<td><%=order.getOcomm()%></td>
					
					<td><a href="boarddetail.jsp?bid=<%=order.getOid()%>"
						style="text-decoration: none"><%=order.getOstatus()%></a></td>
				</tr>
				<%
					}
				%>
			</tbody>
		</table>



		<%@ include file="/_footer.jsp"%>

		<!-- JavaScript Bundle with Popper -->
		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
			crossorigin="anonymous"></script>
	</div>

</body>
</html>