<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

// JDBC 드라이버 로딩
Class.forName("com.mysql.jdbc.Driver");
// DB연결
String url = "jdbc:mysql://localhost:3306/exercisedb";
String id = "root";
String pw = "0000";

Connection conn = null; // 디비 연결 객체
PreparedStatement pstmt = null; // 디비에 전달할 SQL 구문객체

conn = DriverManager.getConnection(url, id, pw);

// 테이블 데이터 넣는 SQL

String num = request.getParameter("num");
String depart = request.getParameter("depart");
String name = request.getParameter("name");
String address = request.getParameter("address");
String phone = request.getParameter("phone");

String sql = "INSERT INTO student VALUES(?,?,?,?,?)";
pstmt = conn.prepareStatement(sql);
pstmt.setString(1, num);
pstmt.setString(2, depart);
pstmt.setString(3, name);
pstmt.setString(4, address);
pstmt.setString(5, phone);
pstmt.executeUpdate();

// DB 연결 종료
if (pstmt != null)
	pstmt.close();
if (conn != null)
	conn.close();

out.print("Student 테이블 삽입이 성공했습니다.");


%>