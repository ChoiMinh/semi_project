<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<script>
	function findsubmit(){
		window.open("loginfind.do","windowform","width=370px, height=200px, location=no,menubar=no,resizable=no,titlebar=no,left=300,top=300");
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
					<div class="findid"> 아이디 찾기 </div>
						<form action="loginfind.do" target="windowform" method="POST" onsubmit="findsubmit()">
						<table>
							<tr>
								<th> 이름 </th>
								<td><input type="text" name="nickname" id="findid" required/></td>
							</tr>
							<tr>
								<th> 이메일 </th>
								<td><input type="text" name="email" id="email" required/></td>
							</tr>
							<tr>
								<th colspan="2"><input id="idBtn" type="submit" value="아이디 찾기" /></th>
							</tr>
						</table>
						</form>
					</div>
				</div>
			</div>
		</div>
</body>
</html>