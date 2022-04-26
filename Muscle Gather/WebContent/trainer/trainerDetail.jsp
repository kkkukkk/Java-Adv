<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="jdbc.*"%>
<%
	request.setCharacterEncoding("UTF-8");
	String user_email = (String) session.getAttribute("user_email");
	if(user_email == null){
		response.sendRedirect("/Muscle_Gather/user/login.jsp");
		return;
	}//세션 정보를 확인해서 로그인 상태인지 확인한 후 진입 허용
	session.setAttribute("user_email", user_email);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자세히 보기</title>
</head>
<body>
	<script>
	
	function work(trainer_no, gym_no){
		
		var result = confirm("해당 트레이너에게 관심을 보내시겠습니까?")
		
		if (result == true){
			location.href="trainerResume.jsp?trainer_no="+trainer_no+"&gym_no="+gym_no;
		}else{
			alert("취소하였습니다😥");
		}
		
	}

	
	</script>


<!-- CSS only -->
	<link
		href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
		rel="stylesheet"
		integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
		crossorigin="anonymous">


	<%!String title = "📖 자세히보기 📚";%>

	<div class="alert alert-light text-center" role="alert">
		<div class="container">
			<h3 class="display-20">
				<%=title%>
			</h3>
		</div>
	</div>


	<%
		String trainer_no = request.getParameter("trainer_no");
	
		TrainerDTO trainer = (new TrainerDAO()).getTrainerDetail(trainer_no);
		String addr = trainer.getTrainer_addr();
		String gym_no = new GymDAO().getGymNOSession(user_email);
		String user = trainer.getTrainer_title();
		String cnt = new TrainerDAO().getResumeCountTrainer(trainer_no);
	%>
		
	<div class="shadow mx-auto mt-5 p-5 w-75 rounded">
	<div class = "row">
	<div class = "col-ma-6">
	
	
		<p>유저 명 : <%=trainer.getUser_name() %>
		<p>유저 번호 : <%=trainer.getUser_no() %>
		<p>트레이너 명 : <%=trainer.getTrainer_title() %>
		<p>트레이너 번호 : <%=trainer_no %>
		<p>내용 : <%=trainer.getTrainer_content() %>
		<p>등록일자 : <%=trainer.getTrainer_regdate()%>
		<p>희망지역 : <%=addr%>
		<p>관심 수 : <%=cnt %>
		
	<%
	if (trainer.getTrainer_images() != null){
	%>		
	<div class = "col-ma-5">
		<img src="/images/<%=trainer.getTrainer_images()%>" style="width:100%">
	</div>
	<%}%>
	
	<%
	if (trainer.getTrainer_addr() != null){ 
	%>
		<div id="map" style="width:100%;height:350px;"></div>
	
			<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=703a92aa4dcf728f3581378ae320a65a&libraries=services"></script>
			<script>
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			    mapOption = {
			        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			        level: 3 // 지도의 확대 레벨
			    };  
			
			// 지도를 생성합니다    
			var map = new kakao.maps.Map(mapContainer, mapOption); 
			
			// 주소-좌표 변환 객체를 생성합니다
			var geocoder = new kakao.maps.services.Geocoder();
			
			var addr = "<%=addr%>"; 
			var user = "<%=user%>";
	
			// 주소로 좌표를 검색합니다
			geocoder.addressSearch(addr, function(result, status) {
			
			    // 정상적으로 검색이 완료됐으면 
			     if (status === kakao.maps.services.Status.OK) {
			
			        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
			
			        // 결과값으로 받은 위치를 마커로 표시합니다
			        var marker = new kakao.maps.Marker({
			            map: map,
			            position: coords
			        });
			
			        // 인포윈도우로 장소에 대한 설명을 표시합니다
			        var infowindow = new kakao.maps.InfoWindow({
			            content: '<div style="width:150px;text-align:center;padding:6px 0;"><%=user%></div>'
			        });
			        infowindow.open(map, marker);
			
			        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
			        map.setCenter(coords);
			    } 
			});    
			</script>
		<%
			} else{
		    	out.print("<script>alert('주소가 존재하지 않는 회원입니다 😥')</script>");
		    }
		%>

		<br><br>
		<div>
			<button type="button" class="btn btn-info" onclick='work(<%=trainer_no%>,<%=gym_no%>)'>좋아요👍</button>
			<button type= "button" onclick="location.href='trainerListPaging.jsp'" class="btn btn-secondary">글 목록</button>
		</div>
	
	</div>
	</div>
	</div>






	<!-- JavaScript Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>

</body>
</html>