<%@ page language="java" contentType="text/html; charset=UTF-8"
   	import = "java.util.*, sec01.ex01.*"
    pageEncoding="UTF-8"
    isELIgnored="false"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<%
	request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	   <title>회원가입</title>
	   <link rel="stylesheet" href="../css/layout.css">
	   <style>
        #wrap{margin-left:auto; margin-right:auto;text-align:center;}
        table{border:3px solid black}
        td{border:1px solid black}
       </style>
	   <script type = "text/javascript">
	   		window.onload();
	   		
	   		function idCheck(){
	   			var id = document.getElementById("id").value;
	   			var url = "idCheck.jsp?id="+id;
	   			window.open(url, "중복확인", "width=300,height=200");
	   		}
	   		function checkInfo(){
	   			var id = document.getElementById("id").value;
	   			var pwd = document.getElementById("pwd").value;
	   			var pwdCheck = document.getElementById("pwdCheck").value;
	   			
	   			var space = /\s/;
	   			
	   			if(space.exec(id)){
	   				id = id.replace(/\s| /gi,"");
	   				alert("6~12자리의 영문 소문자 또는 영문 소문자+숫자 아이디를 입력해 주세요.");
	   				return false;
	   			}
	   			if(space.exec(pwd) || space.exec(pwdCheck)){
	   				pwd = pwd.replace(/\s| /gi,"");
	   				pwdCheck = pwdCheck.replace(/\s| /gi,"");
	   				alert("영문자, 숫자를 조합하여 8~12자리 비밀번호를 입력해주세요.");
	   				return false;
	   			}
	   			if(pwd != pwdCheck){
	   				alert("입력된 비밀번호가 다릅니다.");
	   				return false;
	   			}
	   			else{
	   				return true;
	   			}
	   		}
	   		function home(){
		   		location.href="../HomePage/HomePage.jsp";
		}
	   </script>
	</head>
	
	<body>
		<div>
			<header>
				<hgroup>
					<h1>KGV</h1>
				</hgroup>
			</header>
		   
			<nav>
				<ul>
				   	<li><a href="#">영화</a></li>
					<li><a href="#">극장</a></li>
					<li><a href="#">예매</a></li>
					<li><a href="../movieMember/loginForm.jsp">로그인</a></li>
					<li><a href="../movieMember/newMemberForm.jsp">회원가입</a></li>
					<li><a href="${contextPath}/member/members.do">회원정보</a>
		 		</ul>
			</nav>
		   
			<section>
				<article>
		   			
				</article>
			</section>
		   
			<aside>
				<div id="wrap">
											<!-- 버튼을 submit으로하면 함수호출값 false여도 바로 액션으로 넘어감 -->
											<!-- 그래서 form에 onsubmit을 사용해야함 -->
					<form method="post" action="${contextPath }/member/addMember.do" onsubmit="return checkInfo()">
						<table align="center">
							<tr>
								<td align="left">아이디</td>
								<td align="left">
									<input type="text" name="id" id="id" required>
									<input type="button" value="중복확인" onclick="idCheck()">
								</td>
							</tr>
							<tr>
								<td align="left">비밀번호</td>
								<td align="left">
									<input type="password" name="pwd" id="pwd" required>
								</td>
							</tr>
							<tr>
								<td align="left">비밀번호 확인</td>
								<td align="left">
									<input type="password" name="pwdCheck" id="pwdCheck" required>
								</td>
							</tr>
							<tr>
								<td align="left">이름</td>
								<td align="left">
									<input type="text" name="name" required>
								</td>
							</tr>
							<tr>
								<td align="left">이메일</td>
								<td align="left">
									<input type="text" name="email" required>
								</td>
							</tr>
						</table>
						<br>
							<input type="submit" value="가입하기"/>
							<input type="button" value="취소" onclick="home()"/>
					</form>
				</div>
			</aside>
			<footer>
			</footer>
		</div>
	</body>	
</html>