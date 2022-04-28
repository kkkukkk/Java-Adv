<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>

    <!-- Custom styles for this template --> 
    
</head>
 <body class="text-center">
   <!-- CSS only -->
		<link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
      crossorigin="anonymous">
  
      
          
<main class="form-signin">
  <form action="logindb.jsp" method="POST">
    <h1 class="h3 mb-3 fw-normal">로그인🔑</h1>

    <div class="form-floating">
      <input type="email" name="user_email" class="form-control" id="user_email">
      <label for="floatingInput">이메일</label>
    </div>
    <div class="form-floating">
      <input type="password" name="user_pw" class="form-control" id="floatingPassword">
      <label for="floatingPassword">비밀번호</label>
    </div>

    <div class="checkbox mb-3">
      <label>
        <input type="checkbox" name="remember" id="remember"> 로그인 기억
      </label>
    </div>
    <button class="w-100 btn btn-lg btn-dark" type="submit" id=loginbtn>로그인</button>
  </form>
</main>




   <!-- JavaScript Bundle with Popper -->
   <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
      crossorigin="anonymous"></script>




    
  </body>
</html>