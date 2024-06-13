<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
	<div id="log">
		<br />
		<div id="p"> 미니 홈페이지를 안전하게 이용하세요. </div>
		<input type="button" id="logBtn" value="로그인" onclick="location.href='login.do'" />
		<br />
		<a href="loginfind.do" id="findid"> 아이디 찾기 </a>&nbsp;|&nbsp;
		<a href="passwordfind.do" id="findpswd"> 비밀번호 찾기 </a>&nbsp;|&nbsp;
		<a href="register.do" id="new"> 회원가입 </a>
		<br />
	</div>
</body>
</html>