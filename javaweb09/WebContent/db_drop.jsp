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
	<%
		// 드라이버 로딩

	Class.forName("com.mysql.jdbc.Driver");

	String url = "jdbc:mysql://localhost:3306/";
	String id = "root";
	String pw = "0000";

	Connection conn = null; // 연결 객체
	PreparedStatement pstmt = null; // 구문 객체

	conn = DriverManager.getConnection(url, id, pw);

	String sql = "DROP DATABASE university"; // DB생성 sql 구문

	pstmt = conn.prepareStatement(sql); // 구문을 객체에 넣어서

	pstmt.executeUpdate(); // 구문 객체 실행

	if (conn != null) conn.close();
	%>

</body>
</html>