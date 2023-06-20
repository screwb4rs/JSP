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
		<meta charset="UTF-8">
		<title>영화상세정보</title>
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
					<c:forEach  var="mv" items="${movieview }" >
						<tr align="center">
							<td>${mv.movie_num }</td><br>
							<td>${mv.movie_name }</td><br>
							<td>${mv.movie_content }</td><br>
							<td>${mv.member_id }</td><br>
							<td><a href="${contextPath}/member/modmovieForm.do?movie_num=${mv.movie_num }">수정하기</a></td>
						</tr>
					</c:forEach>
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