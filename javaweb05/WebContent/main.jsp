<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>๋ฐฉ๋ช๋ก๐</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>

</head>
<body style="background-color:#FDEDCC">
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

<%@ include file="menu.jsp" %>

<div class = "container bg-warning shadow mx-auto mt-5 p-5 w-75">

<!-- container : ํ๋ฉด ์ ์ฒด๋ฅผ  ์ฐจ์งํ์ง ์๋ ๊ณ ์ ๋ ํฌ๊ธฐ๋ฅผ ์ง์ ํ๋ ์ปจํ์ด๋๋ก ๋ธ๋ผ์ฐ์ ์
            ํฌ๊ธฐ ๋ณ๋์ ๋ฐ์ํ๊ฒ ๋๋ค. 
bg-warning : ๋ฐฐ๊ฒฝ์์ ์ง์ ํ๋ค.   shadow ๊ทธ๋ฆผ์ ํจ๊ณผ๋ฅผ ์ถ๊ฐ
mx-auto :์๋์ผ๋ก ํฌ๊ธฐ๋ฅผ ์ ์ ํ๊ฒ ๋ฐฐ์น
mt-5 ๋ฐ์ค๊ฐ ๋ธ๋ผ์ฐ์  ์๋จ์ ๋ถ์ง ์๋๋ก ์ต๋ ๋ง์ง์ ์ค์  0-5
p-5 ๋ฐ์ค ์์ชฝ ์ฌ๋ฐฑ์ ์ค์  
w-75 ๋ฐ์ค์ ํฌ๊ธฐ๋ฅผ ๋ธ๋ผ์ฐ์  ํฌ๊ธฐ์ 75%์ผ๋ก ์ ์ง -->

<table align=center>
<tr height=40><td><b>์ด์์ค์ธ์๐</b></td>
<td align = right>
<a href = "feed.jsp"><button type="button" class="btn btn-outline-dark">๊ธ์ฐ๊ธฐ</button></a>
</td></tr>

<%
   request.setCharacterEncoding("UTF-8");

// JDBC ๋๋ผ์ด๋ฒ ๋ก๋ฉ
   Class.forName("com.mysql.jdbc.Driver");
// DB์ฐ๊ฒฐ
   String url = "jdbc:mysql://localhost:3306/visit";
   String id = "root";
   String pw = "0000";
   
   Connection conn = null;  // ๋๋น ์ฐ๊ฒฐ ๊ฐ์ฒด
   PreparedStatement pstmt = null; // ๋๋น์ ์ ๋ฌํ  SQL ๊ตฌ๋ฌธ๊ฐ์ฒด
   ResultSet rset = null;   // ๋๋น์์ ๊บผ๋ด์ฌ ๋ฐ์ดํฐ๋ค์ ๋ด์ ๊ฐ์ฒด
   
   conn = DriverManager.getConnection(url, id, pw);
   
// ํ์ด๋ธ ๋ฐ์ดํฐ ๋ฃ๋ SQL

   String sql = "SELECT * FROM feed ORDER BY ts desc";
   pstmt = conn.prepareStatement(sql);

   rset = pstmt.executeQuery(); 
%>   

<%
   while(rset.next()) {
      
      String name = rset.getString("name");
      String content = rset.getString("content");
      String ts = rset.getString("ts");
%>      
<tr><td colspan=2><hr></td></tr>
<tr>
<td><small><%=name %></small></td>
<td><small><%=ts %></small></td>
<tr><td colspan=2><%=content %></td></tr>   

<%    
   }

%>

</table>

</div>
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

</body>
</html>