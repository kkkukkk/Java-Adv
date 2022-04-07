<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>데이터베이스 삭제</title>
</head>
<body>
	<%@ include file="database_connect.inc" %>
	<%
	String sql = "DROP DATABASE university"; // DB생성 sql 구문

	pstmt = conn.prepareStatement(sql); // 구문을 객체에 넣어서

	pstmt.executeUpdate(); // 구문 객체 실행

	%>
	<%@ include file="database_disconnect.inc" %>
</body>
</html>