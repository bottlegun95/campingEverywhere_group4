<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i|Playfair+Display:400,400i,500,500i,600,600i,700,700i&subset=cyrillic"
	rel="stylesheet">

<style type="text/css">
header {
	display: flex;
	justify-content: center;
}

.loginBox {
	width: 30%;
	margin: 100px auto;
}

form {
	padding: 10px;
}

.input-box {
	position: relative;
	margin: 10px 0;
}

.input-box>input {
	background: transparent;
	border: none;
	border-bottom: solid 1px #ccc;
	padding: 20px 0px 5px 0px;
	font-size: 14pt;
	width: 100%;
}

input::placeholder {
	color: transparent;
}

input:placeholder-shown+label {
	color: #aaa;
	font-size: 14pt;
	top: 15px;
}

input:focus+label, label {
	color: #8aa1a1;
	font-size: 10pt;
	pointer-events: none;
	position: absolute;
	left: 0px;
	top: 0px;
	transition: all 0.2s ease;
	-webkit-transition: all 0.2s ease;
	-moz-transition: all 0.2s ease;
	-o-transition: all 0.2s ease;
}

input:focus, input:not(:placeholder-shown) {
	border-bottom: solid 1px #8aa1a1;
	outline: none;
}

input:autofill, input:autofill:hover, input:autofill:focus, input:autofill:active
	{
	-webkit-text-fill-color: #000;
	-webkit-box-shadow: 0 0 0px 1000px #fff inset;
	box-shadow: 0 0 0px 1000px transparent inset;
	transition: background-color 5000s ease-in-out 0s;
}

input[type=submit] {
	background-color: #8aa1a1;
	border: none;
	color: white;
	border-radius: 5px;
	width: 100%;
	height: 35px;
	font-size: 14pt;
	margin-top: 60px;
}

#forgot {
	text-align: right;
	font-size: 12pt;
	color: rgb(164, 164, 164);
	margin: 10px 0px;
	cursor: pointer;
}
</style>
<title>로그인 페이지</title>
</head>
<body>
	<div class="loginBox">
		<header>
			<h2>Login</h2>
		</header>
		<form id="log_frm" action="memberLogin.do" method="post">

			<div class="input-box">
				<input type="email" id="memberId" name="memberId"
					required="required" placeholder="아이디"> <label
					for="memberId">아이디</label>
			</div>

			<div class="input-box">
				<input type="password" id="memberPw" name="memberPw"
					required="required" placeholder="비밀번호"> <label
					for="memberPw">비밀번호</label>
			</div>
			<div id="forgot" onclick="searchPw()">비밀번호 찾기</div>
			<input type="submit" value="로그인">

		</form>
	</div>
	<script type="text/javascript">
		function searchPw() {
			let name = prompt("이름을 입력해주세요.", "이름");
			let memberId = prompt("아이디를 입력해주세요.", "아이디");
			
			location.href = "searchPw.do?name=" + name + "&memberId=" + memberId;
		}
		
		window.onload = function() {
			if("${login}" == "fail") {
				alert("아이디 또는 패스워드가 틀렸습니다. 다시 입력해주세요.");
			} 
		}
	</script>
</body>
</html>