<%@page import="java.util.ArrayList"%>
<%@page import="jdbc.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>

<%
	request.setCharacterEncoding("UTF-8");
	String uid = (String) session.getAttribute("id");
	if(uid ==null){
		response.sendRedirect("/user/login.jsp");
		return;
	}//세션 정보를 확인해서 로그인 상태인지 확인한 후 진입 허용

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 등록</title>
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

		<%!String title = "⭐ 상품 등록 🔍";%>

		<div class="alert alert-secondary text-center" role="alert">
			<div class="container">
				<h3 class="display-20">
					<%=title%>
				</h3>
			</div>
		</div>
		

		<div class="container shadow mx-auto mt-5 p-5 w-75 rounded">
			<form action="productadddb.jsp" method="post" enctype="multipart/form-data" align="center">
				<div class="form-group row justify-content-center">
					<label class="col-sm-2">상품 코드</label>
					<div class="col-sm-5">
						<input type="text" name="pid" class="form-control">
					</div>
				</div>

				<div class="form-group row justify-content-center">
					<label class="col-sm-2">상품명</label>
					<div class="col-sm-5">
						<input type="text" name="pname" class="form-control">
					</div>
				</div>

				<div class="form-group row justify-content-center">
					<label class="col-sm-2">가격</label>
					<div class="col-sm-5">
						<input type="text" name="pprice" class="form-control">
					</div>
				</div>

				<div class="form-group row justify-content-center">
					<label class="col-sm-2">상품 설명</label>
					<div class="col-sm-5">
						<textarea name="pdesc" cols="50" rows="5" class="form-control">
						</textarea>
					</div>
				</div>

				<div class="form-group row justify-content-center">
					<label class="col-sm-2">제조사</label>
					<div class="col-sm-5">
						<input type="text" name="pmanu" class="form-control">
					</div>
				</div>

				<div class="form-group row justify-content-center">
					<label class="col-sm-2">카테고리</label>
					<div class="col-sm-5">
						<select class="form-select form-select mb-3" name="pcate" aria-label=".form-select-lg example">
							<option selected>종류</option>
							<option value="스마트폰">스마트폰</option>
							<option value="태블릿">태블릿</option>
							<option value="컴퓨터">컴퓨터</option>
							<option value="노트북">노트북</option>
							<option value="주변기기">주변기기</option>
						</select>
					</div>
				</div>

				<div class="form-group row justify-content-center">
					<label class="col-sm-2">상품종류</label>
					<div class="col-sm-5">
						<input type="radio" class="btn-check" name="pcondi" value="신제품" id="option1" autocomplete="off">
						<label class="btn btn-secondary" for="option1">신상</label>
						<input type="radio" class="btn-check" name="pcondi" value="중고품" id="option2" autocomplete="off">
						<label class="btn btn-secondary" for="option2">중고</label>
						<input type="radio" class="btn-check" name="pcondi" value="재고품" id="option3" autocomplete="off">
						<label class="btn btn-secondary" for="option3">재고</label>
						<input type="radio" class="btn-check" name="pcondi" value="기타" id="option4" autocomplete="off">
						<label class="btn btn-secondary" for="option4">기타</label>
					</div>
				</div>
				
				<br>
				<div class="form-group row justify-content-center">
				<div class="col-sm-8">
  					<label for="formFileMultiple" class="form-label">사진 업로드 📷</label>
  					<input class="form-control" name="pimages" type="file" id="formFileMultiple" multiple>
				</div>
				</div>
				
				
				<br>
				<div class="form-group row justify-content-center">
					<div class="col-sm-4">
						<input type="submit" class="btn btn-dark form-control" value="등록">
					</div>
					<div class="col-sm-4">
						<input type="reset" class="btn btn-dark form-control" value="취소">
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