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
	<c:choose>
   		<c:when test='${msg=="idfalse" }'>
      		<script>
      		   window.onload=function(){
       	  	   		alert("아이디 또는 비밀번호가 맞지 않습니다. 확인 후 입력해주세요.");
               }
      		</script>
   		</c:when>
   		<c:when test= '${msg=="pwdfalse" }'>
      		<script>
        		window.onload=function(){
            		alert("아이디 또는 비밀번호가 맞지 않습니다. 확인 후 입력해주세요.");
       			} 
      		</script>
		</c:when>
	</c:choose>
	<meta charset="UTF-8">
	   <title>로그인</title>
	   <link rel="stylesheet" href="../css/layout.css">
	   
	   <style>
        #wrap{margin-left:auto; margin-right:auto;text-align:center;}
        table{border:3px solid black}
        td{border:1px solid black}
		</style>
    	
    	<script type = "text/javascript">
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
					<h1>로그인</h1><br>
					<form method="post" action="${contextPath }/member/login.do">
						<table align="center">
							<tr>
								<td align="left">아이디</td>
								<td align="left">
									<input type="text" name="id" required>
								</td>
							</tr>
							<tr>
								<td align="left">비밀번호</td>
								<td align="left">
									<input type="password" name="pwd" required>
								</td>
							</tr>
						</table>
						<br>
							<input type="submit" value="로그인"/>
							<input type="button" value="취소" onclick="home()"/>
					</form>
				</div>
			</aside>
			<footer>
			</footer>
		</div>
	</body>	
</html>