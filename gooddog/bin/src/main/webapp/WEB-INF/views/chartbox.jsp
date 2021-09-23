<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>chatBox</title>

<link rel="stylesheet" href="${path}/resources/css/userCSS/chat.css">
<link href="https://gitcdn.github.io/bootstrap-toggle/2.2.2/css/bootstrap-toggle.min.css" rel="stylesheet">
</head>
<body>


<div id="container">
	<main>
	<div>
		<div id="title">
			<h3>여기는 방제목</h3>
		</div>
		<ul id="chat">
			<li class="you">
				<div class="entete">
					<span class="status green"></span>
					<h2>상대방아이디</h2>
				</div>
				<div class="message">
					메세지
				</div>
			</li>
			<li class="me">
				<div class="entete">
					<h2>내아이디</h2>
					<span class="status blue"></span>
				</div>
				<div class="message">
					메세지
				</div>
			</li>

		</ul>
		<footer>
		<form>
			<textarea placeholder="메세지를 입력해주세요"></textarea>
			<a href="">Send</a>
		</form>
		</footer>
		</div>
	</main>
</div>


</body>
</html> 