<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
	String birthday = request.getParameter("birthday");
	String account_email = request.getParameter("account_email");
	String gender = request.getParameter("gender");
	String nickname = request.getParameter("nickname");
	
	
	%>
	<%=birthday %>
	<%=account_email %>
	<%=gender %>
	<%=nickname %>

</body>
</html>