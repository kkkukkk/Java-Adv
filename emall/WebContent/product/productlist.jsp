<%@page import="java.util.ArrayList"%>
<%@page import="jdbc.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 목록</title>
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

	<%!String title = "😊 상품 목록 😊";%>

	<div class="alert alert-secondary text-center" role="alert">
		<div class="container">
			<h3 class="display-20">
				<%=title%>
			</h3>
		</div>
	</div>
	
	<div class="form-group row justify-content-center">
		<div class="col-sm-10">
			<a href="productadd.jsp" class="btn btn-dark btn-lg form-control" role="button">상품 등록</a>
		</div>
	</div>
	<br>

	<div class="container">
		<div class="row" align="center">
		
		<% 
			ArrayList<ProductDTO> products = (new ProductDAO()).getList();
						
			for (ProductDTO product : products){
		%>
	
		
			<div class="col-sm-4">
				<img src="/images/<%=product.getPimage() %>" style="width: 100%">
					<h3><%=product.getPname() %></h3>
					<p><%=product.getPprice() %>원
					<p><a href="productdetail.jsp?pid=<%=product.getPid() %>" class="btn btn-secondary" role="button">상세 정보</a>
			</div>
		
		<% } %>
		
		</div>
		<hr>
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