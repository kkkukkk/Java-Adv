<%@page import="java.util.Queue"%>
<%@page import="java.util.Stack"%>
<%@page import="java.util.LinkedList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>채팅방</title>
</head>
<body>


<table>

<%
Queue<Integer> a = new LinkedList<Integer>();
for (int i=1;i<6;i++){
	a.add(i);
}

//for (int i=0;i<a.size();i++){	
%>
<tr>
<td><%a.size();%></td>
</tr>

<%
//}
%>

<tr>
<td>채팅 : <input type="text"></td>
<td><button onclick="#">전송</button></td>
</tr>
</table>



</body>
</html>