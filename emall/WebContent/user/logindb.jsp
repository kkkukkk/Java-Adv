<%@page import="jdbc.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
	
	String uid = request.getParameter("uid");
	String upw = request.getParameter("upw");
	
	UserDAO dao = new UserDAO();
	
	int result = dao.login(uid, upw);
	
	if (result == 1) {// 실패 케이스 1 아이디가 아예 없다.
		out.print("<script>alert('존재하지 않는 아이디입니다. 😥');</script>");
		response.sendRedirect("useradd.jsp");
	} else if (result == 2){
		out.print("<script>alert('존재하지 않는 아이디입니다. 😥');</script>");
		response.sendRedirect("login.jsp"); // 비번이 틀린케이스이므로 다시 로그인
	} else{
		session.setAttribute("id", uid);
		response.sendRedirect("/product/productlist.jsp");
	}

	
	
%>