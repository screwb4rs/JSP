<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	isELIgnored="false" 
%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"  />  

<%
	request.setCharacterEncoding("UTF-8");
%>
  
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>로그아웃처리</title>
	   	<link rel="stylesheet" href="../css/layout.css">
	</head>
	<body>
		<%
			// 로그인 상태라면 세션삭제 후 홈페이지로 이동
			if(request.isRequestedSessionIdValid() || session != null){
				session.invalidate();
			}
			response.sendRedirect("../HomePage/HomePage.jsp");
		%>
		<!-- 
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
		   </aside>
		   
		   <footer>
		   </footer>
	   </div>
	    -->
	</body>	
</html>