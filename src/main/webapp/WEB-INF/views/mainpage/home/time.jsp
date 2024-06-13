<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function updateClock() {
	    var now = new Date();
	    var hours = now.getHours();
	    var minutes = now.getMinutes();
	    var seconds = now.getSeconds();
	    var ampm = hours >= 12 ? 'PM' : 'AM';
	    
	    var year = now.getFullYear();
	    var month = now.getMonth() + 1;
	    var date = now.getDate();
	    
	    
	    hours = hours % 12;
	    hours = hours ? hours : 12;
	    
	    hours = hours < 10 ? '0' + hours : hours;
	    minutes = minutes < 10 ? '0' + minutes : minutes;
	    seconds = seconds < 10 ? '0' + seconds : seconds;
	
	    var timeString = hours + ':' + minutes + ':' + seconds;
	    var dateString = year + "년 " + month + "월 " + date + "일";
	    document.getElementById('clock-time').innerText = timeString;
	    document.getElementById('clock-ampm').innerText = ampm;
	    document.getElementById('clock-date').innerText = dateString;
	}
	
	setInterval(updateClock, 1000);
	window.onload = updateClock;
    </script>
</head>
<body>
	<div id="time">
		<div class="clock-container">
	        <span class="clock-ampm" id="clock-ampm"></span>
	        <span class="clock-time" id="clock-time"></span>
	        <div class="clock-date" id="clock-date"></div>
	    </div>
	</div>
</body>