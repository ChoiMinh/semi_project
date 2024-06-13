<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<script>
function mailbox(){
	var win=window.open("/mail.do","_blank","width=500px, height=600px, location=no,menubar=no,resizable=no,titlebar=no,left=300,top=300");
}
</script>
<style>
.mypage{
	position:relative;
	margin: 0px auto;
	width:720px;
	height:800px;
}
.mypage_logo{
	position:absolute;
	display:inline;
	left:5px;
	top:25px;
}
.mypage_logo a{
	text-decoration:none;
}

.modify_side_menu{
	position: absolute;
    left: 20px;
    top: 136px;
    width: 205px;
    height: 303px;
    border-radius:30px;
    border:3px solid green; 
}

.main_box{
    position: absolute;
    left: 270px;
    top: 21px;
    width: 419px;
    height: 750px;
}

.modify_side_menu > div{
	margin:35px auto;
	text-align:center;
	font-size:30px;
	font-weight:bold;
	padding-top:7px;
	width:190px;
	height:43px;
}
a.sidemenu{
	text-decoration:none;
	color:#728875;
}
a.sidemenu:hover{
	color:green;
}
button.sidemenu{
	position:absolute;
	left:5px;
	right:5px;
	top:123px;
	width:190px;
	height:50px;
	color:#728875;
	font-weight:bold;
	font-size:35px;
	border:none;
	background-color:#FFFFFF;
}

button.sidemenu:hover{
	color:green;
	cursor:grab;
}

</style>
<head>
	<meta charset="UTF-8">
</head>
<body>
<div class="mypage">
<div class="mypage_logo">
	<h1><a href="/">Commemorative</a><br> <a href="/" >Garden</a></h1>
</div>
<div class="modify_side_menu">
	<div class="info_section">
		<a class="sidemenu" href="/modify.do">
			<span>내 정보 관리</span>
		</a>
	</div>
	<div class="message_section">
		<button type="button" class="sidemenu" onclick="mailbox()">쪽지함</button>
	</div>
	<div class="friend_section">
		<a class="sidemenu" href="/myFriendList.do">
			<span>내 친구 관리</span>
		</a>
	</div>	
</div>
<div class=main_box>
	<c:if test="${section eq 1}">
		<jsp:include page="modifyPage.jsp"></jsp:include>
	 </c:if>
	<c:if test="${section eq 3 }">
		<jsp:include page="myFriendList.jsp"></jsp:include>
	</c:if>
</div>
</div>
</body>
</html>