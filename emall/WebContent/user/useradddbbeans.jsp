<%request.setCharacterEncoding("UTF-8");%>
<%@page import="jdbc.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <jsp:useBean id="user" class="jdbc.UserDTO" scope="page" />
 <jsp:setProperty property = "*" name="user"/>
 <%
 /* String uid = request.getParameter("uid");
 String upw = request.getParameter("upw");
 String uname = request.getParameter("uname");
 String ugender = request.getParameter("ugender");
 String ubirth = request.getParameter("ubirth");
 String uemail = request.getParameter("uemail");
 String uphone = request.getParameter("uphone");
 String uaddr= request.getParameter("uaddr");
 
 
 UserDAO dao = new UserDAO();
 int result = dao.insert(uid, upw, uname, ugender, ubirth, uemail, uphone, uaddr);
 
 if(result == 1) {
	 response.sendRedirect("/user/login.jsp");
 }else{
	 response.sendRedirect("/user/useradd.jsp");
 }

 */ 
 %>
 
 아이디 : <jsp:getProperty property="uid" name="user" /><br>
 암   호 : <jsp:getProperty property="upw" name="user" /><br>
 이   름 : <jsp:getProperty property="uname" name="user" /><br>
 성   별 : <jsp:getProperty property="ugender" name="user" /><br>
 생   일 : <jsp:getProperty property="ubirth" name="user" /><br>
 이메일 : <jsp:getProperty property="uemail" name="user" /><br>
 전화번호 : <jsp:getProperty property="uphone" name="user" /><br>
 주   소 : <jsp:getProperty property="uaddr" name="user" /><br>