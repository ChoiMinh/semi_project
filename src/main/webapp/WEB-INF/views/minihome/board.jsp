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
	 <style type="text/css">
    	.postObject > td {border-bottom: 1px solid lightgray;}
    	#board { list-style : none; width: 100%; height:0%; vertical-align: top; text-align: center; border-collapse: collapse;}
    	.boardHeader > th {border-top: 3px solid skyblue; border-bottom: 1px solid black;}
    	  .menu-button:first-child{
			  	position: absolute;
			    left: 1182px;
			    margin-top: 3rem;
			  }
    </style>
    <script>
    	//post prototype
    	function Post(pid, name, author, datetime){
    		this.pid = pid;
    		this.name = name;
    		this.author = author;
    		this.datetime = datetime;
    		
    		this.generateObject = function(){
    			let res = document.createElement("tr");
    			res.className = "postObject";
    			//res.setAttribute("class", "postObject");
    			res.innerHTML = "<td>"+pid+"</td><td style = \"text-align:left\"><a href=post.jsp?pid="+pid+">"+name+"</a></td><td>"+author+"</td><td>"+datetime+"</td>";
    		
    			return res;
    		}
    	}
    	
    	var posts = [new Post(0, "이게 맞나... =_=", "일조짱", "2024/06/12"), new Post(1, "프로젝트 T.T", "일조짱", "2024/06/13")];
    	
    	var postObjects = [];
    	function updateBoard(){
    		let board = document.getElementById("board");
    		
    		for(let i = 0; i < postObjects.length; i+=1){
    			board.removeChild(postObjects[i]);
    		}
    		postObjects = [];
    		for(let i = posts.length-1; i >= 0; i-=1){
    			board.appendChild(posts[i].generateObject());
    		}
    	}
    </script>
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
                <div class="box-title">게시판 </div>
                <div class="miniroom-gif-box">
                   <!-- 사진 출처 : https://lrl.kr/gyqJ -->
                   <table id = "board">
                  	<tr class = "boardHeader"><th>번호</th><th style = "width:60%;">제목</th><th>작성자</th><th style = "width:20%">일시</th></tr>
                  </table>
                  <script>updateBoard();</script>
                </div>
                <div style = "text-align:right">
                	<button style="border:1px solid black; background-color: lightgrey; text-align:center; vertical-align:bottom"><b>글쓰기</b></button>
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
</body>
</html>
