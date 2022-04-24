<%@page import="jdbc.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");

String user_email = request.getParameter("user_email");
String user_pw = request.getParameter("user_pw");

UserDAO dao = new UserDAO();

int result = dao.login(user_email, user_pw);

if (result == 1) {// 실패 케이스 1 아이디가 아예 없다.
	response.sendRedirect("#");
} else if (result == 2) {
	response.sendRedirect("login.jsp"); // 비번이 틀린케이스이므로 다시 로그인
} else {
	session.setAttribute("user_email", user_email);
	response.sendRedirect("../trainer/trainerListPaging.jsp");
}
%>