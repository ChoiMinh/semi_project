<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="time">
		<form id="weather">
			날씨 :
			<br />
			시간 : <%
	                java.time.LocalDateTime now = java.time.LocalDateTime.now();
	                java.time.format.DateTimeFormatter formatter = java.time.format.DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
	                String formattedNow = now.format(formatter);
	                out.print(formattedNow);
	              %>
		</form>
	</div>
</body>
</html>