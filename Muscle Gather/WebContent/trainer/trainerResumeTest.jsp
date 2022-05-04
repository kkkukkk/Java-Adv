<%@page import="jdbc.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="kr">
<head>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<link rel="stylesheet"href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
</head>
<body>
<%
	String gym_no = request.getParameter("gym_no");
	String trainer_no = request.getParameter("trainer_no");
	
	JoinDAO join = new JoinDAO();
	boolean result = join.resumeinsert(gym_no, trainer_no);
 
	//요기까지
	if(result) {
		out.print("<script>alert('관심을 보냈습니다😎')</script>");
		out.print("<script>document.location.href='trainerDetailTest.jsp?trainer_no="+trainer_no+"'</script>");
	}
	else {
		out.print("<script>alert('해당 트레이너에게 이미 관심을 보냈습니다😥')</script>");
		out.print("<script>document.location.href='trainerDetailTest.jsp?trainer_no="+trainer_no+"'</script>");
	}
	
%>
</body>
</html>

