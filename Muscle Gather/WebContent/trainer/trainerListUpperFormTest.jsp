<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>

.upperForm{
	border-top: double #f3a950;
	border-bottom: double #f3a950;
	justify-content: space-between;
	display:flex;
}
.addrsearch{
	background-color:black;
	width:50%;
	display:flex;
	justify-content: flex-start;
}

.contentSearch{
	background-color:black;
	width:50%;
	display:flex;
	justify-content: flex-end;
}
.addrSearchButton{
	border-radius: 0px 7px 7px 0px;
	background-color:#f3a950;
	height:35px;
	width:50px;
}
.contentSearchButton{
	border-radius: 0px 7px 7px 0px;
	background-color:#f3a950;
	height:35px;
	width:50px;
}

.addrInput{
	height:35px;
	display:flex;
}
.contentInput{
	height:35px;
	display:flex;
}
input[type="text"] {
	border-radius:  7px 0px 0px 7px;
	background-color:#EFEEEE;
}
button[id="goback"] {
	border-radius: 7px;
	margin:auto;
	padding: 10px 15px;
	text-align:center;
	font-size: 20px;
	background-color:#f3a950;
	display:flex;
	justify-content: flex-end;
}

</style>

<div class="upperForm">
	<div class="addrSearch" >
		<form method="post" name="search" action="trainerListSearchAddrTest.jsp">
			<div class="addrInput">
			<input type="text" class="searchBar" placeholder="거주중인 도/시 입력" name="searchaddrinfo">
		  	<button type="submit"  class="addrSearchButton">🔍</button>
		  	</div>
		</form>
	</div>
	
	<div class="contentSearch">
		<form method="post" name="searchinfo" action="trainerListSearchTest.jsp">
			<div class="contentInput">	  	
  			<input type="text" class="searchBar" placeholder="검색 내용 입력" name="searchinfo">
  			<button type="submit" class="contentSearchButton">검색</button>
  			</div>
		</form>
	</div>
</div>
