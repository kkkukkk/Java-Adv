<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <div class="container-fluid">
    <a class="navbar-brand" href="db_input_student.jsp">π <b>νμκ΄λ¦¬ νλ‘κ·Έλ¨</b>π </a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="db_table_list.jsp">νμλͺ©λ‘</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="db_input_student.jsp">νμλ±λ‘</a>
        </li>
        
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            νμκ΄λ¦¬
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
            <li><a class="dropdown-item" href="db_std_form.jsp">λ‘κ·ΈμΈ</a></li>
            <li><a class="dropdown-item" href="db_logout.jsp">λ‘κ·Έμμ</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="#">νμκ°μ</a></li>
            <li><a class="dropdown-item" href="#">νμνν΄</a></li>
          </ul>
        </li>
        
        <li class="nav-item">
          <a class="nav-link disabled">κ΄λ¦¬μ</a>
        </li>
      </ul>
      <form class="d-flex">
        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
        <button class="btn btn-outline-dark" type="submit">π</button>
      </form>
    </div>
  </div>
</nav>
