<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<script>
function mailbox(){
	var win=window.open("/mail.do","_blank","width=500px, height=600px, location=no,menubar=no,resizable=no,titlebar=no,left=300,top=300");
	
}
</script>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Archivo+Black&display=swap">
<link rel="stylesheet" href="css/mainpage/loginProfile.css">

</head>
<body>
	<div id="profile">
		<br />
		<div id="p"> ${user.nickname } 님 </div>
		<img class="profile-img" src="${user.photo }" alt="프로필" />
		<br />
		<div id="a">
			<a href="logout.do" id="logout"> 로그아웃 </a>&nbsp;|&nbsp;
			<a href="modify.do" id="modify"> 정보 수정 </a>&nbsp;|&nbsp;
			<a href=""  id="note" onclick='mailbox(); return false;'> 쪽지   </a>
		</div>
		<br />
		<input type="button" id="miniBtn" value="내 미니홈피 가기" onclick="location.href='gomini.do'" />
	</div>
</body>
</html>

