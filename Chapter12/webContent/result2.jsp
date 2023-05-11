<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 값 받아오는 스크립 트릿 -->
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("user_id");
	String pw = request.getParameter("user_pw");
%>
<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>로그인 결과</title>
	</head>
	<body>
		<%
			if(id == null || id.length() == 0){
		%>
				아이디를 입력하세요. <br>
				<a href="/Chapter12/login.html">로그인하기</a>
		<%
			}
			else{
		%>
				<h1>로그인 결과 출력</h1>
				<h2><%= id %>님 환영합니다.</h2>
		<%
			}
		%>
	</body>
</html>