<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<script type = "text/javascript">
function CheckForm(){
	var regExp = /Java/i; // var regExp = new RegExp('java','i');
	var str = document.loginForm.title.value;
	var result = regExp.exec(str);
	alert(result[0]);
}
</script>


<form action="Testdb.jsp" name = "loginForm">
아이디 : <input type="text" name="title">
<input type="submit" onclick="CheckForm()">
</form>




</body>
</html>