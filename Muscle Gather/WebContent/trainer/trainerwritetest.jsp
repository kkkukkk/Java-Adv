<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form name="trainer_form" action="trainerwritedb.jsp" method="post" enctype="multipart/form-data">
	제목 : <input type="text" name="trainer_title"><br>
	내용 : <input type="text" name="trainer_content"><br>
	주소 : <input type="text" name="trainer_addr"><br>
	사진 : <input type="file" name="trainer_images" multiple><br>
	<input type="submit" value="등록">
</form>



</body>
</html>