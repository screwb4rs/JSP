<%@ page language="java" contentType="text/html; charset=UTF-8"
   	import = "java.util.*, sec01.ex01.*"
    pageEncoding="UTF-8"
    isELIgnored="false"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<%
	request.setCharacterEncoding("UTF-8");
	//String sessionID = (String)session.getAttribute("sessionID");
%>

<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	   <title>로그인성공</title>
	   <link rel="stylesheet" href="../css/layout.css">
	   <style>
	   		#wrap{margin-left:auto; margin-right:auto;text-align:center;}
	   </style>
	   <script type="text/javascript">
	   		function logout(){
	   			alert("로그아웃 되었습니다.");
	   			location.href="../movieMember/logout.jsp";
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
					<%
						if(session == null || !request.isRequestedSessionIdValid()){
					%>
					<li><a href="../movieMember/loginForm.jsp">로그인</a></li>
					<li><a href="../movieMember/newMemberForm.jsp">회원가입</a></li>
					<%
						}
						else{
					%>
					<li><a href="../movieMember/logout.jsp">로그아웃</a></li>
					<%
						}
					%>
					<li><a href="${contextPath}/member/members.do">회원정보</a>
		 		</ul>
		   </nav>
		   
		   <section>
		   		<article>
		   		
		   		</article>
		   </section>
		   
		   <aside>
		   <div id="wrap">
			<%
				// 로그인상태가 아니라면 로그인창으로 이동
				if(session.getAttribute("sessionID") == null){
					response.sendRedirect("../movieMember/loginForm.jsp");
				}
				else{
			%>
				<h2 align="center">반갑습니다.<%= session.getAttribute("sessionID") %>님</h2>
			<%
				}
			%>
			</div>
		   </aside>
		   
		   <footer>
		   </footer>
	   </div>
	</body>	
</html>