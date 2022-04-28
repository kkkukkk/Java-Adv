<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
function chatting(user_no){

	document.location.href="chattingdbsave.jsp?user_no=" + user_no;
	

	window.open("chattingroom.jsp" ,"채팅방", "width=400, height=350");

}

</script>

<%
String user_no = "1";
%>
<table>
<tr>
<td><input type="button" onclick="chatting(<%=user_no %>)" value="채팅하기"></td>
</tr>



</table>





</body>
</html>