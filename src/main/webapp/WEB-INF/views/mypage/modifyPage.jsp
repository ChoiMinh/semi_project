<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<script>
var userPassword='${user.password}';
var userNickname='${user.nickname}';
var pwPattern = /\s/g;
var nicknameCheck=/[^\w\sㄱ-힣()0-9]/g
let isErrorOnNickname=true;
let isNicknameDupCheck=false;

function onNicknameKeyUp(){
	let nickname=document.querySelector("#nick").value;
	let msg=document.querySelector(".errMsg");
	console.log(nicknameCheck.test(nickname)+"/nickname : "+nickname);
	if((nickname.length<3 || nickname.length>12) || nicknameCheck.test(nickname)){
		msg.innerHTML="<span><b>닉네임은</b>3~12자의 영문, 숫자, 한글만 사용이 가능합니다.<span>"
		isErrorOnNickname=true;
	}else{
		msg.innerHTML="";
		isErrorOnNickname=false;
	}
}
function nicknameDupCheck(){
	let msg=document.querySelector(".errMsg");
	let nickname=document.querySelector("#nick");
	if(nickname.value=="" || isErrorOnNickname){
		msg.innerHTML="<span><b>닉네임</b>이 비어있거나 형식에 맞지 않습니다.</span>";
		return;
	}
	const xhr=new XMLHttpRequest();
	xhr.onload=function(){
		let isDup=JSON.parse(xhr.response);
		console.log(isDup);
		if(isDup){
			msg.innerHTML="<span><b>닉네임</b>이 중복됩니다.</span>";
			isNicknameDupCheck=false;
		}else{
			isNicknameDupCheck=true;
		}
	}
	xhr.open("GET","http://localhost:8099/nicknameCheck.do?nickname="+nickname.value,true);
	xhr.send();
}
function userPhotoChange(){
	let img=document.getElementById('preview');
	let imgInput=document.getElementById('photo');
	let nameIndex=img.src.indexOf(".jpg")-1;
	nameIndex=parseInt(img.src.charAt(nameIndex))+1;
	
	if(nameIndex==10) nameIndex=1;
	let imgURL="images/userProfileImg/"+nameIndex+".jpg";
	img.src=imgURL;
	imgInput.value=imgURL;
}

function inputValidation(){
	let pw=document.querySelector("#pw");
	let ori=document.querySelector("#ori");
	let msg=document.querySelector(".errMsg");
	let nickname=document.querySelector("#nick");
	let ori_check=document.querySelector("#ori_check");
	
	if(nickname.value=="" || nickname.value==userNickname){
		console.log("닉네임 그대로 유지");
	}else{
		nicknameDupCheck();
		if(!isNicknameDupCheck){
			console.log("닉네임 중복됨");
			return false;
		}
	}
	/*  오류 발생으로 막아버림
	//비밀번호도 같이 변경하는 경우
	if(!(ori.value==null && ori.value=="")){
		if((pw.value=="" || pw.value==null)){
			msg.innerHTML="<span><b>비밀번호</b>를 입력해주세요.<span>";
			pw.focus();
			return false;
		}
		if(pw.value!=userPassword){
			console.log("pw : "+pw.value+"/userPassword : "+userPassword);
			msg.innerHTML="<span>입력한 현재 <b>비밀번호</b>가 원래 비밀번호와 다릅니다.";
			pw.focus();
			return false;
		}
		if(ori.value!=ori_check.value){
			msg.innerHTML="<span><b>비밀번호</b>가 <b> 확인 비밀번호</b>와 다릅니다.<span>";
			ori.focus();
			return false;
		}
		if(ori.value.length>16 || ori.value.length<4){
			msg.innerHTML="<span><b>비밀번호</b>는 최소 4글자 최대 16글자를 입력하셔야 합니다.<span>";
			ori.focus();
			return false;
		}
		
	}
	*/
}

</script>
<style>
.modifyPage_main_box{
	position:relative;
	margin:11px;
	width:395px;
	height:715px;
	border:3px solid green;
}

.profile_img{
	position:absolute;
	left:5px;
	top:5px;
	border-radius:25px;
	width:250px;
	height:250px;
	overflow:hidden;
}
.changeProfile{
	position:absolute;
	left:265px;
	top:235px;
	border-radius:30px;
	background-color:#728875;
	color:white;
}
.changeProfile:hover{
	background-color:green;
}
.modifyPage_user_profile{
	position:absolute;
	left:15px;
	top:315px;
	width:360px;
	height:auto;
}
.current_password{
	border:3px solid green;
	border-radius:5px 5px 0px 0px;
	border-bottom:none;
}
.change_password_ori{
	border:3px solid green;
	border-bottom:none;
}
.change_password{
	border:3px solid green;
	border-radius:0px 0px 5px 5px; 
}
.password_input_form > div{
	height:30px;
}
.password_input_form > div > span{
	position:absolute;
	margin-top:5px;
	font-weight:bold;
	color:#728875
}
input[type="password"]{
	margin-left:122px;
	margin-top:4px;
	height:17px;
}
.nickname_input_form{
	position:absolute;
	padding-top:5px;
	padding-left:34px;
	left:15px;
	top:487px;
	width:324px;
	height:28px;
	border-radius:5px;
	border:3px solid green;
	color:#728875;
	font-weight:bold;
}

#nick{
	margin-left:40px;
}
.errMsg{
	position:absolute;
	color:red;
	top:575px;
	left:20px;
}
.modify_button{
	width:360px;
	height:50px;
	margin-left:10px;
	margin-top:648px;
	color:white;
	font-size:22px;
	font-weight:bold;
	background-color:#bcd19b;
	border-radius:5px;
	border-color:white
}
.modify_button:hover{
	background-color:green;
	transition:0.9s;
}
</style>
<div class="modifyPage_main_box">
<form action="modify.do" method="POST" onsubmit="return inputValidation()">
	<input type="hidden" name="id" value="${user.id }"/>
	<div class="profile_img">
		<img id='preview' src="${ user.photo}" alt="이미지 불러오기 오류">
	</div>
	<input type="hidden" id="photo" name="photo" value=${user.photo }>
	<button type="button"  class="changeProfile" onclick="userPhotoChange()">프로필 사진 수정</button>
	<div class="modifyPage_user_profile">
		<div class="password_input_form">
			<div class="current_password">
				<span>현재 비밀번호 </span>
				<input id="pw" type="password">
			</div>
			<div class="change_password_ori"> 
				<span>바꿀 비밀번호 </span>
				<input id="ori" type="password" name="password" >
			</div>
			<div class="change_password"> 
				<span>비밀번호 확인</span>
				<input id="ori_check" type="password" >
			</div>
		</div>
	</div>
	<div class="nickname_input_form">
		<span> 닉네임 </span>
		<input id="nick" type="text" name="nickname" placeholder="${user.nickname }"
				onkeyup="onNicknameKeyUp()">
	</div>
	<div class="errMsg"></div>
	<button class="modify_button">사용자 정보 수정 </button>
</form>
</div>