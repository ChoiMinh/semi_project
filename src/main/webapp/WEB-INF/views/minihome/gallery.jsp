<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="jakarta.servlet.http.Cookie" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>미니홈</title>
<style>
@font-face {
    font-family: 'Happy_dobi';
    src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/naverfont_05@1.0/Happy_dobi.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
.album .album_title{
	border-left:none;
	border-right:none;
	border-bottom:none;
	border-top:1px solid gray;
}
.album .album_title:nth-child(n+2){
	margin-top:70px;
}

.album_title{
	position:relative;
	font-size:19px;
	text-align:center;
	background-color:#E2E2E2;
	margin-top:5px;
	margin-left :17px;
	border:1px solid black;
	width:674px;
	height:33px;
	text-align:center;
}

.album_picture{
	text-align:center;
	margin-top:5px;
	margin-left :5px;
	width:690px;
	height:300px;
}

.album_img{
	width:650px;
	height:310px;
}

.album_content{
	font-family:'Happy_dobi';
	font-size:55px;
	color:black;
	padding-left:30px;
}
.album_delete{
	position:absolute;
	left:620px;
	top:4px;
	background-color:gray;
	border-radius:5px;
	color:white
}
.album_delete:hover{
	background-color:red;
}
  .menu-button:first-child{
  	position: absolute;
    left: 1182px;
    margin-top: 3rem;
  }
</style>
<script>
album_list();
let commentIndex=0;
function doGet(url){
	const xhr=new XMLHttpRequest();
	xhr.onload=function(){
		data=JSON.parse(xhr.response);
		console.dir(JSON.parse(xhr.response));
		makeComponent(data);
	}
	xhr.open("GET","http://localhost:8099/"+url,true);
	xhr.send();
}

function album_list(){
	doGet("album/list.do");
}

function album_delete(btn){
	doGet("album/delete.do?seq="+btn.dataset.seq);
	history.go(0);
}


function makeComponent(d){
let container=document.querySelector(".album");
container.innerHTML="";
for(let i=0;i<d.length;i++){
	container.innerHTML+=`
		<div class="album_title">\${d[i].title}<button class="album_delete" data-seq="\${d[i].seq}" onclick="album_delete(this)">삭제</button></div>
		<div class="album_picture"><img class="album_img" src='\${d[i].album}' width="50px" height="50px"></div>
		<div class="album_content">\${d[i].content}</div>
		<div class="album_comment"></div>
	`;
	}
}
/*
 function userPhotoChange(){
		let imgInput=document.getElementById('album');
		let nameIndex=img.src.indexOf(".jpg")-1;
		nameIndex=parseInt(img.src.charAt(nameIndex))+1;
		
		if(nameIndex==6) nameIndex=1;
		let imgURL="images/album/"+nameIndex+".jpg";
		img.src=imgURL;
		imgInput.value=imgURL;
	}
 }
 */
</script>
<link rel="stylesheet" href="css/comment/style.css">
   <link rel="stylesheet" href="css/minihome/font.css" />
    <link rel="stylesheet" href="css/minihome/layout.css" />
    <link rel="stylesheet" href="css/minihome/home.css" />
    
    <%
   SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
   String currentDate = sdf.format(new Date());

   Cookie[] cookies = request.getCookies();
   String savedDate = null;
   int dailyVisitCount = 0;

   if (cookies != null) {
      for (Cookie cookie : cookies) {
         if ("visitDate".equals(cookie.getName())) {
            savedDate = cookie.getValue();
         }
         if ("dailyVisitCount".equals(cookie.getName())) {
            dailyVisitCount = Integer.parseInt(cookie.getValue());
         }
      }
   }

   if (!currentDate.equals(savedDate)) {
      dailyVisitCount = 1;
   } else {
      dailyVisitCount++;
   }
   
   Cookie dateCookie = new Cookie("visitDate", currentDate);
   dateCookie.setMaxAge(24 * 60 * 60);
   response.addCookie(dateCookie);

   Cookie countCookie = new Cookie("dailyVisitCount", String.valueOf(dailyVisitCount));
   countCookie.setMaxAge(24 * 60 * 60);
   response.addCookie(countCookie);

   String path = application.getRealPath("/") + "totalVisitCount.txt";
   int totalVisitCount = 0;
   File file = new File(path);

   if (file.exists()) {
      try (BufferedReader br = new BufferedReader(new FileReader(file))) {
         totalVisitCount = Integer.parseInt(br.readLine());
      } catch (Exception e) {
         e.printStackTrace();
      }
   }
        
   try (BufferedWriter bw = new BufferedWriter(new FileWriter(file))) {
      if (!currentDate.equals(savedDate)) {
      totalVisitCount++;
      }
         bw.write(String.valueOf(totalVisitCount));
      } catch (Exception e) {
         e.printStackTrace();
      }
   %>
</head>
<body>
   <div class="mainhome">
      <div class="dot">
        <div class="page">
          <div class="profile-container">
            <div class="profile-title">
              TODAY &nbsp;<span class="color-red"> <%= dailyVisitCount %> </span> &nbsp; | TOTAL <%= totalVisitCount %>
            </div>
            <div class="box profile-box">
              <div class="profile-image">
                <img class="profile-image-img" src="images/minihome/x.jpg" alt="프로필" />
              </div>
              <div class="profile-text font-kyobohand">
               ㅎb들ズl 않ㅇr… つㅓ친 정글øłl 뛰øł든 건 ㄴrLI까..
              </div>
              
              <!-- 날씨 및 시간 프레임 -->
              <div>
                <h5>현재 날씨</h5>
                <div id="weather"></div>
                <h5>현재 시간</h5>
                <div id="time"></div>
              </div>

              <div class="profile-username font-kyobohand">
                <span style="color: #0f1b5c"> 일조짱 </span> (♪♬)
              </div>
              <div class="profile-dropdown">
                <div class="dropdown-button">
                  <div class="dropdown-title"> 파도타기 </div>
                  <div class="triangle-down"></div>
                </div>
                <div class="dropdown-content">
                  <a href="https://www.youtube.com" target="_blank"> 유튜브 바로가기 </a>
                  <a href="https://www.facebook.com" target="_blank"> 페이스북 바로가기 </a>
                  <a href="https://www.instagram.com" target="_blank"> 인스타그램 바로가기 </a>
                </div>
              </div>
            </div>
          </div>
          <div class="content-container">
            <div class="header content-title">
              <div class="content-title-name"> ♂우zl으lАŁㄹБ포러l버♀★ </div>
              <div class="content-title-url"> https://url주소/나중에입력 </div>
            </div>
            <div class="box content-box">
              
               
             
              <div class="miniroom">
                <div class="box-title"> GALLERY </div>
                <div class="miniroom-gif-box">
                   <!-- 사진 출처 : https://lrl.kr/gyqJ -->
                 <div class="album">
                 </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="menu-container">
            <div class="menu-button">
              <a href="gomini.do"><button> 홈 </button></a>
              <a href="goGallery.do"><button> 사진첩 </button></a>
              <a href="goBoard.do"><button> 게시판 </button></a>
            </div>
          </div>
        </div>
      </div>
    </div>

    <script>
        function fetchWeather() {
            fetch('http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getVilageFcst?serviceKey=인증키&numOfRows=10&pageNo=1')
                .then(response => response.json())
                .then(data => {
                    document.getElementById('weather').textContent = JSON.stringify(data, null, 4);
                })
                .catch(error => console.error('Error fetching weather data:', error));
        }

        function fetchTime() {
            const now = new Date();
            const timeString = now.toLocaleTimeString();
            document.getElementById('time').textContent = timeString;
        }
        
        function playSong(song) {
            const audioPlayer = document.getElementById('audioPlayer');
            audioPlayer.src = song;
            audioPlayer.play();
          }

        setInterval(fetchTime, 1000); // 1초마다 시간 업데이트
        fetchWeather(); // 페이지 로드 시 날씨 데이터 가져오기
    </script>
<!-- 
    <script src="/javascript/comment.js"></script>
    <script>
        document.getElementById('likeButton').addEventListener('click', function() {
            var likeCountSpan = document.getElementById('likeCount');
            var likeCount = parseInt(likeCountSpan.textContent);
            likeCount++;
            likeCountSpan.textContent = likeCount;

            // AJAX 요청 보내기
            var xhr = new XMLHttpRequest();
            xhr.open('POST', '/comment/like', true);
            xhr.setRequestHeader('Content-Type', 'application/json');
            xhr.send(JSON.stringify({ likeCount: likeCount }));
        });
         -->
    </script>

</body>
</html>
