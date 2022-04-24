<%@page import="jdbc.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String trainer_no = request.getParameter("trainer_no");
	String gym_no = request.getParameter("gym_no");
	
	JoinDAO join = new JoinDAO();
	boolean result = join.resumeinsert(gym_no, trainer_no);
 
	//요기까지
	if(result) response.sendRedirect("trainerDetail.jsp?trainer_no="+trainer_no);
	else out.print("<script>alert('실패했습니다')</script>");
%>
