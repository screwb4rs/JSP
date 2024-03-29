<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	isELIgnored="false" 
%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"  />  

<%
	request.setCharacterEncoding("UTF-8");
	String nextPage = request.getParameter("nextPage");
%>
  
<!DOCTYPE html>
<html>
	<head>
	<!-- 
	<c:choose>
   		<c:when test='${msg=="addMember" }'>
      		<script>
      		   window.onload=function(){
       	  	     alert("회원을 등록했습니다.");
               }
      		</script>
   		</c:when>
   		<c:when test= '${msg=="deleted" }'>
      		<script>
				window.onload=function(){
					alert("회원 정보를 삭제했습니다.");
      			} 
      		</script>
		</c:when>
		<c:when test='${msg=="logout" }'>
      		<script>
      		   window.onload=function(){
       	  	     alert("로그아웃 되었습니다.");
               }
      		</script>
   		</c:when>
	</c:choose>
	 -->
	<meta charset="UTF-8">
		<title>영화관홈페이지</title>
	   	<link rel="stylesheet" href="../css/layout.css">
	</head>
	<body>
	   <div>
		   <header>
		   		<hgroup>
		   			<h1>KGV</h1>
		   		</hgroup>
		   </header>
		   
		   <nav>
				<jsp:include page="../include/menu.jsp"/>
		   </nav>
		   
		   <section>
		   		<article>
		   			
		   		</article>
		   </section>
		   
		   <aside>
		   <%
		 		if(session.getAttribute("sessionID") != null){
		   %>
		   		<h2 align="center">반갑습니다.<%= session.getAttribute("sessionID") %>님</h2>
			<%
		 		}
			%>
		   </aside>
		   
		   <footer>
		   </footer>
	   </div>
	</body>	
</html>