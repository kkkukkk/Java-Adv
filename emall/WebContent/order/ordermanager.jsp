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

		<%!String title = "📖 오더매니저 📚";%>

		<div class="alert alert-secondary text-center" role="alert">
			<div class="container">
				<h3 class="display-20">
					<%=title%>
				</h3>
			</div>
		</div>
		
		
		<div class="container my-3">
		<div align="right">
		<a href="orderstatus.jsp?status=1">[입금전]</a>
		<a href="orderstatus.jsp?status=2">[입금완료]</a>
		<a href="orderstatus.jsp?status=3">[배송중]</a>
		<a href="orderstatus.jsp?status=4">[배송완료]</a>
		</div>
		</div>
		
		

		<table class="table table-hover">
			<thead>
				<tr>
					<th scope="col">주문번호</th>
					<th scope="col">제품번호</th>
					<th scope="col">구매자</th>
					<th scope="col">제품명</th>
					<th scope="col">가격</th>
					<th scope="col">구매일</th>
					<th scope="col">평점</th>
					<th scope="col">후기</th>
					<th scope="col">상태</th>
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
					<td><%=order.getOprice()%>원</td>
					<td><%=order.getOdate()%></td>
					<td>⭐<%=order.getOgrade()%></td>
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