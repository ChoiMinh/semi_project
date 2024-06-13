<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<script>

	function findsubmit(){
		window.open("passwordfind.do","windowform","width=370px, height=200px, location=no,menubar=no,resizable=no,titlebar=no,left=300,top=300");
		window.location.replace("/");
	}

</script>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/mainpage/loginpage.css">
</head>
<body>
	<div class="login">
		<div class="line">
			<div class="find">
				<div class="form">
					<div class="findpswd"> 비밀번호를 찾으려는 아이디를 입력하세요. </div>
					<form action="passwordfind.do" target="windowform" method="POST" onsubmit="findsubmit()">
					<table>	
						<tr>		
							<th> 아이디 </th>
							<td><input type="text" name="user_id" id="findpswd" /></td>
						</tr>
						<tr>
							<th colspan="2"><input id="pswdBtn" type="submit" value="비밀번호 찾기" /></th>
						</tr>
					</table>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>