<%@page import="jdbc.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("UTF-8");
	String uid = (String) session.getAttribute("id");
	if(uid ==null){
		response.sendRedirect("/user/login.jsp");
		return;
	}//세션 정보를 확인해서 로그인 상태인지 확인한 후 진입 허용

%>    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 보기</title>
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

	<%!String title = "📖 게시글 보기 📚";%>

	<div class="alert alert-secondary text-center" role="alert">
		<div class="container">
			<h3 class="display-20">
				<%=title%>
			</h3>
		</div>
	</div>


	<%
		String bid = request.getParameter("bid");
	
		BoardDTO board = (new BoardDAO()).getDetail(bid);
	%>
	
	<div class="shadow mx-auto mt-5 p-5 w-75 rounded">
	<div class = "row">
	<div class = "col-ma-6">
		<h3><%=board.getBtitle() %></h3>
		<h5><%=board.getBuser() %></h5>
		<p><%=board.getBcontent() %>
		<p><%=board.getBdate()%>
	<div class = "col-ma-5">
		<img src="/images/<%=board.getBimage()%>" style="width:100%">
	</div>

		<br><br>
		<a href="" class="btn btn-info">좋아요👍</a>
		<a href="boardlist.jsp" class="btn btn-secondary">글 목록</a>
	</div>
	
	
	
	</div>
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