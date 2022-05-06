<%@page import="java.util.StringTokenizer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="jdbc.*"%>
<%
	request.setCharacterEncoding("UTF-8");
	String user_email = (String) session.getAttribute("user_email");
	String user_no = (String) session.getAttribute("user_no");
	if(user_email == null){
		response.sendRedirect("/Muscle_Gather/user/logintest.jsp");
		return;
	}//세션 정보를 확인해서 로그인 상태인지 확인한 후 진입 허용
	session.setAttribute("user_email", user_email);
	session.setAttribute("user_no", user_no);
%>

<!DOCTYPE html>
<html lang="kr">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<title>검색 결과</title>

    <link type="text/css" rel="stylesheet" href="../css/default.css" />

	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<link rel="stylesheet"href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
	
    <script type="text/javascript" src="../js/jquery-3.6.0.min.js"></script>
    <script type="text/javascript" src="../js/default.js"></script>
    <script>
	
	function work(trainer_no, gym_no){
		
		var result = confirm("해당 트레이너에게 관심을 보내시겠습니까?")
		
		if (result == true){
			location.href="trainerResumeTest.jsp?trainer_no="+trainer_no+"&gym_no="+gym_no;
		}else{
			swal("취소하다니!","취소하였습니다😥","error");
		}
		
	}
	
	function show(){
		document.getElementById("map").style.display="";
	}
	
	function hide(){
		document.getElementById("map").style.display="none";		
	}

	</script>
    
    <style>
    body{
    display:flex;
    justify-content: center;
    }
    
    .title{
    height: 75px;
    font-size: 22px;
    align-items: center;
    display:flex;
    justify-content:center;
    }
    
    #map{
    margin:auto;
    width:92%;
    height:450px;
    margin-top:35px;
    
    }
    
    #mapbtn{
    margin-top:10px;
    margin-left: 73%;
    margin-bottom:10px;
    }
    
    #infos{
    margin:auto;
    margin-top:20px;
    margin-bottom:20px;
    width:92%;
    height:100%;
    }
    
    #endbtn1{
    width:200px;
    height:50px;
    background-color:#5F95FA;
    border-radius: 7px 0px 0px 7px;
    color:white;
    font-size: 18px;
    font-weight:bold;
    }
    
    #endbtn2{
    width:200px;
    height:50px;
    background-color:#5F95FA;
    border-radius: 0px 7px 7px 0px;
    color:white;
    font-size: 18px;
    font-weight:bold;
    }
    
    #marker{
    color:black;
    font-weight:bold;
    }
    
    .content{
    display:flex;
    }
    
    .endbuttons{
    margin-top:10px;
	display:flex;
	justify-content: center;
    }
    
    #infos > div {
    width:100%;
    margin-left:4px;
    font-weight:bold;
    margin-bottom:3px;
    }
    
    .image{
    margin-left:24px;
    margin-top:65px;
    height: 600px;
    }
    
    .wkwkw{
    color:white;
    align-items:center;
    }

    
    #titlesec{
    height: 100%;
    min-height: 6vh;
    border: 1px solid #f3a950;
    }
    
    section:nth-child(2n) {
    background: black;
	}
	
	#imagesec{
	width:50%;
	min-height:78vh;
	border:none;
	border-right: 1px solid #f3a950;
	}
	
	#infosec{
	width:50%;
	border:none;
	}
	
	#btnsec{
	min-height: 0vh;
	border:none;
	margin-bottom:10px;
	}

    </style>
    
</head>
<body>
	<div class="wrap">
			<!-- header-->
			<header id="header">
			</header>
	
			<!-- hidden nav-->
			<nav id="nav"></nav>
	
			<!-- hidden sideBar-->
			<aside id="sideBarA" class="">
				<div class="sideWrap">sideA</div>
			</aside>
	
			<aside id="sideBarB" class="">
				<div class="sideWrap">sideB</div>
			</aside>

			<main>
				
			<div class="mainWrap">
			<section id="titlesec">
	

	<%!String title = "📖 자세히보기 📚";%>
		<div class="title">
			<h2><%=title%></h2>
		</div>
	</section>
		
	<%
		String trainer_no = request.getParameter("trainer_no");
	
		TrainerDTO trainer = (new TrainerDAO()).getTrainerDetail(trainer_no);
		String gym_no = new GymDAO().getGymNOSession(user_email);
		String addr = trainer.getTrainer_addr();
		String user = trainer.getTrainer_title();
		String cnt = new TrainerDAO().getResumeCountTrainer(trainer_no);
	%>
		
	
	<section class="sec1 sec_plus">
	<div class = "content">

	<section id = "imagesec">
	
	<%
		if (trainer.getTrainer_images() != null){
			
			StringTokenizer st = new StringTokenizer(trainer.getTrainer_images(), "/");	// 매개변수를 2개 입력, 첫번째: 가공할 문자열 / 두번째: 구분자
			
			while(st.hasMoreTokens()){	//hasMoreTokens 다음 토큰이 존재하는지 불린타입으로 반환
	%>
		
			<div id=image>
			<img src="/images/<%=st.nextToken()%>" style="width:96%;" class="image">
			</div>
			
	<%
		}
	}
	%>
	
	</section>
	
	<section id="infosec">
	<div id="infomap">
		<div id="infos">
			<div>유저 명 : <%=trainer.getUser_name() %></div>
			<div>유저 번호 : <%=trainer.getUser_no() %></div>
			<div>트레이너 명 : <%=trainer.getTrainer_title() %></div>
			<div>트레이너 번호 : <%=trainer_no %></div>
			<div>내용 : <%=trainer.getTrainer_content() %></div>
			<div>등록일자 : <%=trainer.getTrainer_regdate()%></div>
			<div>희망지역 : <%=addr%></div>
			<div>관심 수 : <%=cnt %></div>
		</div>
	
	
	<%
	if (trainer.getTrainer_addr() != null){ 
	%>	
		<div id="map" class="mapmapmapmap"></div>
		<div id="mapbtn">
		<button type="button" onclick="show()">지도 보이기</button>
		<button type="button" onclick="hide()">지도 숨기기</button>
		</div>
	
	
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
			            content: '<div id="marker" style="width:150px;text-align:center;padding:6px 0;"><%=user%></div>'
			        });
			        infowindow.open(map, marker);
			
			        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
			        map.setCenter(coords);
			    }else{
			    	swal("","주소가 존재하지 않는 회원입니다 😥","warning");
			    }
			});    
			</script>
		<%
			}
		%>
		
	</div>
	</section>
	
	

	</div>

	</section>
	
	<section id="btnsec">
		<div class="endbuttons">
			<button type="button" id="endbtn1" onclick='work(<%=trainer_no%>,<%=gym_no%>)'>좋아요👍</button>
			<button type="button" id="endbtn2" onclick="location.href='trainerListTest.jsp'">글 목록</button>
		</div>
	</section>

        </div>
    </main>
	<footer id="footer">

    </footer>
	
	
	</div>
</body>
</html>