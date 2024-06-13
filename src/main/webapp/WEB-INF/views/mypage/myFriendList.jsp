<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="https://fonts.cdnfonts.com/css/jua" rel="stylesheet">
<script>
let id='${user.id}';
var data;
doGet(1);

function doGet(f_section){
	const xhr=new XMLHttpRequest();
	xhr.onload=function(){
		data=JSON.parse(xhr.response);
		console.dir(JSON.parse(xhr.response));
		makeComponent(data,f_section);
	}
	xhr.open("GET","http://localhost:8099/friendList.do?f_section="+f_section+"&id="+id,true);
	xhr.send();
}

function doModify(url){
	const xhr=new XMLHttpRequest();
	xhr.onload=function(){
		console.dir("성공");
		history.go(0);
	}
	xhr.open("GET","http://localhost:8099/"+url, true);
	xhr.send();
}

function friend_list(){
	doGet(1);
}
function friend_receive_list(){
	doGet(2);
}
function friend_send_list(){
	doGet(3);
}

function deleteFriend(btn){
	console.dir(btn);
	let id=btn.dataset.id;
	let f_id=btn.dataset.f_id;
	if(btn.dataset.f_section==1){
		doModify("delete/Friend.do?id="+id+"&f_id="+f_id);
	}else{
		doModify("delete/sendFriend.do?id="+id+"&f_id="+f_id);
	}
}

function addFriend(btn){
	console.dir(btn);
	let id=btn.dataset.id;
	let f_id=btn.dataset.f_id;
	doModify("insert/Friend.do?id="+id+"&f_id="+f_id);
}


function makeComponent(d,f_section){
	let container=document.querySelector(".friend_container");
	container.innerHTML="";
	for(let i=0;i<d.length;i++){
		container.innerHTML+=`
			<div class="component">
				<img src=\${d[i].photo}>
				<div class="component_text">\${d[i].nickname}</div>
				<button type="button" onclick=\${f_section==1 || f_section==3?"deleteFriend(this)":"addFriend(this)"} class="funButton" data-f_id=\${d[i].id}
					data-id=\${id} data-f_section=\${f_section}>\${f_section==1 || f_section==3?"삭제" : "추가" }</button>
			</div>
		`;
	}
}
"friendList.do?f_section=1&id=${user.id}"
</script>
<style>
div{
	width:30px;
	height:30px;
}

.friend_box{
	position:absolute;
	left:5px;
	top:5px;
	width:404px;
	height:735px;
}
.top_menu{
	width:404px;
	height:40px;
}
.top_menu > button{
	background-color:#FFFFFF;
	font-weight:bold;
	font-size:15px;
	border-radius:5px;
	border:2px solid green;
	width:130px;
	height:40px;
	margin:0px;
}
.top_menu > button:hover{
	background-color:green;
	color:white;
}
.friend_container{
	width:400px;
	height:690px;
	border-left:5px solid green;
	border-right:5px solid green;
	border-bottom:5px solid green;
	border-radius:5px;
	overflow-y:scroll;
	-ms-overflow-style: none; 
}
.friend_container::-webkit-scrollbar {
    display: none; 
}
.component{
	background-color:#90C293;
	position:relative;
	width:400px;
	height:250px;
	border-bottom:2px dotted green;
	margin-bottom:55px;
}
.component > img{
	padding:5px;
	width:200px;
	height:200px;
	border-radius:30px;
}
.component > div{
	position:absolute;
	font-family: 'Jua', sans-serif;
	left:230px;
	top:22px;
	font-weight:bold;
	font-size:42px;
	color:white;
}
.funButton{
	position:absolute;
	left:241px;
	top:115px;
	width:110px;
	height:40px;
	color:black;
	border-radius:10px;
	border:none;
}
.funButton:hover{
	background-color:red;
	color:white;
}
</style>
<div class="friend_box">
	<div class="top_menu">
		<button type="button" class="friend_list" onclick='friend_list()'>친구 목록</button>
		<button type="button" class="friend_receive_list" onclick='friend_receive_list()'>받은 친구 요청</button>
		<button type="button" class="friend_send_list" onclick='friend_send_list()'>보낸 친구 요청</button>
	</div>
	<div class="friend_container"></div>
</div>
