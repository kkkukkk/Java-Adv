<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String trainer_no = request.getParameter("trainer_no");
	String user_no = "10";
	//요기까지
	response.sendRedirect("trainerDetail.jsp?trainer_no="+trainer_no);
%>
