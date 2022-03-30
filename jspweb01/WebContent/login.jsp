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
// 자바 영역
String uid = request.getParameter("id");
String upw = request.getParameter("pw");
%>
<!-- html 주석 -->
<%-- jsp 주석 --%>
<h3>User ID:<%=uid %></h3><br>
<h3>User PW:<%=upw %></h3><br>
<h5>by 17박진욱</h5><br>
</body>
</html>