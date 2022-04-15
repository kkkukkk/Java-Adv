<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link href="../font.css" rel="stylesheet" type="text/css">
</head>
<body>

<div class="bodydiv">
		<!-- CSS only -->
		<link
			href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
			rel="stylesheet"
			integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
			crossorigin="anonymous">


		<%@ include file="/_header.jsp"%>

		<%!String title = "⭐ 회원가입 🙌";%>

		<div class="alert alert-secondary text-center" role="alert">
			<div class="container">
				<h3 class="display-20">
					<%=title%>
				</h3>
			</div>
		</div>
		
		<div class="container shadow mx-auto mt-5 p-5 w-75 rounded">
			<form action="useradddb.jsp" method="post" enctype="multipart/form-data" align="center">
				
				<div class="form-group row justify-content-center">
					<label class="col-sm-2">아이디</label>
					<div class="col-sm-5">
						<input type="text" name="uid" class="form-control" required>
					</div>
				</div>

				<div class="form-group row justify-content-center">
					<label class="col-sm-2">비밀번호</label>
					<div class="col-sm-5">
						<input type="text" name="upw" class="form-control" required>
					</div>
				</div>

				<div class="form-group row justify-content-center">
					<label class="col-sm-2">이름</label>
					<div class="col-sm-5">
						<input type="text" name="uname" class="form-control" required>
					</div>
				</div>
				
				<br>
				<div class="form-group row justify-content-center">
					<label class="col-sm-2">성별</label>
					<div class="col-sm-5">
						<input type="radio" class="btn-check" name="ugender" value="남자" id="option1" autocomplete="off">
						<label class="btn btn-secondary" for="option1">남자</label>
						<input type="radio" class="btn-check" name="ugender" value="여자" id="option2" autocomplete="off">
						<label class="btn btn-secondary" for="option2">여자</label>
					</div>
				</div>
				<br>
				
				<div class="form-group row justify-content-center">
					<label class="col-sm-2">생년월일</label>
					<div class="col-sm-5">
						<input type="text" name="ubirth" class="form-control" required>
					</div>
				</div>
				
				<div class="form-group row justify-content-center">
					<label class="col-sm-2">이메일</label>
					<div class="col-sm-5">
						<input type="email" name="uemail" class="form-control" required>
					</div>
				</div>
				
				<div class="form-group row justify-content-center">
					<label class="col-sm-2">전화번호</label>
					<div class="col-sm-5">
						<input type="text" name="uphone" class="form-control" required>
					</div>
				</div>
				
				<div class="form-group row justify-content-center">
					<label class="col-sm-2">주소</label>
					<div class="col-sm-5">
						<input type="text" name="uaddr" class="form-control" required>
					</div>
				</div>
				
				<br>
				<div class="form-group row justify-content-center">
					<div class="col-sm-4">
						<input type="submit" class="btn btn-dark form-control" value="가입">
					</div>
					<div class="col-sm-4">
						<input type="reset" class="btn btn-dark form-control" value="초기화">
					</div>
				</div>
				
		
			</form>
		</div>










<%@ include file="/_footer.jsp"%>

		<!-- JavaScript Bundle with Popper -->
		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
			crossorigin="anonymous"></script>

	</div>


</body>
</html>